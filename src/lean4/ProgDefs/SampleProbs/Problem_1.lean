import Imports.AllImports

-- Problem statement
-- Find the index of the first occurrence of a given integer.
-- If the integer is not in the list, return -1.

def findIndex : List Int → Int → Int
| [], _ => -1
| x::xs, y => if x == y then 0
              else
                let i := findIndex xs y;
                if i == -1 then
                  -1
                else
                  i + 1

def findIndexLessThanInSortedList : List Int → Int → Nat
| [], _ => 0
| x::xs, y => if y > x then 0
              else 1 + findIndexLessThanInSortedList xs y

def insertionSort : List Int → List Int
| [] => []
| x::xs =>  let sorted := insertionSort xs;
            let i := findIndexLessThanInSortedList sorted x;
            (sorted.take i) ++ [x] ++ (sorted.drop i)


/--
Complete the binary search function below.
It returns the index of the first occurrence of a given integer in
a sorted list. If the integer is not in the list, return -1.
Task 4:
(a) Write the proof for the `h_i_lt_n` lemma in the binarySearch function.
(Points: 4)
(b) Provide a termination measure for the binarySearchLowHi function
(Points: 8)
--/
def binarySearchLowHi (xs: List Int) (y: Int) (low: Nat) (hi: Nat): Int :=
  if h_out_of_bound: low > hi ∨ hi ≥ xs.length then -1
  else if h_low_eq_hi: low = hi then
    have h_low_lt_n: low < xs.length := by
      simp at h_out_of_bound
      apply And.right at h_out_of_bound
      rw [←h_low_eq_hi] at h_out_of_bound
      exact h_out_of_bound
    if xs.get ⟨low, h_low_lt_n⟩  == y then low
    else -1
  else
    let sum := low + hi;
    let mid := if sum % 2 == 0
                then sum / 2
                else (sum - 1) / 2;
    have hi_leq_low: low ≤ hi := by
      simp at h_out_of_bound
      apply And.left at h_out_of_bound
      exact h_out_of_bound
    have h_hi: hi < xs.length := by
      simp at h_out_of_bound
      apply And.right at h_out_of_bound
      exact h_out_of_bound
    have h_i_lt_n : mid < xs.length := by
      have h_sum_mod_2_eq_0_or_1 : sum % 2 = 0 ∨ sum % 2 = 1 := by
        apply Nat.mod_two_eq_zero_or_one sum
      cases h_sum_mod_2_eq_0_or_1
      rename_i h_sum_mod_2_eq_0
      simp [mid, h_sum_mod_2_eq_0, sum]
      have ineq1 : low < xs.length := by
        simp [Nat.lt_of_le_of_lt hi_leq_low h_hi]
      have ineq2 : low + hi < xs.length + xs.length := by
        apply Nat.add_lt_add ineq1 h_hi
      have ineq3 : low + hi < 2 * xs.length := by
        rw [Nat.mul_comm, Nat.mul_two]
        exact ineq2
      apply Nat.lt_of_lt_of_le (Nat.div_lt_of_lt_mul ineq3)
      simp
      rename_i h_sum_mod_2_eq_1
      simp [mid, h_sum_mod_2_eq_1, sum]
      have ineq1 : low < xs.length := by
        simp [Nat.lt_of_le_of_lt hi_leq_low h_hi]
      have ineq2 : low + hi < xs.length + xs.length := by
        apply Nat.add_lt_add ineq1 h_hi
      have ineq3 : low + hi < 2 * xs.length := by
        rw [Nat.mul_comm, Nat.mul_two]
        exact ineq2
      have ineq4 : sum - 1 < 2 * xs.length := by
        apply Nat.lt_of_le_of_lt (Nat.sub_le _ _)
        exact ineq3
      simp [sum] at ineq4
      apply Nat.lt_of_lt_of_le (Nat.div_lt_of_lt_mul ineq4)
      simp
    -- ^ NOTE: Prove the above lemma h_i_lt_n
    -- This proof is required to ensure that
    -- list.get can be called with the index `i`
    -- without any runtime errors.
    let mid_val := xs.get ⟨mid, h_i_lt_n⟩;
    -- if h_low_eq_hi: low = hi then
    --   if mid_val == y then mid
    --   else -1
    -- else
    if h_mid_val_eq_y: mid_val == y then mid
    else if h_mid_val_lt_y: mid_val < y then
      binarySearchLowHi xs y (mid + 1) hi
    else
      binarySearchLowHi xs y low (mid - 1) -- found bug here
termination_by (hi + 1) - low
decreasing_by
  have h_sum_mod_2_eq_0_or_1 : sum % 2 = 0 ∨ sum % 2 = 1 := by
    apply Nat.mod_two_eq_zero_or_one sum
  cases h_sum_mod_2_eq_0_or_1
  rename_i h_sum_mod_2_eq_0
  simp [mid, h_sum_mod_2_eq_0, sum]
  rw [Nat.add_comm hi 1]
  rw [Nat.add_sub_assoc]
  rw [Nat.add_comm 1]
  rw [Nat.lt_add_one_iff]
  rw [Nat.sub_le_sub_iff_left hi_leq_low]
  rw [Nat.le_div_iff_mul_le]
  rw [Nat.mul_two]
  linarith
  simp
  exact hi_leq_low
  rename_i h_sum_mod_2_eq_1
  simp [mid, h_sum_mod_2_eq_1, sum]
  have h_hi_low_1 : hi + 1 - low = hi - low + 1 := by
    -- use the fact that low ≤ hi
    rw [Nat.add_comm]
    rw [Nat.add_sub_assoc]
    rw [Nat.add_comm]
    exact hi_leq_low
  rw [h_hi_low_1]
  rw [Nat.lt_add_one_iff]
  rw [Nat.sub_le_sub_iff_left hi_leq_low]
  rw [Nat.le_div_iff_mul_le]
  rw [Nat.mul_two]
  rw [Nat.le_sub_one_iff_lt]
  have h_low_lt_hi: low < hi := by
    rw [Nat.lt_iff_le_and_ne]
    apply And.intro
    exact hi_leq_low
    exact h_low_eq_hi
  have h_low_plus_low_lt_low_plus_hi: low + low < low + hi := by
    apply Nat.add_lt_add_left h_low_lt_hi
  assumption
  by_cases h_0_lt_low_plus_hi: 0 < low + hi
  assumption
  simp at h_0_lt_low_plus_hi
  have h_low_eq_0 : low = 0 := by
    apply And.left at h_0_lt_low_plus_hi
    assumption
  have h_hi_eq_0 : hi = 0 := by
    apply And.right at h_0_lt_low_plus_hi
    assumption
  have h_sum_eq_0 : sum = 0 := by
    simp [sum]
    exact h_0_lt_low_plus_hi
  simp [h_sum_eq_0] at h_sum_mod_2_eq_1
  simp
  have h_sum_mod_2_eq_0_or_1 : sum % 2 = 0 ∨ sum % 2 = 1 := by
    apply Nat.mod_two_eq_zero_or_one sum
  cases h_sum_mod_2_eq_0_or_1
  rename_i h_sum_mod_2_eq_0
  simp [mid, h_sum_mod_2_eq_0, sum]
  rw [Nat.sub_lt_sub_iff_right]
  rw [Nat.sub_one_add_one]
  rw [Nat.lt_add_one_iff]
  have h_low_lt_hi: low < hi := by
    rw [Nat.lt_iff_le_and_ne]
    apply And.intro
    exact hi_leq_low
    exact h_low_eq_hi
  have h_low_plus_hi_lt_hi_plus_hi: low + hi < hi + hi := by
    apply Nat.add_lt_add_right h_low_lt_hi
  have h_low_plus_hi_lt_2_hi: low + hi < 2 * hi := by
    rw [Nat.mul_comm, Nat.mul_two]
    exact h_low_plus_hi_lt_hi_plus_hi
  have h_low_plus_hi_div_lt_hi: (low + hi) / 2 < hi := by
    apply Nat.div_lt_of_lt_mul h_low_plus_hi_lt_2_hi
  linarith
  simp
  have h_low_hi_min : low + low ≤ low + hi := by
    apply Nat.add_le_add_left hi_leq_low
  -- enumerate all possible values of low and hi
  by_cases h_low_plus_hi_lt_2 : low + hi < 2
  have h_low_eq_0_or_1 : low = 0 ∨ low = 1 := by
    have h_low_lt_1: low ≤ 1 := by
      linarith
    rw [Nat.le_one_iff_eq_zero_or_eq_one] at h_low_lt_1
    assumption
  have h_hi_eq_0_or_1 : hi = 0 ∨ hi = 1 := by
    have h_hi_lt_1: hi ≤ 1 := by
      linarith
    rw [Nat.le_one_iff_eq_zero_or_eq_one] at h_hi_lt_1
    assumption
  cases h_low_eq_0_or_1
  cases h_hi_eq_0_or_1
  rename_i h_low_eq_0 h_hi_eq_0
  rw [h_low_eq_0, h_hi_eq_0] at h_low_eq_hi
  contradiction
  rename_i h_hi_eq_1 h_low_eq_0
  simp [sum] at h_sum_mod_2_eq_0
  rw [h_hi_eq_1, h_low_eq_0] at h_sum_mod_2_eq_0
  contradiction
  rename_i h_low_eq_1
  cases h_hi_eq_0_or_1
  rename_i h_hi_eq_0
  simp [sum] at h_sum_mod_2_eq_0
  rw [h_hi_eq_0, h_low_eq_1] at h_sum_mod_2_eq_0
  contradiction
  rename_i h_hi_eq_1
  rw [h_low_eq_1, h_hi_eq_1] at h_low_eq_hi
  contradiction
  simp at h_low_plus_hi_lt_2
  assumption
  rw [Nat.sub_one_add_one]
  rw [Nat.le_div_iff_mul_le]
  rw [Nat.mul_two]
  rw [Nat.add_le_add_iff_left]
  exact hi_leq_low
  simp
  by_cases h_low_plus_hi_eq_0: (low + hi)/2 = 0
  rw [Nat.div_eq_zero_iff] at h_low_plus_hi_eq_0
  simp at h_low_plus_hi_eq_0
  have h_low_plus_hi_le_1: low + hi ≤ 1 := by
    rw [Nat.lt_add_one_iff] at h_low_plus_hi_eq_0
    assumption
  have h_low_eq_0_or_1 : low = 0 ∨ low = 1 := by
    have h_low_lt_1: low ≤ 1 := by
      linarith
    rw [Nat.le_one_iff_eq_zero_or_eq_one] at h_low_lt_1
    assumption
  have h_hi_eq_0_or_1 : hi = 0 ∨ hi = 1 := by
    have h_hi_lt_1: hi ≤ 1 := by
      linarith
    rw [Nat.le_one_iff_eq_zero_or_eq_one] at h_hi_lt_1
    assumption
  cases h_low_eq_0_or_1
  cases h_hi_eq_0_or_1
  rename_i h_low_eq_0 h_hi_eq_0
  rw [h_low_eq_0, h_hi_eq_0] at h_low_eq_hi
  contradiction
  rename_i h_hi_eq_1 h_low_eq_0
  simp [sum] at h_sum_mod_2_eq_0
  rw [h_hi_eq_1, h_low_eq_0] at h_sum_mod_2_eq_0
  contradiction
  rename_i h_low_eq_1
  cases h_hi_eq_0_or_1
  rename_i h_hi_eq_0
  simp [sum] at h_sum_mod_2_eq_0
  rw [h_hi_eq_0, h_low_eq_1] at h_sum_mod_2_eq_0
  contradiction
  rename_i h_hi_eq_1
  rw [h_low_eq_1, h_hi_eq_1] at h_low_eq_hi
  contradiction
  simp at *
  assumption
  rename_i h_sum_mod_2_eq_1
  simp [mid, h_sum_mod_2_eq_1, sum]
  rw [Nat.sub_lt_sub_iff_right]
  rw [Nat.add_lt_add_iff_right]
  have h_0_lt_2: 0 < 2 := by linarith
  rw [←Nat.mul_lt_mul_left h_0_lt_2]
  have h_hi_gt_1: 1 ≤ hi := by
    by_cases h_hi_le_1: hi < 1
    have h_hi_eq_0: hi = 0 := by linarith
    have h_low_eq_0: low = 0 := by linarith [hi_leq_low]
    rw [h_hi_eq_0, h_low_eq_0] at h_low_eq_hi
    contradiction
    linarith
  set hi_minus_1 := hi - 1
  have h_low_plus_hi_minus_1_mod_2_eq_0: (low + hi - 1) % 2 = 0 := by
    simp [sum] at h_sum_mod_2_eq_1
    rw [←Nat.mod_add_mod] at h_sum_mod_2_eq_1
    rw [Nat.add_sub_assoc]
    rw [←Nat.mod_add_mod]
    have h_hi_eq_hi_minus_1_plus_1: hi = hi_minus_1 + 1 := by
      rw [Nat.sub_add_cancel h_hi_gt_1]
    by_cases h_low_mod_2_eq_0: low % 2 = 0
    simp [h_low_mod_2_eq_0]
    simp [h_low_mod_2_eq_0] at h_sum_mod_2_eq_1
    by_cases h_hi_minus_1_mod_2_eq_0: (hi - 1) % 2 = 0
    assumption
    simp at h_hi_minus_1_mod_2_eq_0
    rw [h_hi_eq_hi_minus_1_plus_1] at h_sum_mod_2_eq_1
    have h_temp := Nat.mod_two_add_succ_mod_two hi_minus_1
    rw [h_hi_minus_1_mod_2_eq_0, h_sum_mod_2_eq_1] at h_temp
    contradiction
    simp at h_low_mod_2_eq_0
    rw [h_low_mod_2_eq_0] at h_sum_mod_2_eq_1
    rw [Nat.add_comm] at h_sum_mod_2_eq_1
    have h_temp := Nat.mod_two_add_succ_mod_two hi
    simp [h_sum_mod_2_eq_1] at h_temp
    have h_temp' := Nat.mod_two_add_succ_mod_two hi_minus_1
    rw [←h_hi_eq_hi_minus_1_plus_1] at h_temp'
    simp [h_temp] at h_temp'
    rw [h_low_mod_2_eq_0]
    rw [Nat.add_comm]
    rw [←h_hi_eq_hi_minus_1_plus_1]
    assumption
    by_cases h_hi_le_1: hi < 1
    have h_hi_eq_0: hi = 0 := by linarith
    have h_low_eq_0: low = 0 := by linarith [hi_leq_low]
    rw [h_hi_eq_0, h_low_eq_0] at h_low_eq_hi
    contradiction
    linarith
  rw [Nat.mul_comm]
  sorry



-- NOTE: ^ One must provide a termination measure/decreases by for recursive functions in Lean which
-- don't satisfy the structural recursion principle. In this case, the termination measure
-- is the length of the list `xs`. This was not needed for other functions because they
-- were structurally recursive i.e. one could see that all possible cases for the list
-- were covered in the recursive calls.
-- These termination measures are used by the Lean compiler to ensure that the function
-- will terminate for all inputs. And we won't have issues relate to halting problem.

/--
It returns the index of the first occurrence of a given integer in
a sorted list. If the integer is not in the list, return -1.
-/
def binarySearch (xs: List Int) (y: Int): Int :=
  binarySearchLowHi xs y 0 (xs.length - 1)
