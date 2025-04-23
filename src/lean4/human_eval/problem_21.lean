import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def rescale_to_unit(numbers: List[float]) -> List[float]"
docstring: |
    Given list of numbers (of at least two elements), apply a linear transform to that list,
    such that the smallest number will become 0 and the largest will become 1
test_cases:
  - input: [1.0, 2.0, 3.0, 4.0, 5.0]
    expected_output: [0.0, 0.25, 0.5, 0.75, 1.0]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Rat → List Rat)
-- inputs
(numbers: List Rat) :=
-- spec
let spec (result: List Rat) :=
2 ≤ numbers.length →
let min_elem = numbers.min?.get!;
let max_elem = numbers.max?.get!;
let range = max_elem - min_elem;
result.length = numbers.length ∧
∀ i, i < numbers.length →
(min_elem ≠ max_elem →
result[i]! = (numbers[i]! - min_elem) / range) ∧
(min_elem = max_elem →
result[i]! = 0);
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List Rat → List Rat)
-- inputs
(numbers: List Rat) : Prop :=
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
def implementation (numbers: List Rat): List Rat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1.0, 2.0, 3.0, 4.0, 5.0, 2.2] = (2.0, 2.2)
-- #test implementation [1.0, 2.0, 3.0, 4.0, 5.0, 2.0] = (2.0, 2.0)
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Rat)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers
use result
simp [result]
sorry
-- end_def correctness_proof
