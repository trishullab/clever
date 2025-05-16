import Mathlib
import Mathlib.Algebra.Polynomial.Basic
import Std.Data.HashMap

-- start_def helper_definitions
/--
name: fibonacci_non_computable
use: |
  Non-computable definition to check if a number is a Fibonacci number.
problems:
  - 55
sample_problems:
  - 3
-/
inductive fibonacci_non_computable : ℕ → ℕ → Prop
| base0 : fibonacci_non_computable 0 0
| base1 : fibonacci_non_computable 1 1
| step  : ∀ n f₁ f₂, fibonacci_non_computable n f₁ →
fibonacci_non_computable (n + 1) f₂ →
fibonacci_non_computable (n + 2) (f₁ + f₂)
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: fibonacci_non_computable_4
use: |
  Non-computable definition to check if a number is a Fibonacci number such that
  fib(n) = fib(n - 1) + fib(n - 2) + fib(n - 3) + fib(n - 4).
problems:
  - 46
-/
inductive fibonacci_non_computable_4 : ℕ → ℕ → Prop
| base0 : fibonacci_non_computable_4 0 0
| base1 : fibonacci_non_computable_4 1 0
| base2 : fibonacci_non_computable_4 2 2
| base3 : fibonacci_non_computable_4 3 0
| step : ∀ n f₁ f₂ f₃ f₄, fibonacci_non_computable_4 n f₁ →
fibonacci_non_computable_4 (n + 1) f₂ →
fibonacci_non_computable_4 (n + 2) f₃ →
fibonacci_non_computable_4 (n + 3) f₄ →
fibonacci_non_computable_4 (n + 4) (f₁ + f₂ + f₃ + f₄)
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: fibonacci_non_computable_3
use: |
  Non-computable definition to check if a number is a Fibonacci number such that
  fib(n) = fib(n - 1) + fib(n - 2) + fib(n - 3).
problems:
  - 63
-/
inductive fibonacci_non_computable_3 : ℕ → ℕ → Prop
| base0 : fibonacci_non_computable_3 0 0
| base1 : fibonacci_non_computable_3 1 0
| base2 : fibonacci_non_computable_3 2 1
| step : ∀ n f₁ f₂ f₃, fibonacci_non_computable_3 n f₁ →
fibonacci_non_computable_3 (n + 1) f₂ →
fibonacci_non_computable_3 (n + 2) f₃ →
fibonacci_non_computable_3 (n + 3) (f₁ + f₂ + f₃)
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: string_eq_iff_data_eq
use: |
  Helper function to prove that two strings are equal if their data is equal.
problems: []
sample_problems:
  - 0
-/
def string_eq_iff_data_eq (s1: String) (s2: String)
: s1.data = s2.data ↔ s1 = s2 :=
by
  apply Iff.intro
  intro h
  cases s1
  cases s2
  simp at h
  simp [h]
  intro h
  apply String.data_eq_of_eq
  exact h
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: string_is_paren_balanced_helper
use: |
  Helper function to check if a string is balanced with respect to parentheses.
problems:
  - 1
  - 6
  - 132
sample_problems:
  - 0
-/
def string_is_paren_balanced_helper
(paren_string: String) (num_open: Int): Bool
:=
-- Recursively check if the string is balanced
if paren_string.isEmpty then
  num_open = 0
else
  let c := paren_string.get! 0
  if c == '(' then
    string_is_paren_balanced_helper (paren_string.drop 1) (num_open + 1)
  else if c == ')' then
    string_is_paren_balanced_helper (paren_string.drop 1) (num_open - 1)
  else
    string_is_paren_balanced_helper (paren_string.drop 1) num_open
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
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: string_is_paren_balanced
use: |
  Function to check if a string is balanced with respect to parentheses.
problems:
  - 1
  - 6
  - 132
sample_problems:
  - 0
-/
def string_is_paren_balanced
(paren_string: String): Bool
:=
string_is_paren_balanced_helper paren_string 0
-- end_def helper_definitions

/--
name: balanced_paren_non_computable
use: |
  Non-computable definition to check if a string is balanced with respect to parentheses.
problems:
  - 1
  - 6
  - 132
sample_problems:
  - 0
-/
def balanced_paren_non_computable
(paren_string: String) (bracket_type_left : Char) (bracket_type_right: Char): Prop
:=
let chars := paren_string.toList;
(∀ (i : ℕ), i ≤ chars.length → ((chars.take i).count bracket_type_right) ≤ ((chars.take i).count bracket_type_left)) ∧
(chars.count bracket_type_left = chars.count bracket_type_right)

-- start_def helper_definitions
/--
name: count_paren_groups_helper
use: |
  Helper to count the number of groups of parentheses in a string.
problems:
  - 1
-/
def count_paren_groups_helper
(paren_string: String) (num_open: Int) (num_groups: Nat): Nat :=
-- Recursively count the number of paren groups
if paren_string.isEmpty then
  num_groups
else
  let c := paren_string.get! 0
  if c == '(' then
    count_paren_groups_helper (paren_string.drop 1) (num_open + 1) num_groups
  else if c == ')' then
    let new_num_groups :=
    if num_open == 1 then num_groups + 1 else num_groups
    count_paren_groups_helper (paren_string.drop 1) (num_open - 1) new_num_groups
  else
    count_paren_groups_helper (paren_string.drop 1) num_open num_groups
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
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: count_paren_groups
use: |
  Function to count the number of groups of parentheses in a string.
problems:
  - 1
-/
def count_paren_groups
(paren_string: String): Nat :=
count_paren_groups_helper paren_string 0 0
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: count_max_paren_depth_helper
use: |
  Helper to count the maximum depth of parentheses in a string.
problems:
  - 6
  - 132
-/
def count_max_paren_depth_helper
(paren_string: String) (num_open: Int) (max_depth: Nat): Nat :=
-- Recursively count the maximum depth of parentheses
if paren_string.isEmpty then
  max_depth
else
  let c := paren_string.get! 0
  if c == '(' then
    let new_num_open := num_open + 1
    count_max_paren_depth_helper (paren_string.drop 1) (new_num_open) (max_depth.max new_num_open.toNat)
  else if c == ')' then
    count_max_paren_depth_helper (paren_string.drop 1) (num_open - 1) max_depth
  else
    count_max_paren_depth_helper (paren_string.drop 1) num_open max_depth
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
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: count_max_paren_depth
use: |
  Function to count the maximum depth of parentheses in a string.
problems:
  - 6
  - 132
-/
def count_max_paren_depth
(paren_string: String): Nat :=
count_max_paren_depth_helper paren_string 0 0
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: is_palindrome
use: |
  Helper to check if a string is a palindrome.
problems:
  - 10
  - 48
-/
def is_palindrome
(s: String): Bool :=
s = s.toList.reverse.asString
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: collatz_reachable
use: |
  Helper to check if a natural number m is reachable in the Collatz sequence starting at n.
problems:
  - 123
-/
def collatz_reachable (n m : Nat) : Prop :=
  ∃ k, Nat.iterate (fun x => if x % 2 = 0 then x / 2 else x * 3 + 1) k n = m
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: romanCharToValue
use: |
  Map from valid characters and their values
problems:
  - 156
sample_problems: []
-/
def romanCharToValue : Char → Nat
| 'i' => 1
| 'v' => 5
| 'x' => 10
| 'l' => 50
| 'c' => 100
| 'd' => 500
| 'm' => 1000
| _   => 0
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: validSubtractivePairs
use: |
  Legal subtractive pairs: first char can precede second for subtraction (in roman numerals)
problems:
  - 156
sample_problems: []
-/
def validSubtractivePairs : List (Char × Char) :=
  [('i', 'v'), ('i', 'x'), ('x', 'l'), ('x', 'c'), ('c', 'd'), ('c', 'm')]
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: maxRepetitions
use: |
  Max allowed repetitions for each character (in roman numerals)
problems:
  - 156
sample_problems: []
-/
def maxRepetitions : Char → Nat
| 'i' | 'x' | 'c' | 'm' => 3
| 'v' | 'l' | 'd'       => 1
| _                    => 0
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: countRepetitions
use: |
  Helper to count consecutive repetitions (in roman numerals)
problems:
  - 156
sample_problems: []
-/
def countRepetitions : List Char → Char → Nat → Nat
| [], _, n => n
| (h :: t), c, n => if h = c then countRepetitions t c (n + 1) else n
-- end_def helper_definitions


-- start_def helper_definitions
/--
name: validRepetition
use: |
  Helper to validate proper use of repetitions (in roman numerals)
problems:
  - 156
sample_problems: []
-/
partial def validRepetition : List Char → Bool
| [] => true
| c :: rest =>
  let max := maxRepetitions c
  let count := countRepetitions rest c 1
  count ≤ max ∧ validRepetition (rest.drop (count - 1))
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: validSubtractiveOrder
use: |
  Helper to validate legal subtractive combinations (in roman numerals)
problems:
  - 156
sample_problems: []
-/
def validSubtractiveOrder : List Char → Bool
| [] | [_] => true
| c1 :: c2 :: rest =>
  match romanCharToValue c1, romanCharToValue c2 with
  | v1, v2 =>
    if v1 < v2 then
      -- check if c1 and c2 form a legal subtractive pair
      (c1, c2) ∈ validSubtractivePairs ∧ validSubtractiveOrder rest
    else if v1 = 0 ∨ v2 = 0 then
      false
    else
      validSubtractiveOrder (c2 :: rest)
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: isValidRoman
use: |
  Function to check if a string is a roman numeral
problems:
  - 156
sample_problems: []
-/
def isValidRoman (s : String) : Bool :=
  s.data.all (λ c => romanCharToValue c ≠ 0) ∧
  validRepetition s.data ∧
  validSubtractiveOrder s.data
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: romanToDecimalAux
use: |
  Helper to convert list of roman characters to decimal
problems:
  - 156
sample_problems: []
-/
def romanToDecimalAux : List Char → Nat
| [] => 0
| c1 :: c2 :: rest =>
    let val1 := romanCharToValue c1
    let val2 := romanCharToValue c2
    if val1 < val2 then
      -- subtractive notation
      (val2 - val1) + romanToDecimalAux rest
    else
      val1 + romanToDecimalAux (c2 :: rest)
| [c] => romanCharToValue c
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: romanToDecimalAux
use: |
  Function to convert a valid lowercase Roman numeral string to Nat
problems:
  - 156
sample_problems: []
-/
def romanToDecimal (s : String) : Nat :=
  romanToDecimalAux s.data
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: mergeAlternately
use: |
  Helper Methods to mergeAlternately a list of strings
problems:
  - 160
sample_problems: []
-/
def mergeAlternately : List Nat → List String → List String
| [], []       => []
| [], y :: ys  => y :: mergeAlternately [] ys
| x :: xs, []  => x.repr :: mergeAlternately xs []
| x :: xs, y :: ys => x.repr :: y :: mergeAlternately xs ys
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: applyOp
use: |
  Helper method to apply operations on two integers
problems:
  - 160
sample_problems: []
-/
def applyOp (x y : Int) : String → Option Int
  | "+"  => some (x + y)
  | "-"  => some (x - y)
  | "*"  => some (x * y)
  | "//" => if y == 0 then none else some (x / y)
  | "**" =>
    if x < 0 then none
    else some (Int.ofNat ((Int.toNat x) ^ (Int.toNat y)))
  | _     => none
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: evalArith_pass
use: |
  Noncomputable relational spec for a single step evaluation (any op, ignoring precedence).
problems:
  - 160
sample_problems: []
-/
inductive evalArith_pass : List String → Int → Prop
| num {s : String} {n : Nat} (h : s.toNat! = n) :
    evalArith_pass [s] (Int.ofNat n)
| binOp {ts1 ts2 : List String} {op : String} {r1 r2 r : Int}
    (h1 : evalArith_pass ts1 r1)
    (h2 : evalArith_pass ts2 r2)
    (hop : applyOp r1 r2 op = some r) :
    evalArith_pass (ts1 ++ op :: ts2) r
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: evalArith_exp
use: |
  Relational spec for exponentiation (highest precedence).
problems:
  - 160
sample_problems: []
-/
inductive evalArith_exp : List String → Int → Prop
| of_pass {ts r} (h : evalArith_pass ts r) : evalArith_exp ts r
| step {ts1 ts2 r1 r2 r} (h1 : evalArith_exp ts1 r1) (h2 : evalArith_exp ts2 r2)
    (hop : applyOp r1 r2 "**" = some r) :
    evalArith_exp (ts1 ++ "**" :: ts2) r
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: evalArith_mul
use: |
  Relational spec for multiplication/division (middle precedence).
problems:
  - 160
sample_problems: []
-/
inductive evalArith_mul : List String → Int → Prop
| of_exp {ts r} (h : evalArith_exp ts r) : evalArith_mul ts r
| step {ts1 ts2 r1 r2 r} (h1 : evalArith_mul ts1 r1) (h2 : evalArith_mul ts2 r2)
    (hop : applyOp r1 r2 "*" = some r ∨ applyOp r1 r2 "//" = some r) :
    evalArith_mul (ts1 ++ "*" :: ts2) r
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: evalArith_mul
use: |
  Relational spec for addition/subtraction (lowest precedence).
problems:
  - 160
sample_problems: []
-/
inductive evalArith_add : List String → Int → Prop
| of_mul {ts r} (h : evalArith_mul ts r) : evalArith_add ts r
| step {ts1 ts2 r1 r2 r} (h1 : evalArith_add ts1 r1) (h2 : evalArith_add ts2 r2)
    (hop : applyOp r1 r2 "+" = some r ∨ applyOp r1 r2 "-" = some r) :
    evalArith_add (ts1 ++ "+" :: ts2) r
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: evalArith_mul
use: |
  Main function to evaluate an expression
problems:
  - 160
sample_problems: []
-/
def evalArith_precedence (ts : List String) (r : Int) : Prop :=
  evalArith_add ts r
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: is_subsequence
use: |
  Helper to check if List Char xs is a subsequence of List Char ys.
problems:
  - 132
-/
def is_subsequence (xs ys : List Char) : Bool :=
  match xs, ys with
  | [], _ => true
  | _, [] => false
  | x::xs', y::ys' =>
      if x = y then is_subsequence xs' ys' else is_subsequence xs ys'
-- end_def helper_definitions

-- start_def helper_definitions
/--
name: digit_sum
use: |
  Helper to sum the digits of a number. If the number is negative, the
  negative sign is treated as part of the first digit.
problems:
  - 145
-/
def digit_sum (n : Int) : Int :=
  let ds := (toString n.natAbs).toList.map fun c => c.toNat - Char.toNat '0'
  match ds with
  | [] => 0
  | d :: ds' =>
    let tail := ds'.foldl (· + ·) 0
    if n < 0 then Int.ofNat tail - Int.ofNat d
    else Int.ofNat (d + tail)
-- end_def helper_definitions

-- start_def test_cases
#test string_is_paren_balanced_helper "()" 0 = true
#test string_is_paren_balanced_helper "(())" 0 = true
#test string_is_paren_balanced_helper "(()())" 0 = true
#test string_is_paren_balanced_helper "(()" 0 = false
#test string_is_paren_balanced_helper "())" 0 = false
#test string_is_paren_balanced_helper "(()))" 0 = false
#test count_paren_groups "()" = 1
#test count_paren_groups "(())" = 1
#test count_paren_groups "(()())" = 1
#test count_paren_groups "(())()" = 2
#test count_paren_groups "(())()(())" = 3
#test count_paren_groups "(())()(())(())" = 4
#test count_paren_groups "(())()(())(())(())" = 5
#test count_paren_groups "((())()(())(())(())(()))" = 1
#test count_max_paren_depth "()" = 1
#test count_max_paren_depth "(())" = 2
#test count_max_paren_depth "(()())" = 2
#test count_max_paren_depth "(()" = 2
#test count_max_paren_depth "())" = 1
#test is_palindrome "" = true
#test is_palindrome "a" = true
#test is_palindrome "aa" = true
#test is_palindrome "aba" = true
#test is_palindrome "abba" = true
#test is_palindrome "abc" = false
#test is_palindrome "abcba" = true
#test is_palindrome "abccba" = true
#test is_palindrome "abcdba" = false
#test is_palindrome "abcddcbac" = false
#test is_palindrome "abcddcba" = true
#test digit_sum 15 = 6
#test digit_sum (-11) = 0
#test digit_sum (-63) = -3
#test digit_sum 0 = 0
#test digit_sum (-25) = 3
-- end_def test_cases
