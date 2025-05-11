import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def even_odd_palindrome(n: nat) -> (nat, nat)"
docstring: |
    Given a positive integer n, return a tuple that has the number of even and odd
    integer palindromes that fall within the range(1, n), inclusive.
test_cases:
  - input: 3
    expected_output: (1, 2)
  - input: 12
    expected_output: (4, 6)
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Nat × Nat)
-- inputs
(n: Nat) :=
-- spec
let spec (result: Nat × Nat) :=
  let is_palindrome (k: Nat): Prop :=
    List.Palindrome (Nat.digits 10 k);
  let even_palindrome (k: Nat): Prop :=
    (Even k) ∧ (is_palindrome k);
  let odd_palindrome (k: Nat): Prop :=
    (Odd k) ∧ (is_palindrome k);
  n > 0 →
  (1 < n →
    let impl_n_minus_1 := implementation (n - 1);
    ((even_palindrome n) → result.1 = 1 + impl_n_minus_1.1) ∧
    ((odd_palindrome n) → result.2 = 1 + impl_n_minus_1.2) ∧
    (¬ (odd_palindrome n) → result.2 = impl_n_minus_1.2) ∧
    (¬ (even_palindrome n) → result.1 = impl_n_minus_1.1))
  ∧
  (n = 1 → (result.1 = 0) ∧ (result.2 = 1));
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat × Nat)
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
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : Nat × Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 123 = (8, 13)
-- #test implementation 12 = (4, 6)
-- #test implementation 3 = (1, 2)
-- #test implementation 63 = (6, 8)
-- #test implementation 25 = (5, 6)
-- #test implementation 19 = (4, 6)
-- #test implementation 9 = (4, 5)
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
