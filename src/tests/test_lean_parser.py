import unittest
import json
import os
import time
from clever_bench.lean_parser_spec import LeanSpecParser
from clever_bench.benchmark import Benchmark


class TestLeanSpecParser(unittest.TestCase):
    def setUp(self):
        self.time_str = time.strftime("%Y%m%d-%H%M%S")
        os.makedirs(".logs", exist_ok=True)
        os.makedirs(f".logs/test/{self.time_str}", exist_ok=True)

    def test1(self):
        problems = os.listdir("src/lean4/human_eval")
        problems = [p for p in problems if p.endswith(".lean")]
        with open("src/lean4/Imports/AllImports.lean", "r") as f:
            helper_definitions = f.read()
        for problem in problems:
            print(f"Processing {problem}...")
            problem_idx = int(problem.split("_")[1].split(".")[0])
            # Read the Lean code
            with open(os.path.join("src/lean4/human_eval", problem), "r") as f:
                lean_code = f.read()

            # Parse
            parser = LeanSpecParser(lean_code, helper_definitions=helper_definitions, problem_id=problem_idx, is_sample=False)
            lean_problem = parser.parse()

            self.assertIsNotNone(lean_problem.problem_spec_metadata, f"{problem} metadata is None")
            self.assertIsNotNone(lean_problem.problem_spec_nl)
            # Test JSON serialization
            lean_json = lean_problem.to_json()
            self.assertIsInstance(lean_json, str)
            # Test CSV serialization
            headers, row = lean_problem.to_csv()
            self.assertIsInstance(headers, list)
            self.assertIsInstance(row, list)
            self.assertEqual(len(headers), len(row))

            # Deserialize from JSON
            lean_problem_from_json = json.loads(lean_json)
            self.assertIsInstance(lean_problem_from_json, dict)

            # Check if the deserialized object matches the original
            self.assertEqual(lean_problem.problem_spec_metadata.function_signature,
                                lean_problem_from_json["problem_spec_metadata"]["function_signature"])
            self.assertEqual(lean_problem.problem_spec_metadata.docstring,
                                lean_problem_from_json["problem_spec_metadata"]["docstring"])
            self.assertEqual(lean_problem.problem_spec_nl,
                                lean_problem_from_json["problem_spec_nl"])
            self.assertIsNotNone(lean_problem.problem_spec_formal_ground_truth,
                                f"{problem} formal ground truth is None")
            self.assertEqual(lean_problem.problem_spec_formal_ground_truth,
                                lean_problem_from_json["problem_spec_formal_ground_truth"])
            self.assertIsNotNone(lean_problem.problem_spec_formal_generated,
                                f"{problem} formal ground truth is None")
            self.assertIsNotNone(lean_problem.problem_spec_formal_generated, f"{problem} formal generated spec is None")
            self.assertEqual(lean_problem.problem_spec_formal_generated,
                                lean_problem_from_json["problem_spec_formal_generated"])
            self.assertIsNotNone(lean_problem.isomorphism_theorem, f"{problem} isomorphism theorem is None")
            if lean_problem.isomorphism_theorem.strip().endswith("by"):
                raise ValueError(f"Isomorphism theorem in {problem} ends with 'by'")
            self.assertEqual(lean_problem.isomorphism_theorem,
                                lean_problem_from_json["isomorphism_theorem"])
            self.assertEqual(lean_problem.isomorphism_proof,
                                lean_problem_from_json["isomorphism_proof"])
            self.assertEqual(lean_problem.implementation_signature,
                                lean_problem_from_json["implementation_signature"])
            self.assertEqual(lean_problem.test_cases_lean,
                                lean_problem_from_json["test_cases_lean"])
            self.assertIsNotNone(lean_problem.correctness_theorem, f"{problem} correctness theorem is None")
            self.assertEqual(lean_problem.correctness_theorem,
                                lean_problem_from_json["correctness_theorem"])
            if lean_problem.correctness_theorem.strip().endswith("by"):
                raise ValueError(f"Correctness theorem in {problem} ends with 'by'")
            self.assertEqual(lean_problem.correctness_proof,
                                lean_problem_from_json["correctness_proof"])
            if lean_problem.correctness_proof is not None:
                if "sorry" not in lean_problem.correctness_proof:
                    # Count the number of lines in the proof
                    lines = lean_problem.correctness_proof.split("\n")
                    num_lines = len(lines)
                    print(f"Number of lines in correctness proof for {problem}: {num_lines}")
            if lean_problem.isomorphism_proof is not None:
                if "sorry" not in lean_problem.isomorphism_proof:
                    # Count the number of lines in the proof
                    lines = lean_problem.isomorphism_proof.split("\n")
                    num_lines = len(lines)
                    print(f"Number of lines in isomorphism proof for {problem}: {num_lines}")
            self.assertEqual(lean_problem.helper_definitions,
                                lean_problem_from_json["helper_definitions"])
            self.assertEqual(lean_problem.isomorphism_helper_lemmas,
                                lean_problem_from_json["isomorphism_helper_lemmas"])
            self.assertEqual(lean_problem.correctness_helper_lemmas,
                                lean_problem_from_json["correctness_helper_lemmas"])
            if len(lean_problem.helper_definitions) > 0:
                print(f"Helper definitions in {problem}")
                for i, helper in enumerate(lean_problem.helper_definitions):
                    self.assertIn(helper, lean_problem_from_json["helper_definitions"])

    def test_benchmark(self):
        time_str = self.time_str
        log_path = f".logs/test/{time_str}"
        abs_path = os.path.abspath(log_path)
        print(f"Processing benchmark in {abs_path}...")
        benchmark = Benchmark(is_sample=False)
        benchmark.load_all()
        json_output = benchmark.to_json()
        self.assertIsInstance(json_output, str)
        self.assertTrue(json_output.startswith("["))
        self.assertTrue(json_output.endswith("]"))
        # Test CSV output
        headers, rows = benchmark.to_csv()
        self.assertIsInstance(headers, list)
        self.assertIsInstance(rows, list)
        self.assertTrue(len(rows) > 0)
        self.assertEqual(len(headers), len(rows[0]))
        # Test saving JSON
        benchmark.save_json(f"{log_path}/benchmark.json")
        # Test saving CSV
        benchmark.save_csv(f"{log_path}/benchmark.csv")
        # Dump the sample benchmark
        benchmark_sample = Benchmark(is_sample=True)
        benchmark_sample.load_all()
        benchmark_sample.save_json(f"{log_path}/benchmark_sample.json")
        benchmark_sample.save_csv(f"{log_path}/benchmark_sample.csv")
        pass

if __name__ == "__main__":
    unittest.main()