import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def prime_fib(n: int)"
docstring: |
    prime_fib returns n-th number that is a Fibonacci number and it's also prime.
test_cases:
  - input: 1
    output: 2
  - input: 2
    output: 3
  - input: 3
    output: 5
  - input: 4
    output: 13
  - input: 5
    output: 89
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
n > 0 →
(∃ i, ∀ j, n ≤ j ∧ j ≤ i →
(result = Nat.fib i ∧
Nat.Prime (Nat.fib i) ∧
(i ≠ j → ¬ Nat.Prime (Nat.fib j))));
-- program termination
∃ result, implementation n = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
let rec fib_prime (n: Nat) (i: Nat) : Nat :=
  if Nat.Prime (Nat.fib i) then
    if n = 1 ∨ n = 0
    then Nat.fib i
    else fib_prime (n - 1) (i + 1)
  else fib_prime n (i + 1)
termination_by n
decreasing_by
  -- Really hard to prove termination here
  sorry
  sorry
fib_prime n 0
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- NOTE we changed to #eval! instead of #test
-- because we can't use #test for implementation
-- without a proof of termination
#eval! implementation 1 = 2
#eval! implementation 2 = 3
#eval! implementation 3 = 5
#eval! implementation 4 = 13
#eval! implementation 5 = 89
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
