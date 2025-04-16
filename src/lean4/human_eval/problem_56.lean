import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def correct_bracketing(brackets: str) -> Bool"
docstring: |
    brackets is a string of "<" and ">".
    return True if every opening bracket has a corresponding closing bracket.
test_cases:
  - input: "<"
    expected_output: False
  - input: "<>"
    expected_output: True
  - input: "<<><>>"
    expected_output: True
  - input: ""><<>"
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → Bool)
-- inputs
(brackets: String) :=
-- spec
let spec (result: Bool) :=
  result ↔ balanced_paren_non_computable brackets '<' '>'
-- program terminates
∃ result, impl brackets = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Bool)
-- inputs
(x : String) : Prop :=
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
def implementation (paren_string: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "( ) (( )) (( )( ))" = ["()", "(())", "(()())"]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(brackets: String)
: problem_spec implementation brackets :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation brackets
use result
simp [result]
sorry
-- end_def correctness_proof
