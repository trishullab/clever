from dataclasses import dataclass, field, asdict
from typing import List, Optional, Dict, Any
from enum import Enum, auto
import json

class TaskComponent(Enum):
    SPEC_GENERATION = auto()     # Task 1
    IMPL_GENERATION = auto()     # Task 2
    PROOF_GENERATION = auto()    # Task 3
    SPEC_ISOMORPHISM = auto()    # Task 4

    def __str__(self):
        return self.name

    def __repr__(self):
        return f"TaskComponent.{self.name}"

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
    problem_id: int
    problem_spec_metadata: Optional[ProblemSpecMetadata]
    problem_spec_nl: Optional[str]
    problem_spec_formal_ground_truth: Optional[str]
    problem_spec_formal_generated: Optional[str]
    isomorphism_theorem: Optional[str]
    isomorphism_proof: Optional[str]
    implementation_signature: Optional[str]
    implementation: Optional[str]
    test_cases_lean: Optional[str]
    correctness_theorem: Optional[str]
    correctness_proof: Optional[str]
    helper_definitions: List[str] = field(default_factory=list)
    isomorphism_helper_lemmas: List[Lemma] = field(default_factory=list)
    correctness_helper_lemmas: List[Lemma] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "problem_id": self.problem_id,
            "problem_spec_metadata": self.problem_spec_metadata.to_dict() if self.problem_spec_metadata else None,
            "problem_spec_nl": self.problem_spec_nl,
            "problem_spec_formal_ground_truth": self.problem_spec_formal_ground_truth,
            "problem_spec_formal_generated": self.problem_spec_formal_generated,
            "isomorphism_theorem": self.isomorphism_theorem,
            "isomorphism_proof": self.isomorphism_proof,
            "implementation_signature": self.implementation_signature,
            "implementation": self.implementation,
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
            "implementation": d["implementation"],
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

@dataclass
class LeanProblemView:
    problem_id: str
    task_component: TaskComponent
    function_signature: Optional[str] = None
    problem_spec_nl: Optional[str] = None
    problem_spec_formal_ground_truth: Optional[str] = None
    isomorphism_theorem: Optional[str] = None
    implementation_signature: Optional[str] = None
    test_cases_lean: Optional[str] = None
    correctness_theorem: Optional[str] = None
    problem_spec_formal_generated: Optional[str] = None
    implementation: Optional[str] = None
    correctness_proof: Optional[str] = None
    isomorphism_proof: Optional[str] = None
    helper_definitions: List[str] = field(default_factory=list)
    isomorphism_helper_lemmas: List[Lemma] = field(default_factory=list)
    correctness_helper_lemmas: List[Lemma] = field(default_factory=list)

    def hide_params(self, *args):
        """
        Hide the parameters specified in args.
        """
        for arg in args:
            if hasattr(self, arg):
                if isinstance(getattr(self, arg), list):
                    setattr(self, arg, [])
                else:
                    setattr(self, arg, None)

def format_problem_as_lean_with_line_ranges(problem: LeanProblemView) -> tuple[str, dict]:
    parts = ["import Imports.AllImports"]
    line_counter = 1  # account for import line
    ranges = {}

    def append_block(label: str, content: Optional[str], key: Optional[str] = None, is_proof=False):
        nonlocal line_counter
        if is_proof and content is None:
            content = "by sorry"
        if content is None:
            if key:
                ranges[key] = (float("inf"), float("-inf"))
            return

        header = f"-- {label}"
        body = content.strip()
        start = line_counter + 1
        parts.append(header)
        parts.append(body)
        line_counter += 2 + body.count("\n")
        if key:
            ranges[key] = (start - 1, start + body.count("\n") + 1)

    # Do NOT dump function_signature (it's Python)

    if problem.problem_spec_nl:
        append_block("NL Spec", f"/--\n{problem.problem_spec_nl.strip()}\n-/")

    append_block("Generated Spec", problem.problem_spec_formal_generated)
    append_block("Ground Truth Spec", problem.problem_spec_formal_ground_truth)

    # Isomorphism helper lemmas FIRST
    isomorphism_line_start = line_counter
    for lemma in problem.isomorphism_helper_lemmas:
        append_block("Isomorphism Lemma", f"{lemma.statement.strip()}\n{lemma.proof.strip()}")

    append_block("Isomorphism Theorem", problem.isomorphism_theorem)
    if problem.isomorphism_theorem:
        append_block("Isomorphism Proof", problem.isomorphism_proof, key="isomorphism", is_proof=True)
    isomorphism_line_end = line_counter
    if "isomorphism" in ranges:
        ranges["isomorphism"] = (isomorphism_line_start, isomorphism_line_end)

    # Implementation
    append_block("Implementation Signature", problem.implementation_signature)
    append_block("Implementation", problem.implementation)

    append_block("Test Cases", problem.test_cases_lean)

    # Correctness helper lemmas FIRST
    correctness_line_start = line_counter
    for lemma in problem.correctness_helper_lemmas:
        append_block("Correctness Lemma", f"{lemma.statement.strip()}\n{lemma.proof.strip()}")

    append_block("Correctness Theorem", problem.correctness_theorem)
    if problem.correctness_theorem:
        append_block("Correctness Proof", problem.correctness_proof, key="correctness", is_proof=True)
    correctness_line_end = line_counter
    if "correctness" in ranges:
        ranges["correctness"] = (correctness_line_start, correctness_line_end)

    return "\n\n".join(parts), ranges
