import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def max_element(l: list)"
docstring: |
    Return maximum element in the list.
test_cases:
  - input: [1, 2, 3]
    output: 3
  - input: [5, 3, -5, 2, -3, 3, 9, 0, 123, 1, -10]
    output: 123
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Int)
-- inputs
(l: List Int) :=
-- spec
let spec (result: Int) :=
  l.length > 0 →
  ((∀ i, i < l.length → l.get! i ≤ result) ∧
  (∃ i, i < l.length ∧ l.get! i = result));
-- program termination
∃ result, implementation l = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List Int → Int)
-- inputs
(l: List Int) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ l, problem_spec implementation l) ↔
(∀ l, generated_spec implementation l) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (l: List Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
match List.maximum l with
| none => panic! "empty list"
| some x => x
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2, 3] = 3
#test implementation [5, 3, -5, 2, -3, 3, 9, 0, 123, 1, -10] = 123
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(l: List Int)
: problem_spec implementation l
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation l
use result
simp [result]
simp [implementation]
by_cases h_l_not_nil: l ≠ []
have h_max_not_none := List.maximum_ne_bot_of_ne_nil h_l_not_nil
intro h_len_gt_zero
apply And.intro
have h_l_max : ∃ r, l.maximum = some r := by
  have h_l_max' : l.maximum ≠ none := h_max_not_none
  rw [Option.ne_none_iff_exists] at h_l_max'
  obtain ⟨r, h_l_max⟩ := h_l_max'
  use r
  simp [h_l_max]
obtain ⟨r, h_l_max ⟩ := h_l_max
simp [h_l_max]
induction l
intro i h_i_lt_len
simp
simp at h_len_gt_zero
rename_i head tail ih
rw [List.maximum_cons] at h_l_max
by_cases h_tail_nil: tail = []
simp [h_tail_nil] at *
have h_head_eq_r : head = r := by
  simp [WithBot.some] at h_l_max
  rw [Option.some_inj] at h_l_max
  exact h_l_max
rw [h_head_eq_r]
simp [h_tail_nil] at ih
have h_0_lt_len: 0 < tail.length :=
   List.length_pos_of_ne_nil h_tail_nil
simp [h_0_lt_len] at ih
repeat sorry
-- end_def correctness_proof
