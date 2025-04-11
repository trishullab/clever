import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def find_magnitude(x: int) -> int"
docstring: |
    Given an integer x, your task is to find the magnitude of x.
    The magnitude of an integer is defined as the absolute value of the integer.
test_cases:
  - input:
      -1
    expected_output: 1
  - input:
      0
    expected_output: 0
  - input:
      5
    expected_output: 5
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → Int)
-- inputs
(x: Int) :=
-- spec
let spec (result: Int) :=
(result ≥ 0) ∧
(impl (-x) = result) ∧
(result = 0 ↔ x = 0) ∧
(0 ≤ x → impl (-x) + result = 2 * x) ∧
(x ≤ 0 → impl (-x) + result = -2 * x)
-- program terminates
∃ result, impl x = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int)
-- inputs
(x: Int) : Prop :=
--start_def generated_spec_body
impl x = if x < 0 then -x else x
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x, problem_spec impl x) ↔
(∀ x, generated_spec impl x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
by
unfold problem_spec
unfold generated_spec
simp
intro impl
apply Iff.intro
intro h_prob_spec
intro x
by_cases h_x_lt_0: x < 0
-- if x < 0 then
have h_x_le_0: x ≤ 0 := by
  linarith
simp [h_x_lt_0]
have h_impl := h_prob_spec x
simp [h_x_lt_0 ] at h_impl
have h_neg_impl := h_impl.2.2.2
simp [h_x_le_0] at h_neg_impl
linarith
simp [h_x_lt_0]
have h_impl := h_prob_spec x
simp at h_x_lt_0
simp [h_x_lt_0] at h_impl
have h_pos_impl := h_impl.2.2.2.1
linarith
intro h_generated_spec
intro x
by_cases h_x_lt_0: x < 0
-- if x < 0 then
have h_not_0_lt_x: ¬ (0 < x) := by
  linarith
have h_impl := h_generated_spec x
simp [h_x_lt_0] at h_impl
have h_0_le_impl_x: 0 ≤ impl x := by
  simp [h_impl]
  linarith
simp [h_0_le_impl_x]
have h_impl_neg_x := h_generated_spec (-x)
simp [h_x_lt_0] at h_impl_neg_x
simp [h_not_0_lt_x] at h_impl_neg_x
rw [←h_impl_neg_x] at h_impl
simp [h_impl]
apply And.intro
apply Iff.intro
intro h_impl_neg_x_eq_0
rw [h_impl_neg_x_eq_0] at h_impl_neg_x
linarith
intro h_x_eq_0
simp [h_x_eq_0]
simp [h_x_eq_0] at h_impl_neg_x
assumption
apply And.intro
intro h_0_leq_impl_x
linarith
intro h_x_le_0
simp [h_impl_neg_x]
linarith
have h_impl := h_generated_spec x
have h_0_le_x: 0 ≤ x := by
  linarith
simp [h_x_lt_0] at h_impl
have h_0_le_impl_x: 0 ≤ impl x := by
  simp [h_impl]
  linarith
simp [h_0_le_impl_x]
have h_impl_neg_x := h_generated_spec (-x)
simp [h_x_lt_0] at h_impl_neg_x
by_cases h_0_lt_x: 0 < x
simp [h_0_lt_x] at h_impl_neg_x
simp [h_impl_neg_x, h_impl]
apply And.intro
simp [h_0_le_x]
linarith
intro h_x_le_0
have h_x_eq_0: x = 0 := by
  linarith
simp [h_x_eq_0]
simp at h_0_lt_x
have h_x_eq_0: x = 0 := by
  linarith
simp [h_x_eq_0]
rw [h_x_eq_0] at h_impl
linarith
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (x: Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
if x < 0 then -x else x
-- end_def implementation


-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation (-1) = 1
#test implementation 0 = 0
#test implementation 5 = 5
#test implementation (-100) = 100
#test implementation 100 = 100
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(x: Int)
: problem_spec implementation x  :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation x
use result
simp [result]
simp [implementation]
by_cases h_0_eq_x: x = 0
-- if x = 0 then
simp [h_0_eq_x]
by_cases h_x_lt_0: x < 0
-- if 0 < x then
simp [h_x_lt_0]
apply And.intro
linarith
apply And.intro
intro; linarith
have h_not_0_lt_x: ¬ (0 < x) := by
  linarith
intro h_x_le_0
simp [h_not_0_lt_x]
linarith
apply And.intro
simp [h_x_lt_0]
linarith
simp [h_x_lt_0]
apply And.intro
intro h_neg_x_sum
linarith
apply And.intro
have h_0_le_x: 0 ≤ x := by
  linarith
simp [h_0_le_x]
by_cases h_0_lt_x: 0 < x
-- if 0 < x then
simp [h_0_lt_x]
linarith
have h_x_eq_0: x = 0 := by
  linarith
simp [h_x_eq_0]
intro h_x_le_0
simp at h_x_lt_0
have h_x_eq_0: x = 0 := by
  linarith
contradiction
-- end_def correctness_proof
