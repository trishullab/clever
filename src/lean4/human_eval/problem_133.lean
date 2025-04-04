import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sum_squares(lst: List[float]) -> int"
docstring: |
    You are given a list of numbers.
    You need to return the sum of squared numbers in the given list,
    round each element in the list to the upper int(Ceiling) first.
test_examples:
  - input: [1, 2, 3]
    expected_output: 14
  - input: [1, 4, 9]
    expected_output: 98
  - input: [1, 3, 5, 7]
    expected_output: 84
  - input: [1.4, 4.2, 0]
    expected_output: 29
  - input: [-2.4, 1, 1]
    expected_output: 6
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Rat → Int)
-- inputs
(lst: List Rat) :=
-- spec
let int_lst := lst.map (fun x => x.ceil);
let spec (list: List Int) (result: Int) :=
    match list with
    | [] => result = 0
    | head::tail => 0 ≤ result - head^2 ∧ (impl (list.drop 1) = (result - head^2));
-- program termination
∃ result, impl lst = result →
spec int_lst result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (lst: List Rat) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases

-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Rat)
: problem_spec implementation lst :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
