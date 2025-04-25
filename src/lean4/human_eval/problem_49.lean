import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def modp(n: Nat, p: Nat) -> Nat"
docstring: |
    Return 2^n modulo p (be aware of numerics).
test_cases:
  - input: [3, 5]
    expected_output: 3
  - input: [1101, 101]
    expected_output: 2
  - input: [0, 101]
    expected_output: 0
  - input: [100, 101]
    expected_output: 1
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Nat → Nat)
-- inputs
(n p: Nat) :=
-- spec
let spec (result: Nat) :=
0 < p ∧
result < p ∧
(∃ k : Nat, p * k + result = Nat.pow 2 n)
-- program termination
∃ result, implementation n p = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat → Nat)
-- inputs
(n p: Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x y, problem_spec impl x y) ↔
(∀ x y, generated_spec impl x y) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n p: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 3 5 = 3
-- #test implementation 1101 101 = 2
-- #test implementation 0 101 = 1
-- #test implementation 3 11 = 8
-- #test implementation 100 101 = 1
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n p: Nat)
: problem_spec implementation n p
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation n p
use result
simp [result]
sorry
-- end_def correctness_proof
