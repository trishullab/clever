# List all directories in src/lean4/human_eval and each file names is problem_{number}.lean
# Find the problem numbers missing from 0-163

import os
import re
from pathlib import Path
from typing import List, Tuple

def list_problem_files(directory: str) -> List[str]:
    """
    List all files in the given directory that match the pattern 'problem_{number}.lean'.
    """
    pattern = re.compile(r'problem_(\d+)\.lean')
    problem_files = []

    for filename in os.listdir(directory):
        match = pattern.match(filename)
        if match:
            problem_files.append(match.group(1))

    return problem_files
def find_missing_problems(directory: str, total_problems: int) -> List[int]:
    """
    Find missing problem numbers in the given directory.
    """
    existing_problems = list_problem_files(directory)
    existing_problems = set(int(num) for num in existing_problems)
    all_problems = set(range(total_problems))

    missing_problems = sorted(all_problems - existing_problems)
    return missing_problems

if __name__ == "__main__":
    directory = "src/lean4/human_eval"
    total_problems = 164  # Total number of problems from 0 to 163
    missing_problems = find_missing_problems(directory, total_problems)

    if missing_problems:
        print(f"Missing problem numbers: {missing_problems}")
    else:
        print("No missing problem numbers.")