import asyncio
import uuid
import os
from clever_bench.lean_problem import LeanProblemView, TaskComponent, format_problem_as_lean_with_line_ranges
from clever_bench.benchmark import Benchmark
from pathlib import Path
from collections import namedtuple

ValidationResult = namedtuple("ValidationResult", ["isomorphism_ok", "correctness_ok"])


class ProblemViewTask:
    def __init__(self, benchmark: Benchmark, component: TaskComponent, lean_folder: str):
        self.benchmark = benchmark
        self.component = component
        self.lean_folder_str = lean_folder
        self.lean_folder_path = Path(lean_folder)
        os.makedirs(self.lean_folder_path / "temp", exist_ok=True)

    def get_visible_problems(self) -> list[LeanProblemView]:
        views = []

        for problem in self.benchmark.problems:
            meta = problem.problem_spec_metadata
            view = LeanProblemView(
                task_component=self.component,
                function_signature=meta.function_signature if meta else None,
                problem_spec_nl=problem.problem_spec_nl,
                problem_spec_formal_ground_truth=problem.problem_spec_formal_ground_truth,
                isomorphism_theorem=problem.isomorphism_theorem,
                implementation_signature=problem.implementation_signature,
                test_cases_lean=problem.test_cases_lean,
                correctness_theorem=problem.correctness_theorem,
                problem_spec_formal_generated=problem.problem_spec_formal_generated,
                implementation=problem.implementation,
                correctness_proof=problem.correctness_proof,
                isomorphism_proof=problem.isomorphism_proof,
                helper_definitions=problem.helper_definitions,
                isomorphism_helper_lemmas=problem.isomorphism_helper_lemmas,
                correctness_helper_lemmas=problem.correctness_helper_lemmas
            )

            if self.component == TaskComponent.SPEC_GENERATION:
                view.hide_params(
                    "problem_spec_formal_ground_truth",
                    "implementation_signature",
                    "test_cases_lean",
                    "correctness_theorem",
                    "correctness_proof",
                    "implementation",
                    "isomorphism_proof",
                    "isomorphism_helper_lemmas",
                    "correctness_helper_lemmas"
                )

            elif self.component == TaskComponent.IMPL_GENERATION:
                view.hide_params(
                    "problem_spec_formal_generated",
                    "isomorphism_theorem",
                    "isomorphism_proof",
                    "correctness_proof",
                    "isomorphism_helper_lemmas",
                    "correctness_helper_lemmas"
                )

            elif self.component == TaskComponent.PROOF_GENERATION:
                view.hide_params(
                    "problem_spec_formal_generated",
                    "isomorphism_theorem",
                    "isomorphism_proof",
                    "isomorphism_helper_lemmas"
                )

            views.append(view)

        return views
    
    async def submit_async(self, problem: LeanProblemView, timeout_in_ms: float) -> ValidationResult:
        filename = f"{uuid.uuid4().hex[:8]}.lean"
        file_path = self.lean_folder_path / "temp"/ filename

        try:
            lean_code, proof_ranges = format_problem_as_lean_with_line_ranges(problem)
            file_path.write_text(lean_code, encoding="utf-8")

            proc = await asyncio.create_subprocess_exec(
                "lake", "lean", f"temp/{file_path.name}",
                cwd=str(self.lean_folder_path),
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.STDOUT
            )

            try:
                stdout, _ = await asyncio.wait_for(proc.communicate(), timeout=timeout_in_ms / 1000)
            except asyncio.TimeoutError:
                proc.kill()
                await proc.wait()
                return ValidationResult(isomorphism_ok=False, correctness_ok=False)

            output = stdout.decode()

            if proc.returncode != 0:
                return ValidationResult(isomorphism_ok=False, correctness_ok=False)

            output = stdout.decode()
            sorry_lines = self._extract_sorry_lines(output, filename)

            return self._check_sorries_against_ranges(sorry_lines, proof_ranges)

        finally:
            if file_path.exists():
                file_path.unlink()

    def _extract_sorry_lines(self, build_log: str, filename: str) -> list[int]:
        """Extracts line numbers where 'sorry' occurs in the given filename."""
        sorry_lines = []
        for line in build_log.splitlines():
            if f"{filename}:" in line and "declaration uses 'sorry'" in line:
                try:
                    parts = line.split(":")
                    line_no = int(parts[1])
                    sorry_lines.append(line_no)
                except Exception:
                    pass
        return sorry_lines

    def _check_sorries_against_ranges(self, sorry_lines: list[int], proof_ranges: dict) -> ValidationResult:
        iso_start, iso_end = proof_ranges.get("isomorphism", (float("inf"), float("-inf")))
        cor_start, cor_end = proof_ranges.get("correctness", (float("inf"), float("-inf")))

        iso_ok = all(iso_start <= ln <= iso_end for ln in sorry_lines if iso_start != float("inf"))
        cor_ok = all(cor_start <= ln <= cor_end for ln in sorry_lines if cor_start != float("inf"))
        other_sorries = [
            ln for ln in sorry_lines
            if not (iso_start <= ln <= iso_end or cor_start <= ln <= cor_end)
        ]

        return ValidationResult(
            isomorphism_ok=iso_ok and not any(ln for ln in sorry_lines if ln < iso_start or ln > iso_end),
            correctness_ok=cor_ok and not any(ln for ln in sorry_lines if ln < cor_start or ln > cor_end),
        )