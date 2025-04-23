import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def largest_divisor(n: int) -> int"
docstring: |
    For a given number n, find the largest number that divides n evenly, smaller than n
test_cases:
  - input: 15
    expected_output: 5
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Nat)
-- inputs
(n: Nat) :=
-- spec
let spec (result: Nat) :=
0 < n → 0 < result → result | n → ∀ x, x ∣ n → x ≠ n → x ≤ result;
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: Nat → Nat)
-- inputs
(n: Nat) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ n, problem_spec implementation n) ↔
(∀ n, generated_spec implementation n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
let possible_divisors := (List.range (n / 2 + 1)).drop 1
let reversed_possible_divisors := List.reverse possible_divisors;
Id.run do
  for i in reversed_possible_divisors do
    if n % i = 0 then
      return i
  return 1
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 15 = 5
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n: Nat)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation n
use result
simp [result]
simp [implementation, Id.run]
have h_list_reverse : ∀ a, a ≥ 1 → (List.range' 1 a).reverse
  = a :: (List.range' 1 (a - 1)).reverse := by
  simp
  intro a h_a_ge_1
  let a' := a - 1
  have h_a_eq_a' : a = a' + 1 := by
    rw [Nat.sub_add_cancel h_a_ge_1]
  simp [h_a_eq_a']
  simp [List.range'_concat]
  simp [Nat.add_comm]
induction' n using Nat.strong_induction_on with n ih_n
have h_no_divisor_lt_n_gt_n_div_2:
  ∀ i, i > 0 → n / 2 < i → i < n → n % i ≠ 0 := by
  intro i
  induction' i using Nat.strong_induction_on with i ih_i
  intro h_i_gt_0 h_i_gt_n_div_2 h_i_lt_n
  have h_temp := Nat.lt_mul_of_div_lt h_i_gt_n_div_2 (by linarith)
  rw [Nat.mul_comm] at h_temp
  by_contra h_n_mod_i_eq_0
  rw [←Nat.div_lt_iff_lt_mul] at h_temp
  have h_n_div_i : (n / i) = 0 ∨ (n / i) = 1 := by
    rw [Nat.lt_add_one_iff_lt_or_eq] at h_temp
    cases h_temp
    rename_i h_n_div_i_lt_1
    rw [Nat.lt_add_one_iff_lt_or_eq] at h_n_div_i_lt_1
    cases h_n_div_i_lt_1
    contradiction
    left; assumption
    right; assumption
  cases h_n_div_i
  rename_i h_n_div_i_eq_0
  rw [Nat.div_eq_zero_iff] at h_n_div_i_eq_0
  cases h_n_div_i_eq_0
  rename_i h_i_eq_0
  rw [h_i_eq_0] at h_i_gt_0
  contradiction
  rename_i h_n_lt_i
  linarith
  rename_i h_n_div_i_eq_1
  rw [Nat.mod_eq_sub] at h_n_mod_i_eq_0
  rw [h_n_div_i_eq_1] at h_n_mod_i_eq_0
  simp at h_n_mod_i_eq_0
  rw [Nat.sub_eq_zero_iff_le] at h_n_mod_i_eq_0
  linarith
  linarith
by_cases h_n_ge_2: 1 ≤ n / 2
simp [h_list_reverse (n / 2) h_n_ge_2]
by_cases h_n_div_i: n % (n / 2) = 0
simp [h_n_div_i]
intro h_n_gt_0 x h_x_div_n h_x_neq_n
have h_x_ge_1 : x ≤ n := by
  apply Nat.le_of_dvd
  assumption
  assumption
have h_x_lt_n : x < n := by
  apply Nat.lt_of_le_of_ne
  assumption
  assumption
have h_x_lt_n_div_2 := h_no_divisor_lt_n_gt_n_div_2 x
by_cases h_x_gt_0: x > 0
simp [h_x_gt_0] at h_x_lt_n_div_2
by_cases h_x_gt_n_div_2: n / 2 < x
simp [h_x_gt_n_div_2] at h_x_lt_n_div_2
simp [h_x_lt_n] at h_x_lt_n_div_2
simp [Nat.dvd_iff_mod_eq_zero] at h_x_div_n
contradiction
linarith
linarith
simp [h_n_div_i]
intro h_0_lt_n x h_x_div_n h_x_neq_n
by_cases h_n_mod_2_eq_0: n % 2 = 0
have h_n_2_dvd_n := Nat.dvd_of_mod_eq_zero h_n_mod_2_eq_0
have h_n_eq_2_m: ∃ m, n = 2 * m := by
  use n / 2
  rw [Nat.mul_comm]
  rw [Nat.dvd_iff_div_mul_eq] at h_n_2_dvd_n
  rw [h_n_2_dvd_n]
obtain ⟨ m, h_n_eq_2_m ⟩ := h_n_eq_2_m
rw [h_n_eq_2_m] at h_n_div_i
have h_2_m_div_2 : (2 * m) / 2 = m := by
  simp
rw [h_2_m_div_2] at h_n_div_i
have h_2_m_mod_m_eq_0 : (2 * m) % m = 0 := by
  simp
contradiction
sorry
sorry
-- end_def correctness_proof
