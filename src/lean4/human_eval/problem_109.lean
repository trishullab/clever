import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def move_one_ball(arr: List[int]) -> bool"
docstring: |
    We have an array 'arr' of N integers arr[1], arr[2], ..., arr[N].The
    numbers in the array will be randomly ordered. Your task is to determine if
    it is possible to get an array sorted in non-decreasing order by performing
    the following operation on the given array:
        You are allowed to perform right shift operation any number of times.

    One right shift operation means shifting all elements of the array by one
    position in the right direction. The last element of the array will be moved to
    the starting position in the array i.e. 0th index.

    If it is possible to obtain the sorted array by performing the above operation
    then return True else return False.
    If the given array is empty then return True.

    Note: The given list is guaranteed to have unique elements.
test_cases:
  - input: [3, 4, 5, 1, 2]
    expected_output: True
  - input: [3, 5, 4, 1, 2]
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Bool)
-- inputs
(arr: List Int) :=
-- spec
let spec (result: Bool) :=
  True -- FIX !!
-- program termination
∃ result, implementation arr = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Bool)
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
def implementation (arr: List Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [3, 4, 5, 1, 2] = True
-- #test implementation [3, 5, 10, 1, 2] = True
-- #test implementation [4, 3, 1, 2] = False
-- #test implementation [3, 5, 4, 1, 2] = False
-- #test implementation [] = True
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
