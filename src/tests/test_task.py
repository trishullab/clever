import asyncio
import unittest
from clever_bench.benchmark import Benchmark
from clever_bench.task import ProblemViewTask, TaskComponent, ValidationResult

class TestTask(unittest.TestCase):
    def test_task_components(self):
        benchmark = Benchmark("src/lean4/human_eval", helper_definition_file="src/lean4/Imports/AllImports.lean")
        benchmark.load_all()

        task1 = ProblemViewTask(benchmark, TaskComponent.SPEC_GENERATION, "src/lean4")
        task2 = ProblemViewTask(benchmark, TaskComponent.IMPL_GENERATION, "src/lean4")
        task3 = ProblemViewTask(benchmark, TaskComponent.PROOF_GENERATION, "src/lean4")

        visible1 = task1.get_visible_problems()
        visible2 = task2.get_visible_problems()
        visible3 = task3.get_visible_problems()

        # All tasks should return the same number of problems
        self.assertEqual(len(visible1), len(visible2))
        self.assertEqual(len(visible1), len(visible3))

        for i in range(len(visible1)):
            p1 = visible1[i]
            p2 = visible2[i]
            p3 = visible3[i]

            # Function signature and NL spec should always match
            self.assertEqual(p1.function_signature, p2.function_signature)
            self.assertEqual(p1.function_signature, p3.function_signature)
            self.assertEqual(p1.problem_spec_nl, p2.problem_spec_nl)
            self.assertEqual(p1.problem_spec_nl, p3.problem_spec_nl)

            # Task 1: Only spec generation fields visible
            self.assertIsNotNone(p1.problem_spec_formal_generated)
            self.assertIsNotNone(p1.isomorphism_theorem)
            self.assertIsNone(p1.problem_spec_formal_ground_truth)
            self.assertIsNone(p1.implementation_signature)
            self.assertIsNone(p1.correctness_theorem)
            self.assertIsNone(p1.correctness_proof)
            self.assertIsNone(p1.implementation)
            self.assertEqual(p1.isomorphism_helper_lemmas, [])
            self.assertEqual(p1.correctness_helper_lemmas, [])
            self.assertTrue(p1.helper_definitions is not None)

            # Task 2: Only impl generation fields visible
            self.assertIsNone(p2.problem_spec_formal_generated)
            self.assertIsNone(p2.isomorphism_theorem)
            self.assertIsNotNone(p2.problem_spec_formal_ground_truth)
            self.assertIsNotNone(p2.implementation_signature)
            self.assertIsNotNone(p2.test_cases_lean)
            self.assertIsNone(p2.correctness_proof)
            self.assertEqual(p2.correctness_helper_lemmas, [])
            self.assertEqual(p2.isomorphism_helper_lemmas, []) 
            self.assertTrue(p2.helper_definitions is not None)  


            # Task 3: Only proof fields visible
            self.assertIsNone(p3.problem_spec_formal_generated)
            self.assertIsNone(p3.isomorphism_theorem)
            self.assertIsNone(p3.isomorphism_proof)
            self.assertIsNotNone(p3.problem_spec_formal_ground_truth)
            self.assertIsNotNone(p3.implementation_signature)
            self.assertIsNotNone(p3.implementation)
            self.assertIsNotNone(p3.test_cases_lean)
            self.assertIsNotNone(p3.correctness_theorem)
            self.assertIsNotNone(p3.correctness_proof)
            self.assertTrue(p3.helper_definitions is not None)

    def test_submission(self):
        benchmark = Benchmark("src/lean4/human_eval", helper_definition_file="src/lean4/Imports/AllImports.lean")
        benchmark.load_all()
        task = ProblemViewTask(benchmark, TaskComponent.PROOF_GENERATION, "src/lean4")
        problem = task.get_visible_problems()[0]

        result = asyncio.run(task.submit_async(problem, timeout_in_ms=30000))
        self.assertIsInstance(result, ValidationResult)
        self.assertFalse(result.isomorphism_ok)
        self.assertFalse(result.correctness_ok)

        benchmark = Benchmark("src/lean4/sample_examples", helper_definition_file="src/lean4/Imports/AllImports.lean", is_sample=True)
        benchmark.load_all()
        task = ProblemViewTask(benchmark, TaskComponent.IMPL_GENERATION, "src/lean4")
        problem = task.get_visible_problems()[3]
        problem.implementation = benchmark.problems[3].implementation
        problem.correctness_helper_lemmas = benchmark.problems[3].correctness_helper_lemmas
        problem.correctness_proof = benchmark.problems[3].correctness_proof
        problem.isomorphism_helper_lemmas = benchmark.problems[3].isomorphism_helper_lemmas
        problem.isomorphism_proof = benchmark.problems[3].isomorphism_proof

        result = asyncio.run(task.submit_async(problem, timeout_in_ms=30000))
        self.assertIsInstance(result, ValidationResult)
        self.assertTrue(result.isomorphism_ok)
        self.assertTrue(result.correctness_ok)

if __name__ == "__main__":
    unittest.main()