import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_prime(n)"
docstring: |
    Return true if a given number is prime, and false otherwise.
test_cases:
  - input: 6
    output: False
  - input: 101
    output: True
  - input: 11
    output: True
  - input: 13441
    output: True
  - input: 61
    output: True
  - input: 4
    output: False
  - input: 1
    output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Bool)
-- inputs
(n: Nat) :=
-- spec
let spec (result: Bool) :=
if result then Nat.Prime n else ¬ Nat.Prime n;
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: Nat → Bool)
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
def implementation (n: Nat): Bool :=
-- end_def implementation_signature
-- start_def implementation
Nat.Prime n
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 6 = false
#test implementation 101 = true
#test implementation 11 = true
#test implementation 13441 = true
#test implementation 61 = true
#test implementation 4 = false
#test implementation 1 = false
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
