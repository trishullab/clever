import re
import yaml
from clever_bench.lean_problem import LeanProblem, ProblemSpecMetadata, Lemma
from typing import List, Optional

class LeanSpecParser:
    def __init__(self, lean_code: str, helper_definitions: str = None, problem_id: int = None, is_sample: bool = False): 
        self.lean_code = lean_code
        self.helper_definitions = helper_definitions
        self.problem_id = problem_id
        self.is_sample = is_sample
        self.sections = self._extract_sections()

    def _extract_sections(self):
        pattern = re.compile(
            r"--\s*start_def\s+(\w+)\s*[\r\n]+(.*?)--\s*end_def\s+\1",
            re.DOTALL | re.IGNORECASE,
        )

        sections = {}
        for match in pattern.finditer(self.lean_code):
            key = match.group(1).strip()
            value = match.group(2).strip()
            if key not in sections:
                sections[key] = []
            sections[key].append(value)
        return sections

    def _parse_helper_definitions(self) -> List[str]:
        if not self.helper_definitions or self.problem_id is None:
            return []

        pattern = re.compile(
            r"--\s*start_def\s+helper_definitions\s*[\r\n]+(.*?)--\s*end_def\s+helper_definitions",
            re.DOTALL | re.IGNORECASE
        )

        matches = pattern.findall(self.helper_definitions)
        selected_blocks = []

        for block in matches:
            yaml_match = re.search(r"/--(.*?)-/", block, re.DOTALL)
            if not yaml_match:
                continue

            try:
                metadata = yaml.safe_load(yaml_match.group(1).strip())
                field = "sample_problems" if self.is_sample else "problems"
                relevant_ids = metadata.get(field, [])
                if self.problem_id in relevant_ids:
                    selected_blocks.append(block.strip())
            except Exception:
                continue  # Skip bad metadata silently

        return selected_blocks


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
        statements = self.sections.get(prefix, [])
        proofs = self.sections.get(f"{prefix}_proof", [])
        max_len = max(len(statements), len(proofs))

        lemmas = []
        for i in range(max_len):
            stmt = statements[i] if i < len(statements) else ""
            proof = proofs[i] if i < len(proofs) else ""
            lemmas.append(Lemma(statement=stmt, proof=proof))
        return lemmas

    def _get_first(self, key: str) -> Optional[str]:
        value = self.sections.get(key)
        if isinstance(value, list):
            return value[0] if value else None
        return value

    def parse(self) -> LeanProblem:
        raw_metadata_block = self.sections.get("problem_details", [])
        metadata_raw = raw_metadata_block[0] if isinstance(raw_metadata_block, list) and raw_metadata_block else None
        metadata = self._parse_yaml_block(metadata_raw) if metadata_raw else None

        nl_spec = None
        if metadata:
            nl_spec = f"{metadata.function_signature}\n\"\"\"{metadata.docstring}\"\"\""

        return LeanProblem(
            problem_spec_metadata=metadata,
            problem_spec_nl=nl_spec,
            problem_spec_formal_ground_truth=self._get_first("problem_spec"),
            problem_spec_formal_generated=self._get_first("generated_spec"),
            isomorphism_theorem=self._get_first("spec_isomorphism"),
            isomorphism_proof=self._get_first("spec_isomorphism_proof"),
            implementation_signature=self._get_first("implementation_signature"),
            implementation=self._get_first("implementation"),
            test_cases_lean=self._get_first("test_cases"),
            correctness_theorem=self._get_first("correctness_definition"),
            correctness_proof=self._get_first("correctness_proof"),
            isomorphism_helper_lemmas=self._get_lemmas("iso_helper_lemmas"),
            correctness_helper_lemmas=self._get_lemmas("correctness_helper_lemmas"),
            helper_definitions=self._parse_helper_definitions()
        )