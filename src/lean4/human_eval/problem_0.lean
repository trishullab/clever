import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def has_close_elements(numbers: List[float], threshold: float) -> bool"
docstring: Check if in given list of numbers, are any two numbers closer to each other than given threshold.
test_cases:
  - input: [[1.0, 2.0, 3.0], 0.5]
    expected_output: False
  - input: [[1.0, 2.8, 3.0, 4.0, 5.0, 2.0], 0.3]
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Rat → Rat → Bool)
-- inputs
(numbers: List Rat)
(threshold: Rat) :=
-- spec
let numbers_within_threshold :=
numbers.length > 1 ∧
(∃ i j, i < numbers.length ∧ j < numbers.length ∧
i ≠ j ∧ |numbers.get! i - numbers.get! j| < threshold);
let spec (res: Bool) :=
if res then numbers_within_threshold else ¬numbers_within_threshold;
-- program terminates
∃ result, impl numbers threshold = result →
-- return value satisfies spec
spec result
-- if result then spec else ¬spec
-- end_def problem_spec

-- start_def implementation_signature
def implementation (numbers: List Rat) (threshold: Rat) : Bool :=
-- end_def implementation_signature
-- start_def implementation
match numbers with
| []       => false
| (x::xs)  => (xs.any (fun y => (|x - y| < threshold))) || implementation xs threshold
-- end_def implementation

-- start_def test_cases
-- Uncomment the following test cases after implementing the function
#test implementation ([1, 2, 3]: List Rat) 0.5 = false
#test implementation ([1, 2.8, 3, 4, 5, 2]: List Rat) 0.3 = true
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(numbers: List Rat)
(threshold: Rat)
: problem_spec implementation numbers threshold  :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers threshold
use result
simp [result]
induction numbers
simp [implementation]
rename_i head tail ih
simp at *
by_cases result = false
rename_i h_result_false
simp [result] at h_result_false
simp [h_result_false]
simp [implementation] at h_result_false
have h_tail_impl_false := And.right h_result_false
have h_head_in_threshold := And.left h_result_false
simp [h_tail_impl_false] at ih
by_cases h_1_lt_tail: 1 < tail.length
have h_0_lt_tail_len : 0 < tail.length := by linarith
simp [h_0_lt_tail_len, h_1_lt_tail]
simp [h_1_lt_tail] at ih
intros i h_i j h_j h_i_neq_j
by_cases i = 0
rename_i h_i_eq_0
simp [h_i_eq_0]
simp [h_i_eq_0] at h_i_neq_j
have h_0_lt_j : 0 < j := by
  contrapose! h_i_neq_j
  linarith
let j' := j - 1
have h_j'_tail : (head::tail)[j' + 1]! = tail[j']! := by
  rw [List.getElem!_cons_succ]
have h_j'_j : j' + 1 = j := by
  simp [j']
  rw [Nat.sub_add_cancel h_0_lt_j]
rw [←h_j'_j]
simp [h_j'_tail]
have h_j'_lt_tail_len : j' < tail.length := by
  linarith
simp [h_j'_lt_tail_len]
apply h_head_in_threshold
simp
rename_i h_i_neq_0
have h_0_lt_i : 0 < i := by
  contrapose! h_i_neq_0
  linarith
let i' := i - 1
have h_i'_tail : (head::tail)[i' + 1]! = tail[i']! := by
  rw [List.getElem!_cons_succ]
have h_i'_i : i' + 1 = i := by
  simp [i']
  rw [Nat.sub_add_cancel h_0_lt_i]
rw [←h_i'_i]
simp [h_i'_tail]
have h_i'_lt_tail_len : i' < tail.length := by
  linarith
simp [h_i'_lt_tail_len]
by_cases 0 < j
rename_i h_0_lt_j
let j' := j - 1
have h_j'_tail : (head::tail)[j' + 1]! = tail[j']! := by
  rw [List.getElem!_cons_succ]
have h_j'_j : j' + 1 = j := by
  simp [j']
  rw [Nat.sub_add_cancel h_0_lt_j]
rw [←h_j'_j]
simp [h_j'_tail]
have h_j'_lt_tail_len : j' < tail.length := by
  linarith
simp [h_j'_lt_tail_len]
have h_i'_neq_j' : i' ≠ j' := by
  contrapose! h_i_neq_j
  linarith
have h_final := ih i'
simp [h_i'_lt_tail_len] at h_final
have h_final' := h_final j' h_j'_lt_tail_len
simp [h_i'_neq_j'] at h_final'
simp [h_j'_lt_tail_len] at h_final'
assumption
rename_i h_j_le_0
have h_j_eq_0 : j = 0 := by
  linarith
simp [h_j_eq_0]
have h_head_minus_tail : tail[i'] - head = -(head - tail[i']) := by
  simp
rw [h_head_minus_tail]
have h_head_minus_tail_lt_threshold : |-(head - tail[i'])| = |head - tail[i']| := by
  rw [abs_neg]
rw [h_head_minus_tail_lt_threshold]
apply h_head_in_threshold
simp
have h_tl_eq_0 : tail.length ≤ 1 := by
  linarith
by_cases tail.length = 1
rename_i h_tl_eq_1
simp [h_tl_eq_1]
intros i h_i j h_j h_i_neq_j
by_cases i = 0
rename_i h_i_eq_0
simp [h_i_eq_0]
by_cases j = 0
rename_i h_j_eq_0
rw [h_j_eq_0] at h_i_neq_j
contradiction
by_cases j = 1
rename_i h_j_eq_1
simp [h_j_eq_1]
simp [h_tl_eq_1]
apply h_head_in_threshold
simp
rename_i h_j_neq_1 h_j_neq_0
have h_0_lt_j : 0 < j := by
  contrapose! h_j_neq_0
  simp at h_j_neq_0
  contradiction
have h_1_lt_j : 1 < j := by
  contrapose! h_j_neq_1
  have h_j_eq_1' : j = 1 := by
    linarith
  contradiction
linarith
rename_i h_i_neq_0
by_cases i = 1
rename_i h_i_eq_1
simp [h_i_eq_1]
simp [h_tl_eq_1]
by_cases j = 0
rename_i h_j_eq_0
simp [h_j_eq_0]
have h_head_minus_tail : tail[0] - head = -(head - tail[0]) := by
  simp
rw [h_head_minus_tail]
rw [abs_neg]
apply h_head_in_threshold
simp
by_cases j = 1
rename_i h_j_neq_0 h_j_eq_1
rw [h_j_eq_1] at h_i_neq_j
contradiction
rename_i h_j_neq_1 h_j_neq_0
have h_0_lt_j : 0 < j := by
  contrapose! h_j_neq_0
  simp at h_j_neq_0
  contradiction
have h_1_lt_j : 1 < j := by
  contrapose! h_j_neq_1
  have h_j_eq_1' : j = 1 := by
    linarith
  contradiction
linarith
rename_i h_i_neq_1
have h_0_lt_i : 0 < i := by
  contrapose! h_i_neq_1
  simp at h_i_neq_1
  contradiction
have h_1_lt_i : 1 < i := by
  contrapose! h_i_neq_0
  have h_i_eq_1' : i = 1 := by
    linarith
  contradiction
linarith
rename_i h_tl_neq_1
rw [Nat.le_one_iff_eq_zero_or_eq_one] at h_tl_eq_0
by_cases tail.length = 0
rename_i h_tl_eq_0
simp [h_tl_eq_0]
rename_i h_tl_neq_0
cases h_tl_eq_0
contradiction
contradiction
-- case when tail has two elements that are close to each other
rename_i h_result_true
simp at h_result_true
simp [result] at h_result_true
simp [h_result_true]
simp [implementation] at h_result_true
by_cases h_0_lt_tail_len : 0 < tail.length
rw [List.exists_mem_iff_getElem] at h_result_true
simp [h_0_lt_tail_len]
cases h_result_true
use 0
simp
rename_i h_head_in_threshold
obtain ⟨ j, h_j_lt_len, h_j_in_threshold ⟩ := h_head_in_threshold
use j + 1
simp [h_j_lt_len]
assumption
rename_i h_tail_has_close_elements
simp [h_tail_has_close_elements] at ih
by_cases h_1_lt_tail : 1 < tail.length
simp [h_1_lt_tail] at ih
obtain ⟨ i, h_i_lt_tail_len, h_i_in_threshold ⟩ := ih
use i + 1
have h_i_lt_tail_len' : i + 1 < tail.length + 1 := by linarith
simp [h_i_lt_tail_len']
obtain ⟨ j, h_j_lt_tail_len, h_i_neq_j, h_j_in_threshold ⟩ := h_i_in_threshold
use j + 1
simp [h_j_lt_tail_len]
simp [h_i_neq_j]
simp [h_i_lt_tail_len, h_j_lt_tail_len] at h_j_in_threshold
assumption
simp [h_1_lt_tail] at ih
simp at h_0_lt_tail_len
cases h_result_true
rename_i h_head_in_threshold
obtain ⟨ x, h_x_in_tail, _⟩ := h_head_in_threshold
rw [h_0_lt_tail_len] at h_x_in_tail
contradiction
rename_i h_tail_has_close_elements
simp [h_tail_has_close_elements] at ih
have h_1_lt_tail' : 1 < tail.length := by linarith
have h_0_lt_tail_len : 0 < tail.length := by linarith
simp [h_0_lt_tail_len]
simp [h_1_lt_tail'] at ih
obtain ⟨ i, h_i_lt_tail_len, h_i_in_threshold ⟩ := ih
use i + 1
have h_i_lt_tail_len' : i + 1 < tail.length + 1 := by linarith
simp [h_i_lt_tail_len']
obtain ⟨ j, h_j_lt_tail_len, h_i_neq_j, h_j_in_threshold ⟩ := h_i_in_threshold
use j + 1
simp [h_j_lt_tail_len]
simp [h_i_neq_j]
simp [h_i_lt_tail_len, h_j_lt_tail_len] at h_j_in_threshold
assumption
-- end_def correctness_proof
