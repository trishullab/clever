import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def below_zero(operations: List[int]) -> bool"
docstring: |
    You're given a list of deposit and withdrawal operations on a bank account that starts with
    zero balance. Your task is to detect if at any point the balance of account fallls below zero, and
    at that point function should return True. Otherwise it should return False.
test_cases:
  - input:
      - 1
      - 2
      - 3
    expected_output: false
  - input:
      - 1
      - 2
      - -4
      - 5
    expected_output: true
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Bool)
-- inputs
(operations: List Int) :=
-- spec
let below_zero_condition := ∃ i, i ≤ operations.length ∧
(operations.take i).sum < 0;
let spec (result: Bool) :=
if result then below_zero_condition else ¬below_zero_condition;
-- program terminates
∃ result, impl operations = result →
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (operations: List Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
let rec check (ops : List Int) (acc : Int) : Bool :=
  match ops with
  | []        => false
  | op :: ops' =>
    let new_acc := acc + op
    if new_acc < 0 then true else check ops' new_acc
check operations 0
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2, 3] = false
#test implementation [1, 2, -4, 5] = true
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(operations: List Int)
: problem_spec implementation operations
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
-- sometimes we have to create a temporary variable to use in the proof
unfold problem_spec
let result := implementation operations
use result
simp [result]
simp [implementation]
-- induction at this point will not work
-- because the induction hypothesis is not strong enough
-- we need to prove a stronger inductive hypothesis
have h_harder_inductive_hypothesis_true:
∀ h, ∀ ops,
implementation.check ops h = true →
∃ i, i ≤ ops.length ∧ h + (ops.take i).sum < 0 := by
  intros h ops h_check
  induction' ops generalizing h
  simp [implementation.check] at h_check
  rename_i head tail ih
  simp [implementation.check] at h_check
  by_cases h_head_lt_0 : h + head < 0
  use 1
  simp
  assumption
  simp at h_head_lt_0
  cases h_check
  linarith
  rename_i h_tail_sum_gt_0
  specialize ih (h + head)
  simp [h_tail_sum_gt_0] at ih
  obtain ⟨i, h_i_lt_tail_len, h_tail_sum_lt_0⟩ := ih
  use i + 1
  simp [h_i_lt_tail_len]
  linarith
by_cases h_if_pos: (implementation.check operations 0 = true)
simp [h_if_pos]
obtain ⟨i, h_i_lt_tail_len, h_tail_sum_lt_0⟩ := h_harder_inductive_hypothesis_true 0 operations h_if_pos
simp at h_tail_sum_lt_0
use i
have h_harder_inductive_hypothesis_false:
∀ h, ∀ ops, h ≥ 0 →
implementation.check ops h = false →
∀ i, i ≤ ops.length → h + (ops.take i).sum ≥ 0 := by
  intros h ops h_ge_0 h_check
  induction' ops generalizing h
  intros i h_i_lt_tail_len
  simp [implementation.check] at h_check
  simp
  linarith
  rename_i head tail ih
  simp [implementation.check] at h_check
  by_cases h_head_lt_0 : h + head < 0
  simp at h_head_lt_0
  cases h_check
  linarith
  simp at h_head_lt_0
  apply And.right at h_check
  specialize ih (h + head)
  simp at ih
  simp [h_head_lt_0, h_check] at ih
  intros i h_i_lt_tail_len
  simp at h_i_lt_tail_len
  simp
  specialize ih (i - 1)
  by_cases h_i_1_lt_i: 1 ≤ i
  let i' := i - 1
  have h_i'_lt_tail_len: i = i' + 1 := by
    simp [i']
    rw [Nat.sub_add_cancel]
    linarith
  simp [h_i'_lt_tail_len]
  rw [←Int.add_assoc]
  have h_i_minus_1_lt_tail_len: i - 1 ≤ tail.length := by
    linarith
  simp [h_i_minus_1_lt_tail_len] at ih
  simp [i']
  assumption
  simp at h_i_1_lt_i
  simp [h_i_1_lt_i] at ih
  simp [h_i_1_lt_i]
  linarith
simp at h_if_pos
simp [h_if_pos]
have h_harder' := h_harder_inductive_hypothesis_false 0 operations
simp at h_harder'
simp [h_if_pos] at h_harder'
intros i h_i_lt_tail_len
apply h_harder'
assumption
-- end_def correctness_proof
