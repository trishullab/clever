import ProgDefs.SampleProbs.Problem_2

#eval fibonacci 10
#eval fibonacci' 10
#test fibonacci 10 = fibonacci' 10
#test fibonacci 0 = fibonacci' 0
#test fibonacci 1 = fibonacci' 1

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
set ih_n_minus_1 := ih (n - 1) -- You can use if you want
set ih_n_minus_2 := ih (n - 2) -- You might have to use this
specialize ih (n - 1)
--^ Notice how to apply the induction hypothesis
-- Hint: Is this sufficient to prove the goal?
-- Hint: We can also use set to add inductive hypothesis
-- for example, `set ih_n_minus_1 := ih (n - 1)` inplace of `specialize ih (n - 1)`
-- if we want to add another hypothesis to the context.
-- We can use `set ih_n_minus_2 := ih (n - 2)` to add another hypothesis.
clear ih_n_minus_1 ih_n_minus_2 -- You might want to comment this line
have h_n_minus_1_lt_n : n - 1 < n := by
  apply Nat.sub_lt
  cases n
  contradiction
  apply Nat.zero_lt_succ
  simp
simp [h_n_minus_1_lt_n] at ih
have h_n_minus_1_neq_0 : n - 1 ≠ 0 := by
  induction n
  contradiction
  simp
  rename_i n' ihn' ihn''
  induction n'
  contradiction
  simp
simp [h_n_minus_1_neq_0] at ih
by_cases (n = 2)
rename_i h_n_eq_2
simp [h_n_eq_2] at *
simp [fibonacci, fibonacci', Id.run]
rename_i h_n_neq_2
simp [h_n_neq_2] at *
-- Note that we want to prove
-- fibonacci n = fibonacci' (n - 1) + fibonacci' (n - 2)
-- But we only have:
-- ih: fibonacci (n - 1) = fibonacci' (n - 1 - 1) + fibonacci' (n - 1 - 2)
-- hard to proceed from here. Correct the proof.
-- You may want to remove some of the above lines
-- and start again.
admit
