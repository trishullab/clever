import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def pairs_sum_to_zero(numbers: List[int]) -> Bool"
docstring: |
    pairs_sum_to_zero takes a list of integers as an input.
    it returns True if there are two distinct elements in the list that
    sum to zero, and False otherwise.
test_cases:
  - input: [1, 3, 5, 0]
    expected_output: False
  - input: [1, 3, -2, 1]
    expected_output: False
  - input: [1]
    expected_output: False
  - input: [2, 4, -5, 3, 5, 7]
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Bool)
-- inputs
(numbers: List Int) :=
let sum_i_j (i j: Nat) : Bool :=
  numbers[i]! + numbers[j]! = 0;
let exists_zero := 2 ≤ numbers.length ∧ (∃ i j, i ≠ j ∧
 i < numbers.length ∧ j < numbers.length ∧
 sum_i_j i j)
-- spec
let spec (result: Bool) :=
result ↔ exists_zero
-- -- program termination
∃ result, implementation numbers = result ∧
spec result
-- -- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Bool)
-- inputs
(x: List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x, problem_spec impl x) ↔
(∀ x, generated_spec impl x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1, 3, 5, 0] = false
-- #test implementation [1, 3, -2, 1] = false
-- #test implementation [1, 2, 3, 7] = false
-- #test implementation [2, 4, -5, 3, 5, 7] = true
-- #test implementation [1] = false
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers : List Int)
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
