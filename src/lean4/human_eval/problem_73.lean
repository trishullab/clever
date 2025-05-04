import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def smallest_change(arr: List[int]) -> int"
docstring: |
    Given an array arr of integers, find the minimum number of elements that
    need to be changed to make the array palindromic. A palindromic array is an array that
    is read the same backwards and forwards. In one change, you can change one element to any other element.
test_cases:
  - input: [1,2,3,5,4,7,9,6]
    expected_output: 4
  - input: [1, 2, 3, 4, 3, 2, 2]
    expected_output: 1
  - input: [1, 2, 3, 2, 1]
    expected_output: 0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Int)
-- inputs
(arr: List Int) :=
-- spec
let spec (result : Int) :=
  result = ((List.finRange (arr.length/2)).filter (fun i => arr[i]? != arr[arr.length - 1 - i]?)).length
-- program termination
∃ result, implementation arr = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int)
-- inputs
(arr: List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ arr, problem_spec impl arr) ↔
(∀ arr, generated_spec impl arr) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (arr: List Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1,2,3,5,4,7,9,6] = 4
-- #test implementation [1, 2, 3, 4, 3, 2, 2] = 1
-- #test implementation [1, 4, 2] = 1
-- #test implementation [1, 4, 4, 2] = 1
-- #test implementation [1, 2, 3, 2, 1] = 0
-- #test implementation [3, 1, 1, 3] = 0
-- #test implementation [1] = 0
-- #test implementation [0, 1] = 1
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(arr: List Int)
: problem_spec implementation arr
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
