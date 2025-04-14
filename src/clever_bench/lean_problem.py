from dataclasses import dataclass, field, asdict
from typing import List, Optional, Dict, Any
import json
import csv
import io


@dataclass
class Lemma:
    statement: str
    proof: str

    def to_dict(self):
        return asdict(self)


@dataclass
class ProblemSpecMetadata:
    function_signature: str
    docstring: str
    test_cases: List[Dict]

    def to_dict(self):
        return asdict(self)


@dataclass
class LeanProblem:
    problem_spec_metadata: Optional[ProblemSpecMetadata]
    problem_spec_nl: Optional[str]
    problem_spec_formal_ground_truth: Optional[str]
    problem_spec_formal_generated: Optional[str]
    isomorphism_theorem: Optional[str]
    isomorphism_proof: Optional[str]
    implementation_signature: Optional[str]
    test_cases_lean: Optional[str]
    correctness_theorem: Optional[str]
    correctness_proof: Optional[str]
    helper_definitions: List[str] = field(default_factory=list)
    isomorphism_helper_lemmas: List[Lemma] = field(default_factory=list)
    correctness_helper_lemmas: List[Lemma] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "problem_spec_metadata": self.problem_spec_metadata.to_dict() if self.problem_spec_metadata else None,
            "problem_spec_nl": self.problem_spec_nl,
            "problem_spec_formal_ground_truth": self.problem_spec_formal_ground_truth,
            "problem_spec_formal_generated": self.problem_spec_formal_generated,
            "isomorphism_theorem": self.isomorphism_theorem,
            "isomorphism_proof": self.isomorphism_proof,
            "implementation_signature": self.implementation_signature,
            "test_cases_lean": self.test_cases_lean,
            "correctness_theorem": self.correctness_theorem,
            "correctness_proof": self.correctness_proof,
            "helper_definitions": self.helper_definitions,
            "isomorphism_helper_lemmas": [lemma.to_dict() for lemma in self.isomorphism_helper_lemmas],
            "correctness_helper_lemmas": [lemma.to_dict() for lemma in self.correctness_helper_lemmas]
        }

    def to_json(self) -> str:
        return json.dumps(self.to_dict(), indent=2)

    def to_csv(self) -> tuple[List[str], List[str]]:
        """
        Returns a tuple: (headers, row) where both are flat lists.
        Suitable for writing to a CSV file.
        """
        d = self.to_dict()

        def flatten_lemmas(lemmas: List[Dict[str, str]]) -> str:
            return "\n\n".join([f"STATEMENT:\n{l['statement']}\nPROOF:\n{l['proof']}" for l in lemmas])

        row = {
            "function_signature": d["problem_spec_metadata"]["function_signature"] if d["problem_spec_metadata"] else "",
            "docstring": d["problem_spec_metadata"]["docstring"] if d["problem_spec_metadata"] else "",
            "test_cases": json.dumps(d["problem_spec_metadata"]["test_cases"]) if d["problem_spec_metadata"] else "",
            "problem_spec_nl": d["problem_spec_nl"],
            "problem_spec_formal_ground_truth": d["problem_spec_formal_ground_truth"],
            "problem_spec_formal_generated": d["problem_spec_formal_generated"],
            "isomorphism_theorem": d["isomorphism_theorem"],
            "isomorphism_proof": d["isomorphism_proof"],
            "implementation_signature": d["implementation_signature"],
            "test_cases_lean": d["test_cases_lean"],
            "correctness_theorem": d["correctness_theorem"],
            "correctness_proof": d["correctness_proof"],
            "helper_definitions": "\n\n".join(d["helper_definitions"]),
            "isomorphism_helper_lemmas": flatten_lemmas(d["isomorphism_helper_lemmas"]),
            "correctness_helper_lemmas": flatten_lemmas(d["correctness_helper_lemmas"]),
        }

        headers = list(row.keys())
        values = list(row.values())
        return headers, values
