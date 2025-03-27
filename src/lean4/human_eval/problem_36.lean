import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def fizz_buzz(n: int)"
docstring: |
    Return the number of times the digit 7 appears in integers less than n which are divisible by 11 or 13.
test_cases:
  - input: 50
    output: 0
  - input: 78
    output: 2
  - input: 79
    output: 3
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
let all_numbers_lt_n := {x | x < n};
let multiples_of_11_or_13 := all_numbers_lt_n ∩ {x | x % 11 = 0 ∨ x % 13 = 0};
let possible_multiple_with_7 := multiples_of_11_or_13 ∩ {x | x.repr.contains '7'};
possible_multiple_with_7.toFinset.sum (λ x => x.repr.count '7') = result;
-- program termination
∃ result, implementation n = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
let all_numbers_lt_n := {x | x < n};
let multiples_of_11_or_13 := all_numbers_lt_n ∩ {x | x % 11 = 0 ∨ x % 13 = 0};
let possible_multiple_with_7 := multiples_of_11_or_13 ∩ {x | x.repr.contains '7'};
possible_multiple_with_7.toFinset.sum (λ x => x.repr.count '7')
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 50 = 0
#test implementation 78 = 2
#test implementation 79 = 3
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
simp [implementation]
-- end_def correctness_proof
