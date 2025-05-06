import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def largest_divisor(n: int) -> int"
docstring: |
    For a given number n, find the largest number that divides n evenly, smaller than n
test_cases:
  - input: 15
    expected_output: 5
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
0 < n → 0 < result → result ∣ n → ∀ x, x ∣ n → x ≠ n → x ≤ result;
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: Nat → Nat)
-- inputs
(n: Nat) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ n, problem_spec implementation n) ↔
(∀ n, generated_spec implementation n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
let possible_divisors := (List.range (n / 2 + 1)).drop 1
let reversed_possible_divisors := List.reverse possible_divisors;
Id.run do
  for i in reversed_possible_divisors do
    if n % i = 0 then
      return i
  return 1
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 15 = 5
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
sorry
-- end_def correctness_proof
