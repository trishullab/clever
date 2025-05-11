import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def prime_length(s: str) -> bool"
docstring: |
    Write a function that takes a string and returns True if the string
    length is a prime number or False otherwise
test_cases:
  - input: "Hello"
    output: True
  - input: "abcdcba"
    output: True
  - input: "kittens"
    output: True
  - input: "orange"
    output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Bool)
-- inputs
(s: String) :=
-- spec
let spec (result : Bool) :=
let is_prime (n: Nat) : Prop :=
  ¬ (∃ k, 2 ≤ k ∧ k < n ∧ n % k = 0);
  result ↔ is_prime s.length
-- program termination
∃ result,
  implementation s = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Bool)
-- inputs
(s: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ s, problem_spec impl s) ↔
(∀ s, generated_spec impl s) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (s: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
Nat.Prime s.length
-- end_def implementation

-- start_def test_cases
-- #test implementation "Hello" = True
-- #test implementation "abcdcba" = True
-- #test implementation "kittens" = True
-- #test implementation "orange" = False
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(s: String)
: problem_spec implementation s
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation s
use result
simp [result]
simp [implementation]
apply Iff.intro
intro h_is_prime
simp [Nat.prime_def] at h_is_prime
intro x h_2_le_x h_x_lt_s_len
have h_p' := h_is_prime.2 x
by_contra h_s_len_mod_x
have h_x_dvd_s_len: x ∣ s.length := by
  apply Nat.dvd_of_mod_eq_zero
  exact h_s_len_mod_x
simp [h_x_dvd_s_len] at h_p'
have h_x_eq_s_len_false: ¬ (x = s.length) := by
  linarith
simp [h_x_eq_s_len_false] at h_p'
have h_x_ne_1: ¬ (x = 1) := by
  linarith
simp [h_x_ne_1] at h_p'
sorry
-- end_def correctness_proof
