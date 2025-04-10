import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def fib4(n: int)"
docstring: |
    The Fib4 number sequence is a sequence similar to the Fibbonacci sequnece that's defined as follows:
    fib4(0) -> 0
    fib4(1) -> 0
    fib4(2) -> 2
    fib4(3) -> 0
    fib4(n) -> fib4(n-1) + fib4(n-2) + fib4(n-3) + fib4(n-4).
    Please write a function to efficiently compute the n-th element of the fib4 number sequence.  Do not use recursion.
test_cases:
  - input: 5
    output: 4
  - input: 6
    output: 8
  - input: 7
    output: 14
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
 (n = 0 → result = 0) ∨
 (n = 1 → result = 0) ∨
 (n = 2 → result = 2) ∨
 (n = 3 → result = 0) ∨
 (5 ≤ n → ∃ fib_array : List Nat, fib_array.length = n + 1 ∧
   fib_array[0]! = 0 ∧
   fib_array[1]! = 0 ∧
   fib_array[2]! = 2 ∧
   fib_array[3]! = 0 ∧
   (∀ i, 3 < i → i < n + 1 →
   fib_array[i]! = fib_array[i - 1]! + fib_array[i - 2]! +
   fib_array[i - 3]! + fib_array[i - 4]!) ∧
   result = fib_array[n]!)
-- program termination
∃ result, implementation n = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- NOTE we changed to #eval! instead of #test
-- because we can't use #test for implementation
-- without a proof of termination
-- #eval! implementation 1 = 2
-- #eval! implementation 2 = 3
-- #eval! implementation 3 = 5
-- #eval! implementation 4 = 13
-- #eval! implementation 5 = 89
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
repeat sorry
-- end_def correctness_proof
