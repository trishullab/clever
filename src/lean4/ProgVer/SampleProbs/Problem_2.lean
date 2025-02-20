import ProgDefs.SampleProbs.Problem_2

#eval fibonacci 10
#eval fibonacci' 10
#test fibonacci 10 = fibonacci' 10
#test fibonacci 0 = fibonacci' 0
#test fibonacci 1 = fibonacci' 1

lemma fibonacci'_is_sum_of_previous_two (n : Nat) (h_n_ge_2 : n ≥ 2) :
fibonacci' n = fibonacci' (n - 1) + fibonacci' (n - 2) := by
rw [fibonacci', Id.run]
simp
have h_neq_0 : n ≠ 0 := by
  induction n
  contradiction
  simp
have h_neq_1 : n ≠ 1 := by
  induction n
  contradiction
  simp
  rename_i n' ihn'
  induction n'
  simp at h_n_ge_2
  simp
simp [h_neq_0, h_neq_1]

/-- Task 6:
Prove that the two definitions i.e.
`fibonacci` and `fibonacci'` are equivalent.
Fix the proof below. (Points: 15)
(Hint: We have to use the strong induction principle on `n`.)
(Hint: We also need to make sure that we pick
the values of `n` such that the recursive calls are valid.)
-/
lemma fibonacci_eq_fibonacci' (n : Nat) :
fibonacci n = fibonacci' n := by
rw [fibonacci']
induction' n using Nat.strong_induction_on with n ih
--^ Notice how to do strong strong induction on n
simp [Id.run, fibonacci]
simp [Id.run, fibonacci] at ih
by_cases (n = 0)
rename_i h_n_eq_0
simp [h_n_eq_0] at *
simp [fibonacci]
rename_i h_n_neq_0
simp [h_n_neq_0]
by_cases (n = 1)
rename_i h_n_eq_1
simp [h_n_eq_1] at *
simp [fibonacci, fibonacci', Id.run]
rename_i h_n_neq_1
simp [h_n_neq_1]
set ih_n_minus_1 := ih (n - 1)  -- You can use if you want
set ih_n_minus_2 := ih (n - 2) -- You might have to use this
have h_n_minus_1_lt_n : n - 1 < n := by
  apply Nat.sub_lt
  cases n
  contradiction
  apply Nat.zero_lt_succ
  simp
have h_n_minus_2_lt_n : n - 2 < n := by
  apply Nat.sub_lt
  cases n
  contradiction
  apply Nat.zero_lt_succ
  simp
simp [h_n_minus_1_lt_n] at ih_n_minus_1
simp [h_n_minus_2_lt_n] at ih_n_minus_2
have h_n_minus_1_neq_0 : n > 1 := by
  induction n
  contradiction
  simp
  rename_i n' ihn'
  induction n'
  contradiction
  simp
clear h_n_neq_1 h_n_neq_0 h_n_minus_1_lt_n h_n_minus_2_lt_n
have h_k_eq_n_plus_2 : ∃ k, n = k + 2 := by
  use n - 2
  induction n
  contradiction
  simp
  rename_i n' ihn'
  induction n'
  contradiction
  simp
obtain ⟨ k, h_k_eq_n_plus_2 ⟩ := h_k_eq_n_plus_2
simp [h_k_eq_n_plus_2] at *
unfold fibonacci
rw [ih_n_minus_1, ih_n_minus_2]
by_cases (k = 0)
rename_i h_k_eq_0
simp [h_k_eq_0] at *
simp [fibonacci, fibonacci', Id.run]
rename_i h_k_neq_0
simp [h_k_neq_0]
by_cases (k = 1)
rename_i h_k_eq_1
simp [h_k_eq_1] at *
simp [fibonacci, fibonacci', Id.run]
rename_i h_k_neq_1
simp [h_k_neq_1]
have h_k_gt_2 : k ≥ 2 := by
  induction k
  contradiction
  simp
  rename_i k' ihk
  induction k'
  contradiction
  simp
have h_fib_k_plus_1:  fibonacci' (k + 1) = fibonacci' k + fibonacci' (k - 1) := by
  rw [fibonacci'_is_sum_of_previous_two]
  simp
  linarith [h_k_gt_2]
rw [←h_fib_k_plus_1]
have h_fib_k_plus_1:  fibonacci' k = fibonacci' (k - 1) + fibonacci' (k - 2) := by
  rw [fibonacci'_is_sum_of_previous_two]
  linarith [h_k_gt_2]
rw [←h_fib_k_plus_1]
rw [Nat.add_comm]
