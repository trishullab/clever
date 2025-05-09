import os
import json
import csv
from typing import List, Tuple
from pathlib import Path
from clever_bench.lean_problem import LeanProblem
from clever_bench.lean_parser_spec import LeanSpecParser

def get_clever_lean_project_path() -> str:
    """
    Returns the path to the Clever Lean project directory.
    This function assumes that the script is run from the root directory of the project.
    """
    in_pkg_path = os.path.join(os.path.dirname(__file__), "lean4")
    if os.path.exists(in_pkg_path):
        return in_pkg_path
    else:
        return os.path.join(os.path.dirname(os.path.dirname(__file__)), "lean4")

def get_clever_lean_human_eval_directory() -> str:
    """
    Returns the path to the Clever Lean test directory.
    This function assumes that the script is run from the root directory of the project.
    """
    return os.path.join(get_clever_lean_project_path(), "human_eval")

def get_clever_lean_sample_examples_directory() -> str:
    """
    Returns the path to the Clever Lean sample problems directory.
    This function assumes that the script is run from the root directory of the project.
    """
    return os.path.join(get_clever_lean_project_path(), "sample_examples")

def get_helper_definition_file_path() -> str:
    """
    Returns the path to the Clever Lean helper definition file.
    This function assumes that the script is run from the root directory of the project.
    """
    return os.path.join(get_clever_lean_project_path(), "Imports", "AllImports.lean")

class Benchmark:
    def __init__(self, directory: str = None, helper_definition_file: str = None, is_sample: bool = False):
        self.project_path = get_clever_lean_project_path()
        self.directory = directory if directory else (get_clever_lean_human_eval_directory() if not is_sample else get_clever_lean_sample_examples_directory())
        self.helper_definition_file = helper_definition_file if helper_definition_file else get_helper_definition_file_path()
        self.is_sample = is_sample
        self.problems: List[LeanProblem] = []

    def load_all(self):
        lean_files = Path(self.directory).glob("*.lean")
        if self.helper_definition_file:
            with open(self.helper_definition_file, "r", encoding="utf-8") as f:
                helper_definitions = f.read()
        else:
            helper_definitions = None
        problems = []
        for lean_file in lean_files:
            problem_id = int(lean_file.stem.split("_")[1])  # Assuming the file name format is like "problem_{idx}.lean"
            with open(lean_file, "r", encoding="utf-8") as f:
                content = f.read()
                parser = LeanSpecParser(content, helper_definitions=helper_definitions, problem_id=problem_id, is_sample=self.is_sample)
                problem = parser.parse()
                problems.append((problem_id, problem))
        problems.sort(key=lambda x: x[0])
        for _, problem in problems:
            self.problems.append(problem)
    
    def get_problem(self, idx: int) -> LeanProblem:
        """
        Returns the LeanProblem at the given index.
        """
        if idx < 0 or idx >= len(self.problems):
            raise IndexError("Index out of range.")
        if self.problems[idx].problem_id == idx:
            return self.problems[idx]
        else:
            # Find the problem with the given ID
            for problem in self.problems:
                if problem.problem_id == idx:
                    return problem
        raise ValueError(f"Problem with ID {idx} not found.")

    def to_json(self) -> str:
        return json.dumps([problem.to_dict() for problem in self.problems], indent=2)

    def to_csv(self) -> Tuple[List[str], List[List[str]]]:
        """
        Returns (headers, list of rows). Each row corresponds to one LeanProblem.
        """
        if not self.problems:
            return [], []

        headers, _ = self.problems[0].to_csv()
        rows = [problem.to_csv()[1] for problem in self.problems]
        return headers, rows

    def save_json(self, filepath: str):
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(self.to_json())

    def save_csv(self, filepath: str):
        headers, rows = self.to_csv()
        with open(filepath, "w", newline="", encoding="utf-8") as f:
            writer = csv.writer(f)
            writer.writerow(headers)
            writer.writerows(rows)
