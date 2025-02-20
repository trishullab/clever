import os
import json
import argparse
import re

# This script reads the build logs and scores the solutions.

def main():
    args = argparse.ArgumentParser()
    args.add_argument("--build_log", type=str, default="src/lean4/lean4_build.log",
                        help="Original build log.")
    args.add_argument("--task_summary_file", type=str, default="src/lean4/task_summary.json",)
    args.add_argument("--score_file", type=str, default="src/lean4/temp/score.json",
                        help="JSON file containing scores.")
    args = args.parse_args()
    assert os.path.exists(args.build_log), f"Build log {args.build_log} does not exist."
    assert os.path.exists(args.task_summary_file), f"Task summary file {args.task_summary_file} does not exist."
    with open(args.build_log, "r") as f:
        build_log = f.read()
    with open(args.task_summary_file, "r") as f:
        task_summary = json.load(f)
    tasks = task_summary["tasks"]
    scores = {}
    for task in tasks:
        task_name = task["task_name"]
        score = task["score"]
        # Count the number of problems from the original build log
        rexp = rf"{task_name}:\d+:\d+:([\s\S]*?)declaration uses 'sorry'"
        task_regex = re.compile(rexp, re.MULTILINE)
        problems = task_regex.findall(build_log)
        if len(problems) == 0:
            print(f"Task {task_name} done successfully.")
            scores[task_name] = score
        else:
            print(f"Task {task_name} incomplete.")
            scores[task_name] = 0
    os.makedirs("src/lean4/temp", exist_ok=True)
    with open(args.score_file, "w") as f:
        json.dump(scores, f, indent=4)
    with open(args.score_file, "r") as f:
        scores_str = f.read()
    print(scores_str)
    print("Total score:", sum(scores.values()))

if __name__ == "__main__":
    main()