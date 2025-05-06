import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def numerical_letter_grade(grades: list[float]) -> list[str]"
docstring: |
    It is the last week of the semester and the teacher has to give the grades
    to students. The teacher has been making her own algorithm for grading.
    The only problem is, she has lost the code she used for grading.
    She has given you a list of GPAs for some students and you have to write
    a function that can output a list of letter grades using the following table:
             GPA       |    Letter grade
              4.0                A+
            > 3.7                A
            > 3.3                A-
            > 3.0                B+
            > 2.7                B
            > 2.3                B-
            > 2.0                C+
            > 1.7                C
            > 1.3                C-
            > 1.0                D+
            > 0.7                D
            > 0.0                D-
              0.0                E
    Note: I have included a hypothesis that Float is hashable, not sure if this will mess up proving attempts but we can modify it if so. Reviewer: please think if there's a better way.
    Example:
    grade_equation([4.0, 3, 1.7, 2, 3.5]) ==> ['A+', 'B', 'C-', 'C', 'A-']
test_cases:
  - input: [4.0, 3, 1.7, 2, 3.5]
    output: ['A+', 'B', 'C-', 'C', 'A-']
note: formalization uses a list of tuples instead of a hashmap because Hashable Float is not available in the standard library.
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Float → List String)
-- inputs
(grades: List Float) :=
-- spec
let grade_dict : List (Float × String) :=
  [
    (4.0, "A+"),
    (3.7, "A"),
    (3.3, "A-"),
    (3.0, "B+"),
    (2.7, "B"),
    (2.3, "B-"),
    (2.0, "C+"),
    (1.7, "C"),
    (1.3, "C-"),
    (1.0, "D+"),
    (0.7, "D"),
    (0.0, "D-")
  ]
let spec (result : List String) :=
  grades.all (fun grade => 0.0 ≤ grade ∧ grade ≤ 4.0) ∧
  result.length = grades.length ∧
  ∀ i, i < grades.length →
    let number_grade := grades[i]!
    let number_grade_keys := grade_dict.map (fun (g, _) => g)
    if number_grade > 0.0 then
      ∃ i : Nat, i < number_grade_keys.length ∧
        number_grade_keys[i]! ≥ number_grade ∧
        (∀ k' : Nat, k' < number_grade_keys.length → number_grade_keys[k']! ≥ number_grade → number_grade_keys[i]! ≤ number_grade_keys[k']!) ∧
        result[i]! = (grade_dict[i]!).snd
    else
      result[i]! = "E"
-- program termination
∃ result,
  implementation grades = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Float → List String)
-- inputs
(grades: List Float) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ grades, problem_spec impl grades) ↔
(∀ grades, generated_spec impl grades) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (grades: List Float) : List String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation [4.0, 3, 1.7, 2, 3.5] = ['A+', 'B', 'C-', 'C', 'A-']
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(grades: List Float)
: problem_spec implementation grades
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
