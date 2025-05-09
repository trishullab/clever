import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sum_squares(lst: List[float]) -> int"
docstring: |
    You are given a list of numbers.
    You need to return the sum of squared numbers in the given list,
    round each element in the list to the upper int(Ceiling) first.
test_cases:
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
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Rat → Int)
-- inputs
(lst: List Rat) :=
-- spec
let spec (result: Int) :=
  (lst = [] → result = 0) ∧
  (lst != [] → 0 ≤ result - lst[0]!.ceil^2 ∧ (impl (lst.drop 1) = (result - lst[0]!.ceil^2)))
-- program termination
∃ result, impl lst = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Rat → Int)
-- inputs
(lst: List Rat) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ lst, problem_spec impl lst) ↔
(∀ lst, generated_spec impl lst) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (lst: List Rat) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1, 2, 3] = 14
-- #test implementation [1, 4, 9] = 98
-- #test implementation [1, 3, 5, 7] = 84
-- #test implementation [1.4, 4.2, 0] = 29
-- #test implementation [-2.4, 1, 1] = 6
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Rat)
: problem_spec implementation lst :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
