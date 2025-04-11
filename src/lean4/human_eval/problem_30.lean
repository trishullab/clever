import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def get_positive(l: list)"
docstring: |
    Return only positive numbers in the list.
test_cases:
  - input: [-1, 2, -4, 5, 6]
    expected_output: [2, 5, 6]
  - input: [5, 3, -5, 2, -3, 3, 9, 0, 123, 1, -10]
    expected_output: [5, 3, 2, 3, 9, 123, 1]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(numbers: List Int) :=
-- spec
let spec (result: List Int) :=
result.all (λ x => x > 0) ∧
result.all (λ x => x ∈ numbers) ∧
numbers.all (λ x => x > 0 → x ∈ result);
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(numbers: List Int) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ numbers, problem_spec implementation numbers) ↔
(∀ numbers, generated_spec implementation numbers) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Int): List Int :=
-- end_def implementation_signature
-- start_def implementation
numbers.filter (λ x => x > 0)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [(-1), 2, (-4), 5, 6] = [2, 5, 6]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Int)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers
use result
simp [result]
repeat sorry
-- end_def correctness_proof
