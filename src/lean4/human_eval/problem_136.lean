import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def largest_smallest_integers(lst: List[int]) -> Tuple[ Optional[Int], Optional[Int] ]"
docstring: |
    Create a function that returns a tuple (a, b), where 'a' is
    the largest of negative integers, and 'b' is the smallest
    of positive integers in a list.
    If there is no negative or positive integers, return them as None.
test_cases:
  - input: [2, 4, 1, 3, 5, 7]
    expected_output: (None, 1)
  - input: []
    expected_output: (None, None)
  - input: [0]
    expected_output: (None, None)
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Option Int × Option Int)
-- inputs
(lst: List Int) :=
-- spec
let spec (result: Option Int × Option Int) :=
  let (a, b) := result;
  (match a with
  | none => ¬(∃ i, i ∈ lst ∧ i < 0)
  | some a => a < 0 ∧ a ∈ lst ∧ ∀ i, i ∈ lst ∧ i < 0 → i ≤ a) ∧
  (match b with
  | none => ¬(∃ i, i ∈ lst ∧ 0 < i)
  | some b => 0 < b ∧ b ∈ lst ∧ ∀ i, i ∈ lst ∧ 0 < i → b ≤ i)
-- program termination
∃ result, impl lst = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Option Int × Option Int)
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
def implementation (lst: List Int) : (Option Int × Option Int) :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [2, 4, 1, 3, 5, 7] = (none, some 1)
-- #test implementation [] = (none, none)
-- #test implementation [0] = (none, none)
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
