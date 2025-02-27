import Mathlib


def Int32Max: Int32 := Int32.ofNat 2147483647
def Int64Max: Int64 := Int64.ofNat 9223372036854775807
def UInt32Max: UInt32 := UInt32.ofNat 4294967295

-- helper def
def string_eq_iff_data_eq (s1: String) (s2: String)
: s1.data = s2.data ↔ s1 = s2 := by
  apply Iff.intro
  intro h
  cases s1
  cases s2
  simp at h
  simp [h]
  intro h
  apply String.data_eq_of_eq
  exact h

def string_is_paren_balanced
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
      string_is_paren_balanced (paren_string.drop 1) (num_open + 1)
    else if c == ')' then
      string_is_paren_balanced (paren_string.drop 1) (num_open - 1)
    else
      string_is_paren_balanced (paren_string.drop 1) num_open
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

def count_paren_depth
(paren_string: String): Nat
:=
-- Recursively count the number of paren groups
if paren_string.isEmpty then
  0
else
  let c := paren_string.get! 0
  if c == '(' then
    1 + count_paren_depth (paren_string.drop 1)
  else
    count_paren_depth (paren_string.drop 1)
termination_by paren_string.length
decreasing_by
  all_goals
  {
    rename_i h_non_empty_string
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
