import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def fib(n: int) -> int"
docstring: |
    Return n-th Fibonacci number.
test_cases:
  - input: 10
    expected_output: 55
  - input: 1
    expected_output: 1
  - input: 8
    expected_output: 21
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
fibonacci_non_computable n result
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat)
-- inputs
(x : Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x, problem_spec impl x) ↔
(∀ x, generated_spec impl x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 10 = 55
-- #test implementation 1 = 1
-- #test implementation 8 = 21
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
