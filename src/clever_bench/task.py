import asyncio
import uuid
import os
import time
from clever_bench.lean_problem import LeanProblemView, TaskComponent, format_problem_as_lean_with_line_ranges
from clever_bench.benchmark import Benchmark, get_clever_lean_project_path
from pathlib import Path
from collections import namedtuple

ValidationResult = namedtuple("ValidationResult", 
    ["problem_id", 
    "isomorphism_ok", 
    "correctness_ok",
    "compilation_ok",
    "error_message",
    "lean_code"])


class ProblemViewTask:
    def __init__(self, benchmark: Benchmark, component: TaskComponent, lean_folder: str = None, report_dir: str = ".logs/reports"):
        self.benchmark = benchmark
        self.component = component
        self.lean_folder_str = lean_folder if lean_folder else get_clever_lean_project_path()
        self.lean_folder_path = Path(self.lean_folder_str)
        time_str = time.strftime("%Y-%m-%d_%H-%M-%S")
        self.report_dir = Path(report_dir) / time_str
        self.report_dir.mkdir(parents=True, exist_ok=True)
        os.makedirs(os.path.join(self.lean_folder_path, "temp"), exist_ok=True)
    
    def get_view(self, idx: int) -> LeanProblemView:
        problem = self.benchmark.get_problem(idx)
        meta = problem.problem_spec_metadata
        view = LeanProblemView(
            problem_id=str(idx),
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
        
        elif self.component == TaskComponent.SPEC_ISOMORPHISM:
            view.hide_params(
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
                "isomorphism_helper_lemmas",
                "correctness_helper_lemmas",
                "correctness_proof",
            )

        elif self.component == TaskComponent.PROOF_GENERATION:
            view.hide_params(
                "problem_spec_formal_generated",
                "isomorphism_theorem",
                "isomorphism_proof",
                "isomorphism_helper_lemmas",
                "correctness_helper_lemmas",
                "correctness_proof"
            )
        if view.test_cases_lean is not None:
            # Uncomment the test cases line by line
            test_cases_lines = [line.strip() for line in view.test_cases_lean.splitlines() if line.strip()]
            uncommented_test_cases = []
            for line in test_cases_lines:
                line = line.strip()
                if line.startswith("--"):
                    line = line[2:].strip()
                uncommented_test_cases.append(line)
            view.test_cases_lean = "\n".join(uncommented_test_cases)
        return view

    def get_visible_problems(self) -> list[LeanProblemView]:
        views = []

        for idx in range(len(self.benchmark.problems)):
            problem_idx = self.benchmark.problems[idx].problem_id
            view = self.get_view(problem_idx)
            views.append(view)

        return views
    
    async def submit_async(self, problem: LeanProblemView, timeout_in_ms: float) -> ValidationResult:
        assert isinstance(problem, LeanProblemView), "Expected a LeanProblemView instance"
        assert isinstance(problem.problem_id, str), "Expected problem_id to be a string"
        assert isinstance(int(problem.problem_id), int), "Expected problem_id should be convertible to int"
        original_problem = self.get_view(int(problem.problem_id))
        # Only change the proofs and helper lemmas
        original_problem.problem_spec_formal_generated = problem.problem_spec_formal_generated
        original_problem.implementation = problem.implementation
        original_problem.isomorphism_proof = problem.isomorphism_proof
        original_problem.correctness_proof = problem.correctness_proof
        original_problem.isomorphism_helper_lemmas = problem.isomorphism_helper_lemmas
        original_problem.correctness_helper_lemmas = problem.correctness_helper_lemmas
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
                return ValidationResult(
                    problem_id=problem.problem_id,
                    isomorphism_ok=False,
                    correctness_ok=False,
                    compilation_ok=False,
                    error_message="Timeout",
                    lean_code=lean_code
                )

            output = stdout.decode()

            if proc.returncode != 0:
                return ValidationResult(
                    problem_id=problem.problem_id,
                    isomorphism_ok=False,
                    correctness_ok=False,
                    compilation_ok=False,
                    error_message=output,
                    lean_code=lean_code
                )

            output = stdout.decode()
            sorry_lines = self._extract_sorry_lines(output, filename)

            return self._check_sorries_against_ranges(sorry_lines, proof_ranges, lean_code, problem.problem_id)

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

    def _check_sorries_against_ranges(self, sorry_lines: list[int], proof_ranges: dict, lean_code: str, problem_id: str) -> ValidationResult:
        iso_start, iso_end = proof_ranges.get("isomorphism", (float("inf"), float("-inf")))
        cor_start, cor_end = proof_ranges.get("correctness", (float("inf"), float("-inf")))

        iso_ok = all(iso_start <= ln <= iso_end for ln in sorry_lines if iso_start != float("inf"))
        cor_ok = all(cor_start <= ln <= cor_end for ln in sorry_lines if cor_start != float("inf"))
        other_sorries = [
            ln for ln in sorry_lines
            if not (iso_start <= ln <= iso_end or cor_start <= ln <= cor_end)
        ]

        return ValidationResult(
            problem_id=problem_id,
            isomorphism_ok=iso_ok and not any(ln for ln in sorry_lines if ln < iso_start or ln > iso_end),
            correctness_ok=cor_ok and not any(ln for ln in sorry_lines if ln < cor_start or ln > cor_end),
            compilation_ok=True,
            error_message=f"Sorry lines: {sorry_lines}, Other sorries: {other_sorries}",
            lean_code=lean_code
        )
    
    def submit_benchmark_and_get_report(self, solutions: list[LeanProblemView], timeout_in_ms_per_problem: float):
        submissions = []
        for problem in solutions:
            submission = self.submit_async(problem, timeout_in_ms_per_problem)
            submissions.append(submission)
        # Wait for all submissions to complete
        results = asyncio.run(asyncio.gather(*submissions))
        json_objects = []
        for result in results:
            if isinstance(result, ValidationResult):
                json_objects.append({"idx": result.problem_id, "isomorphism_ok": result.isomorphism_ok, "correctness_ok": result.correctness_ok})
                print(f"Problem ID: {result.problem_id}, Isomorphism OK: {result.isomorphism_ok}, Correctness OK: {result.correctness_ok}")
                with open(self.report_dir / f"problem_{result.problem_id}.lean", "w") as f:
                    f.write(result.lean_code)
            else:
                print("Error in submission")
        # Save the JSON objects to a file
        with open(self.report_dir / "results.json", "w") as f:
            import json
            json.dump(json_objects, f, indent=4)
        print(f"Results saved to {self.report_dir / 'results.json'}")
        # Print the aggregated results
        print(f"Total problems: {len(results)}")
        print(f"Problems with Isomorphism OK: {sum(1 for r in results if r.isomorphism_ok)}")
        print(f"Problems with Correctness OK: {sum(1 for r in results if r.correctness_ok)}")
        print(f"Problems with both OK: {sum(1 for r in results if r.isomorphism_ok and r.correctness_ok)}")
        print(f"Problems with neither OK: {sum(1 for r in results if not r.isomorphism_ok and not r.correctness_ok)}")
        print(f"Problems with only Isomorphism OK: {sum(1 for r in results if r.isomorphism_ok and not r.correctness_ok)}")
        print(f"Problems with only Correctness OK: {sum(1 for r in results if not r.isomorphism_ok and r.correctness_ok)}")
        print(f"Total Certificates: {sum(1 for r in results if r.isomorphism_ok or r.correctness_ok)}")
        print(f"Isomorphism Proof Accuracy: {sum(1 for r in results if r.isomorphism_ok) / len(results) * 100:.2f}%")
        print(f"Correctness Proof Accuracy: {sum(1 for r in results if r.correctness_ok) / len(results) * 100:.2f}%")
        return results