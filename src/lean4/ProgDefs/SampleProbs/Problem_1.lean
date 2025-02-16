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
  if low > hi then -1
  else
    let sum := low + hi;
    let mid := if sum % 2 == 0
               then sum / 2
               else (sum - 1) / 2;
    have h_i_lt_n : mid < xs.length := by
      sorry
    -- ^ NOTE: Prove the above lemma h_i_lt_n
    -- This proof is required to ensure that
    -- list.get can be called with the index `i`
    -- without any runtime errors.
    let mid_val := xs.get ⟨mid, h_i_lt_n⟩;
    if mid_val == y then mid
    else if mid_val < y then
      binarySearchLowHi xs y (mid + 1) hi
    else
      binarySearchLowHi xs y low (mid - 1)
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
  binarySearchLowHi xs y 0 (xs.length - 1)
