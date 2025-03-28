import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def add_elements(arr: List[int], k: int) -> int"
docstring: |
    Given a non-empty array of integers arr and an integer k, return
    the sum of the elements with at most two digits from the first k elements of arr.

    Constraints:
        1. 1 <= len(arr) <= 100
        2. 1 <= k <= len(arr)
test_cases:
  - input: [[111, 21, 3, 4000, 5, 6, 7, 8, 9], 4]
    expected_output: 24
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int → Int)
-- inputs
(arr: List Int)
(k: Int) :=
-- spec
let two_digit_arr := (arr.take k.natAbs).filter (fun x => x ≤ 99 ∨ x ≥ -99)
let spec (result: Int) :=
  let preconditions := arr.length ≥ 1 ∧ arr.length ≤ 100 ∧ k ≥ 1 ∧ k ≤ arr.length;
  preconditions → two_digit_arr.sum = result;
-- program termination
∃ result, impl arr k = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (arr: List Int) (k: Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([111, 21, 3, 4000, 5, 6, 7, 8, 9]: List Int) 4 = 24
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(arr: List Int)
(k: Int)
: problem_spec implementation arr k :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
