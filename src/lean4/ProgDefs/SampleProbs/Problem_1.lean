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
def binarySearchLowHi (xs: List Int) (y: Int) (low: Nat) (hi: Nat)
(hi_leq_low: low ≤ hi)
(h_hi: hi < xs.length)
: Int :=
  if low > hi then -1
  else
    let sum := low + hi;
    let mid := if sum % 2 == 0
               then sum / 2
               else (sum - 1) / 2;
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
    have h_mid_leq_hi: mid + 1 ≤ hi := by
      sorry
    have low_leq_mid: low ≤ mid - 1 := by
      sorry
    have h_mid_leq_n: mid - 1 < xs.length := by
      sorry
    -- ^ NOTE: Prove the above lemma h_i_lt_n
    -- This proof is required to ensure that
    -- list.get can be called with the index `i`
    -- without any runtime errors.
    let mid_val := xs.get ⟨mid, h_i_lt_n⟩;
    if mid_val == y then mid
    else if mid_val < y then
      binarySearchLowHi xs y (mid + 1) hi h_mid_leq_hi h_hi
    else
      binarySearchLowHi xs y low (mid - 1) low_leq_mid h_mid_leq_n
termination_by hi - low
decreasing_by
  simp
  rename_i h_hi_leq_low
  -- We only have to prove termination for the recursive case when
  -- `low <= hi`. This is because the base case is already covered by the `if low > hi then -1` line.
  -- We rename the hypothesis to `h_hi_leq_low` to make it more readable.
  simp at h_hi_leq_low
  have h_sum_mod_2_eq_0_or_1 : sum % 2 = 0 ∨ sum % 2 = 1 := by
    sorry
  cases h_sum_mod_2_eq_0_or_1
  rename_i h_sum_mod_2_eq_0
  rw [h_sum_mod_2_eq_0] at *
  simp -- at this point, prove that hi - ((low + hi) / 2 + 1) < hi - low
  sorry
  rename_i h_sum_mod_2_eq_1
  rw [h_sum_mod_2_eq_1] at *
  simp -- at this point, prove that hi - ((low + hi - 1) / 2 + 1) < hi - low
  sorry
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
  if h : xs.isEmpty then -1
  else
    let h1 : 0 ≤ xs.length - 1 := Nat.zero_le (xs.length - 1)
    let h2 : xs.length - 1 < xs.length := by
      simp at h
      simp
      by_cases xs.length = 0
      rename_i h_len_eq_0
      have h_xs_empty : xs = [] := by
        apply List.eq_nil_of_length_eq_zero h_len_eq_0
      contradiction
      rename_i h_len_neq_0
      have h_len_gt_0 : xs.length > 0 := by
        apply Nat.pos_of_ne_zero h_len_neq_0
      simp [h_len_gt_0]
    binarySearchLowHi xs y 0 (xs.length - 1) h1 h2
