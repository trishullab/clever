import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def solution(lst: List[int]) -> int"
docstring: Given a non-empty list of integers, return the sum of all of the odd elements that
are in even positions.
test_cases:
  - input: [5, 8, 7, 1]
    expected_output: 12
  - input: [3, 3, 3, 3, 3]
    expected_output: 9
  - input: [30, 13, 24, 321]
    expected_output: 0
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int)
-- inputs
(lst: List Int) :=
-- spec
let odd_in_even_pos := (lst.enum.filter (fun (i, x) => i % 2 = 0 ∧ x % 2 = 1)).map Prod.snd
let spec (result : Int) :=
  lst ≠ [] →  odd_in_even_pos.sum = result;
-- program termination
∃ result, impl lst = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (lst: List Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([5, 8, 7, 1]: List Int) = 12
-- #test implementation ([3, 3, 3, 3, 3]: List Int) = 9
-- #test implementation ([30, 13, 24, 321]: List Int) = 0
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
