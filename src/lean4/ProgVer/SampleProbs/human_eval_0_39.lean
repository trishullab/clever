import Imports.AllImports



theorem problem_0
(numbers: List Float) --inps
(threshold: Float)
(impl: List Float → Float → Bool) --impl
:
-- spec
let spec := ∃ i j, i < numbers.length ∧ j < numbers.length ∧ i ≠ j ∧
Float.abs (numbers.get! i - numbers.get! j) < threshold;
∃ result, impl numbers threshold = result → --Program termination (not needed when using Lean)
if result then spec else ¬spec
:= by
sorry

-- /*
--  Input to this function is a string containing multiple groups of nested parentheses. Your goal is to
--     separate those group into separate strings and return the list of those.
--     Separate groups are balanced (each open brace is properly closed) and not nested within each other
--     Ignore any spaces in the input string.

-- */
-- fn separate_paren_groups(paren_string: String) -> Vec<String>{

def problem_1_aux_1_string_is_balanced
(paren_string: String) (num_open: Nat): Bool
:=
-- Recursively check if the string is balanced
if num_open == 0 then
  paren_string.isEmpty
else
  if paren_string.isEmpty then
    false
  else
    let c := paren_string.get! 0
    if c == '(' then
      problem_1_aux_1_string_is_balanced (paren_string.drop 1) (num_open + 1)
    else if c == ')' then
      problem_1_aux_1_string_is_balanced (paren_string.drop 1) (num_open - 1)
    else
      problem_1_aux_1_string_is_balanced (paren_string.drop 1) num_open
termination_by paren_string.length
decreasing_by
  all_goals
  {
    rename_i _ h_non_empty_string
    rw [String.drop_eq, String.length]
    simp
    rw [String.isEmpty_iff] at h_non_empty_string
    by_cases h_paren_nil : paren_string.length ≤ 0
    rw [Nat.le_zero_eq] at h_paren_nil
    rw [←string_eq_iff_data_eq] at h_non_empty_string
    have h_temp : "".data = [] := by simp
    rw [h_temp] at h_non_empty_string
    rw [String.length] at h_paren_nil
    rw [List.length_eq_zero] at h_paren_nil
    contradiction
    have h_temp : paren_string.length > 0 := by linarith
    assumption
  }

theorem problem_1
(paren_string: String) --inps
(impl: String → List String) --impl
:
-- spec
let spec (c: String) := paren_string.containsSubstr c = true →
problem_1_aux_1_string_is_balanced c 0 = true;
∃ result, impl paren_string = result → -- Program terminates
∀ c, spec c → c ∈ result
→ ∀ str, str ∈ result → spec str
:= by
sorry

-- /*
--  Given a positive floating point number, it can be decomposed into
--     and integer part (largest integer smaller than given number) and decimals
--     (leftover part always smaller than 1).

--     Return the decimal part of the number.

-- */
-- fn truncate_number(number: &f32) -> f32{
theorem problem_2
(number: Float) --inps
(impl: Float → Float) --impl
:
-- spec
let spec := number - number.floor;
∃ result, impl number = result → --Program termination (not needed when using Lean)
result = spec
:= by
sorry

-- /*
--  You're given a list of deposit and withdrawal operations on a bank account that starts with
--     zero balance. Your task is to detect if at any point the balance of account fallls below zero, and
--     at that point function should return True. Otherwise it should return False.

-- */
-- fn below_zero(operations:Vec<i32>) -> bool{
theorem problem_3
(operations: List Int32) --inps
(impl: List Int32 → Bool) --impl
:
-- spec
let spec := ∃ i, i < operations.length ∧
(operations.take i).sum < 0;
∃ result, impl operations = result → --Program termination (not needed when using Lean)
if result then spec else ¬spec
:= by
sorry
