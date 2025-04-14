import unittest
import json
import os
from clever_bench.lean_parser_spec import LeanSpecParser


class TestLeanSpecParser(unittest.TestCase):
    def test1(self):
        problems = os.listdir("src/lean4/human_eval")
        problems = [p for p in problems if p.endswith(".lean")]
        for problem in problems:
            print(f"Processing {problem}...")
            # Read the Lean code
            with open(os.path.join("src/lean4/human_eval", problem), "r") as f:
                lean_code = f.read()

                # Parse
                parser = LeanSpecParser(lean_code)
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
                self.assertEqual(lean_problem.problem_spec_formal_ground_truth,
                                    lean_problem_from_json["problem_spec_formal_ground_truth"])
                self.assertEqual(lean_problem.problem_spec_formal_generated,
                                    lean_problem_from_json["problem_spec_formal_generated"])
                self.assertEqual(lean_problem.isomorphism_theorem,
                                    lean_problem_from_json["isomorphism_theorem"])
                self.assertEqual(lean_problem.isomorphism_proof,
                                    lean_problem_from_json["isomorphism_proof"])
                self.assertEqual(lean_problem.implementation_signature,
                                    lean_problem_from_json["implementation_signature"])
                self.assertEqual(lean_problem.test_cases_lean,
                                    lean_problem_from_json["test_cases_lean"])
                self.assertEqual(lean_problem.correctness_theorem,
                                    lean_problem_from_json["correctness_theorem"])
                self.assertEqual(lean_problem.correctness_proof,
                                    lean_problem_from_json["correctness_proof"])
                self.assertEqual(lean_problem.helper_definitions,
                                    lean_problem_from_json["helper_definitions"])
                self.assertEqual(lean_problem.isomorphism_helper_lemmas,
                                    lean_problem_from_json["isomorphism_helper_lemmas"])
                self.assertEqual(lean_problem.correctness_helper_lemmas,
                                    lean_problem_from_json["correctness_helper_lemmas"])



if __name__ == "__main__":
    unittest.main()