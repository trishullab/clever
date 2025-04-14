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
    def __init__(self, directory: str):
        self.directory = directory
        self.problems: List[LeanProblem] = []

    def load_all(self):
        lean_files = Path(self.directory).glob("*.lean")
        for lean_file in lean_files:
            with open(lean_file, "r", encoding="utf-8") as f:
                content = f.read()
                parser = LeanSpecParser(content)
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
