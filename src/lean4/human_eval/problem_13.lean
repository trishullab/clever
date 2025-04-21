import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def greatest_common_divisor(a: int, b: int) -> int"
docstring: |
    Return a greatest common divisor of two integers a and b
test_cases:
  - input:
      - 25
      - 15
    expected_output: 5
  - input:
      - 3
      - 5
    expected_output: 1
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → Int → Int)
-- inputs
(a b: Int) :=
-- spec
let spec (result: Int) :=
(result ∣ a) ∧
(result ∣ b) ∧
(∀ (d': Int),
(d' > 0) → (d' ∣ a) → (d' ∣ b) →
d' ≤ result);
-- program termination
∃ result, implementation a b = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: Int → Int → Int)
-- inputs
(a b: Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
implementation a b = Int.gcd a b
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ a b, problem_spec implementation a b) ↔
(∀ a b, generated_spec implementation a b) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a b: Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
(Int.gcd a b)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 25 15 = 5
#test implementation 3 5 = 1
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(a b: Int)
: problem_spec implementation a b
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation a b
use result
simp [result]
sorry
-- end_def correctness_proof
