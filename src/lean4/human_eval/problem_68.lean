import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def pluck(numbers: List[Int]) -> List[Int]"
docstring: |
    Given an array representing a branch of a tree that has non-negative Nateger nodes
    your task is to pluck one of the nodes and return it.
    The plucked node should be the node with the smallest even value.
    If multiple nodes with the same smallest even value are found return the node that has smallest index.

    The plucked node should be returned in a list, [ smalest_value, its index ],
    If there are no even values or the given array is empty, return [].
test_cases:
  - input: [4, 2, 3]
    expected_output: [2, 1]
  - input: [1, 2, 3]
    expected_output: [2, 1]
  - input: []
    expected_output: []
  - input: [5, 0, 3, 0, 4, 2]
    expected_output: [0, 1]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Nat → List Nat)
-- inputs
(numbers: List Nat) :=
-- spec
let spec (result: List Nat) :=
(result.length = 0 ↔ ∀ i, i < numbers.length → numbers[i]! % 2 = 1) ∧
(result.length = 2 ↔ ∃ i, i < numbers.length ∧
  numbers[i]! % 2 = 0 ∧
  result[0]! = numbers[i]! ∧
  result[1]! = i ∧ ∀ j, j < numbers.length ∧
  j ≠ i → numbers[j]! % 2 = 1)
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Nat → List Nat)
-- inputs
(x: List Nat) : Prop :=
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
def implementation (numbers: List Nat) : List Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- -- Uncomment the following test cases after implementing the function
-- -- start_def test_cases
-- #test implementation [] = (0, 1)
-- #test implementation [1, 2, 3, 4] = (10, 24)
-- -- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Nat)
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
