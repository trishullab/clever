import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def string_xor(a: str, b: str) -> str"
docstring: |
    Input are two strings a and b consisting only of 1s and 0s.
    Perform binary XOR on these inputs and return result also as a string.
test_cases:
  - input:
      - "010"
      - "110"
    expected_output: "100"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → String → String)
-- inputs
(a b: String) :=
-- spec
let spec (result: String) :=
  a.all (fun c => c = '0' ∨ c = '1') →
  b.all (fun c => c = '0' ∨ c = '1') →
  a.length = b.length →
  result.length = a.length ∧
  result.all (fun c => c = '0' ∨ c = '1') ∧
  (∀ i, i < a.length →
  let i_pos := String.Pos.mk i;
  (a.get i_pos = b.get i_pos → result.get i_pos = '0') ∧
  (a.get i_pos ≠ b.get i_pos → result.get i_pos = '1'));
-- program termination
∃ result, implementation a b = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: String → String → String)
-- inputs
(a b: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
-- end_def generated_spec_body

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
def implementation (a b: String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "010" "110" = "100"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(a b: String)
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
