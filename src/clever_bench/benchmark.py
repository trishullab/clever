import os
import json
import csv
from typing import List, Tuple
from pathlib import Path
from clever_bench.lean_problem import LeanProblem
from clever_bench.lean_parser_spec import LeanSpecParser

# Assuming these are already imported/defined
# from lean_problem_classes import LeanSpecParser, LeanProblem

class Benchmark:
    def __init__(self, directory: str, helper_definition_file: str = None, is_sample: bool = False):
        self.directory = directory
        self.helper_definition_file = helper_definition_file
        self.is_sample = is_sample
        self.problems: List[LeanProblem] = []

    def load_all(self):
        lean_files = Path(self.directory).glob("*.lean")
        if self.helper_definition_file:
            with open(self.helper_definition_file, "r", encoding="utf-8") as f:
                helper_definitions = f.read()
        else:
            helper_definitions = None
        for lean_file in lean_files:
            problem_id = int(lean_file.stem.split("_")[1])  # Assuming the file name format is like "problem_{idx}.lean"
            with open(lean_file, "r", encoding="utf-8") as f:
                content = f.read()
                parser = LeanSpecParser(content, helper_definitions=helper_definitions, problem_id=problem_id, is_sample=self.is_sample)
                problem = parser.parse()
                self.problems.append(problem)

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
