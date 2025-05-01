import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def strlen(string: str) -> int"
docstring: |
    Return length of given string
test_cases:
  - input: ""
    expected_output: 0
  - input: "abc"
    expected_output: 3
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Nat)
-- inputs
(string: String) :=
-- spec
let spec (result: Nat) :=
-- every character in the string is counted once
result = 0 ↔ string.isEmpty ∧
(0 < result → result - 1 = implementation (string.drop 1))
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: String → Nat)
-- inputs
(string: String) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ string, problem_spec implementation string) ↔
(∀ string, generated_spec implementation string) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (string: String): Nat :=
-- end_def implementation_signature
-- start_def implementation
string.length
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "" = 0
#test implementation "abc" = 3
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(string: String)
: problem_spec implementation string
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation string
use result
simp [result]
simp [implementation]
-- end_def correctness_proof
