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
-/
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
let multiple_duplicates := ∃ i, i ∈ lst ∧ 2 < ms.count i;
let spec (res: Bool) :=
  res = true ↔ sorted_ascending ∧ ¬multiple_duplicates
-- program terminates
∃ result, impl lst = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Bool)
-- inputs
(lst: List Int) : Prop :=
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
def implementation (lst: List Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation [5] = true
-- #test implementation [1, 2, 3, 4, 5] = true
-- #test implementation [1, 3, 2, 4, 5] = false
-- #test implementation [1, 2, 3, 4, 5, 6] = true
-- #test implementation [1, 2, 3, 4, 5, 6, 7] = true
-- #test implementation [1, 3, 2, 4, 5, 6, 7] = false
-- #test implementation [1, 2, 2, 3, 3, 4] = true
-- #test implementation [1, 2, 2, 2, 3, 4] = false
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
