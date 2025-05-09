import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def strange_sort_list(lst: List[int]) -> List[int]"
docstring: |
    Given list of integers, return list in strange order.
    Strange sorting is when you start with the minimum value,
    then the maximum of the remaining integers, then the minimum and so on.
test_cases:
  - input: [1, 2, 3, 4]
    expected_output: [1, 4, 2, 3]
  - input: [5, 5, 5, 5]
    expected_output: [5, 5, 5, 5]
  - input: []
    expected_output: []
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(lst: List Int) :=
-- spec
let spec (result: List Int) :=
  let sorted_lst := lst.mergeSort;
  (List.Perm lst result)
  ∧ (forall i, (0 <= i ∧ i < lst.length ∧ i % 2 = 0) → result[i]! = sorted_lst[i / 2]!)
  ∧ (forall i, (0 <= i ∧ i < lst.length ∧ i % 2 = 1) → result[i]! = sorted_lst[lst.length - (i-1)/2 - 1]!)
-- program termination
∃ result, implementation lst = result ∧ spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → List Int)
-- inputs
(lst: List Int) : Prop :=
--end_def generated_spec
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
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (lst: List Int): List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1, 2, 3, 4] = [1, 4, 2, 3]
-- #test implementation [5, 6, 7, 8, 9] = [5, 9, 6, 8, 7]
-- #test implementation [1, 2, 3, 4, 5] = [1, 5, 2, 4, 3]
-- #test implementation [5, 6, 7, 8, 9, 1] = [1, 9, 5, 8, 6, 7]
-- #test implementation [5, 5, 5, 5] = [5, 5, 5, 5]
-- #test implementation [] = []
-- #test implementation [1,2,3,4,5,6,7,8] = [1, 8, 2, 7, 3, 6, 4, 5]
-- #test implementation [0,2,2,2,5,5,-5,-5] = [-5, 5, -5, 5, 0, 2, 2, 2]
-- #test implementation [111111] = [111111]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
