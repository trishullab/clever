import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def search(numbers: List[int]) -> int"
docstring: |
    You are given a non-empty list of positive integers. Return the greatest integer that is greater than
    zero, and has a frequency greater than or equal to the value of the integer itself.
    The frequency of an integer is the number of times it appears in the list.
    If no such a value exist, return -1.
test_cases:
  - input: [4, 1, 2, 2, 3, 1]
    expected_output: 2
  - input: [1, 2, 2, 3, 3, 3, 4, 4, 4]
    expected_output: 3
  - input: [5, 5, 4, 4, 4]
    expected_output: -1
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Int)
-- inputs
(numbers: List Int) :=
-- spec
let spec (result: Int) :=
0 < numbers.length ∧ numbers.all (fun n => 0 < n) →
(result ≠ -1 ↔ ∃ i : Nat, i < numbers.length ∧
  numbers[i]! = result ∧ numbers[i]! > 0 ∧
  numbers[i]! ≤ (numbers.filter (fun x => x = numbers[i]!)).length ∧
  (¬∃ j : Nat, j < numbers.length ∧
  numbers[i]! < numbers[j]! ∧ numbers[j]! ≤ numbers.count numbers[j]!));
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int)
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
def implementation (numbers: List Int) : (Int) :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [4, 1, 2, 2, 3, 1] = 2
-- #test implementation [1, 2, 2, 3, 3, 4, 4, 4] = 3
-- #test implementation [5, 5, 4, 4, 4] = -1
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
sorry
-- end_def correctness_proof
