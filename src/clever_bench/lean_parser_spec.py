import re
import yaml
from clever_bench.lean_problem import LeanProblem, ProblemSpecMetadata, Lemma
from typing import List, Optional

class LeanSpecParser:
    def __init__(self, lean_code: str):
        self.lean_code = lean_code
        self.sections = self._extract_sections()

    def _extract_sections(self):
        pattern = re.compile(
            r"--\s*start_def\s+(\w+)\s*[\r\n]+(.*?)--\s*end_def\s+\1",
            re.DOTALL | re.IGNORECASE,
        )
        return {
            match.group(1).strip(): match.group(2).strip()
            for match in pattern.finditer(self.lean_code)
        }

    def _parse_yaml_block(self, raw: str) -> Optional[ProblemSpecMetadata]:
        match = re.search(r"/--(.*?)-/", raw, re.DOTALL)
        if not match:
            return None
        try:
            parsed = yaml.safe_load(match.group(1).strip())
            return ProblemSpecMetadata(
                function_signature=parsed.get("function_signature", ""),
                docstring=parsed.get("docstring", ""),
                test_cases=parsed.get("test_cases", []),
            )
        except yaml.YAMLError:
            return None

    def _get_lemmas(self, prefix: str) -> List[Lemma]:
        statements = sorted(
            k for k in self.sections if k.startswith(prefix + "_") and not k.endswith("_proof")
        )
        return [
            Lemma(
                statement=self.sections[k],
                proof=self.sections.get(k + "_proof", "")
            )
            for k in statements
        ]

    def parse(self) -> LeanProblem:
        metadata_raw = self.sections.get("problem_details")
        metadata = self._parse_yaml_block(metadata_raw) if metadata_raw else None
        nl_spec = None
        if metadata:
            nl_spec = f"{metadata.function_signature}\n\"\"\"{metadata.docstring}\"\"\""

        return LeanProblem(
            problem_spec_metadata=metadata,
            problem_spec_nl=nl_spec,
            problem_spec_formal_ground_truth=self.sections.get("problem_spec"),
            problem_spec_formal_generated=self.sections.get("generated_spec"),
            isomorphism_theorem=self.sections.get("spec_isomorphism"),
            isomorphism_proof=self.sections.get("spec_isomorphism_proof"),
            implementation_signature=self.sections.get("implementation_signature"),
            test_cases_lean=self.sections.get("test_cases"),
            correctness_theorem=self.sections.get("correctness_definition"),
            correctness_proof=self.sections.get("correctness_proof"),
            isomorphism_helper_lemmas=self._get_lemmas("iso_helper_lemmas"),
            correctness_helper_lemmas=self._get_lemmas("correctness_helper_lemmas")
        )
