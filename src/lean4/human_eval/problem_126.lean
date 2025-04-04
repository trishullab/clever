import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_sorted(lst: List[int]) -> Bool"
docstring: |
    Given a list of numbers, return whether or not they are sorted
    in ascending order. If list has more than 1 duplicate of the same
    number, return False. Assume no negative numbers and only integers.
test_cases:
  - input: [5]
    expected_output: True
  - input: [1, 2, 3, 4, 5]
    expected_output: True
  - input: [1, 3, 2, 4, 5]
    expected_output: False
  - input: [1, 2, 3, 4, 5, 6]
    expected_outupt: True
  - input: [1, 2, 3, 4, 5, 6, 7]
    expected_output: True
  - input: [1, 3, 2, 4, 5, 6, 7]
    expected_output: False
  - input: [1, 2, 2, 3, 3, 4]
    expected_output: True
  - input: [1, 2, 2, 2, 3, 4]
    expected_output: False
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Bool)
-- inputs
(lst: List Int) :=
-- spec
let sorted_ascending := lst.Sorted (· ≤ ·);
let ms := Multiset.ofList lst;
let multiple_duplicates := ¬(∃ i, i ∈ lst → 2 < ms.count i )
let spec (res: Bool) :=
  if res then sorted_ascending ∧ ¬multiple_duplicates else ¬(sorted_ascending ∧ ¬multiple_duplicates);
-- program termination
∃ result, impl lst = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (lst: List Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation


-- start_def test_cases
-- #test implementation [5] = True
-- #test implementation [1, 2, 3, 4, 5] = True
-- #test implementation [1, 3, 2, 4, 5] = False
-- #test implementation [1, 2, 3, 4, 5, 6] = True
-- #test implementation [1, 2, 3, 4, 5, 6, 7] = True
-- #test implementation [1, 3, 2, 4, 5, 6, 7] = False
-- #test implementation [1, 2, 2, 3, 3, 4] = True
-- #test implementation [1, 2, 2, 2, 3, 4] = False
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
