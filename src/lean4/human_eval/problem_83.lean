import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def starts_one_ends(n: int) -> int"
docstring: |
    Given a positive integer n, return the count of the numbers of n-digit
    positive integers that start or end with 1.
    Note: For reviewer, I believe this is the most straightforward spec, and I am relying on Set cardianlity not being computable in general. The point of this problem is really to privide a formula.
    Note: But I guess a program that goes through each number and adds 1 will be the same as a program that computes in O(1) under this view.
test_cases:
  - input: 1
    output: 1
  - input: 2
    output: 18
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Nat)
-- inputs
(n: Nat) :=
-- spec
let spec (result : Nat) :=
  n > 0 →
  result = {k : ℕ | 10 ^ (n - 1) ≤ k ∧ k < 10 ^ n ∧ (k.repr.front = '1' ∨ k.repr.back = '1')}.ncard
-- program termination
∃ result,
  implementation n = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat)
-- inputs
(n: Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ n, problem_spec impl n) ↔
(∀ n, generated_spec impl n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation 1 = 1
-- #test implementation 2 = 18
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n: Nat)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
