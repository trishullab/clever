from clever_bench.lean_problem import LeanProblemView
from clever_bench.benchmark import Benchmark
from enum import Enum, auto

class TaskComponent(Enum):
    SPEC_GENERATION = auto()     # Task 1
    IMPL_GENERATION = auto()     # Task 2
    PROOF_GENERATION = auto()    # Task 3


class ProblemViewTask:
    def __init__(self, benchmark: Benchmark, component: TaskComponent):
        self.benchmark = benchmark
        self.component = component

    def get_visible_problems(self) -> list[LeanProblemView]:
        views = []

        for problem in self.benchmark.problems:
            meta = problem.problem_spec_metadata
            view = LeanProblemView(
                function_signature=meta.function_signature if meta else None,
                problem_spec_nl=problem.problem_spec_nl,
                problem_spec_formal_ground_truth=problem.problem_spec_formal_ground_truth,
                isomorphism_theorem=problem.isomorphism_theorem,
                implementation_signature=problem.implementation_signature,
                test_cases_lean=problem.test_cases_lean,
                correctness_theorem=problem.correctness_theorem,
                problem_spec_formal_generated=problem.problem_spec_formal_generated,
                implementation=problem.implementation_signature,
                correctness_proof=problem.correctness_proof,
                isomorphism_proof=problem.isomorphism_proof,
                helper_definitions=problem.helper_definitions,
                isomorphism_helper_lemmas=problem.isomorphism_helper_lemmas,
                correctness_helper_lemmas=problem.correctness_helper_lemmas
            )

            if self.component == TaskComponent.SPEC_GENERATION:
                view.hide_params(
                    "problem_spec_formal_ground_truth",
                    "implementation_signature",
                    "test_cases_lean",
                    "correctness_theorem",
                    "correctness_proof",
                    "implementation",
                    "isomorphism_proof",
                    "correctness_helper_lemmas"
                )

            elif self.component == TaskComponent.IMPL_GENERATION:
                view.hide_params(
                    "problem_spec_formal_generated",
                    "isomorphism_theorem",
                    "isomorphism_proof",
                    "correctness_theorem",
                    "correctness_proof",
                    "isomorphism_helper_lemmas",
                    "correctness_helper_lemmas"
                )

            elif self.component == TaskComponent.PROOF_GENERATION:
                view.hide_params(
                    "problem_spec_formal_generated",
                    "isomorphism_theorem",
                    "isomorphism_proof",
                    "problem_spec_formal_generated",
                    "isomorphism_helper_lemmas"
                )

            views.append(view)

        return views