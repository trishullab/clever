import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_palindrome(string: str) -> Bool"
docstring: |
    Checks if given string is a palindrome
test_cases:
  - input: ""
    expected_output: True
  - input: "aba"
    expected_output: True
  - input: "aaaaa"
    expected_output: "True"
  - input: "zbcd"
    expected_output: "False"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Bool)
-- inputs
(string: String) :=
-- spec
let spec (result: Bool) :=
result ↔ is_palindrome string
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Bool)
-- inputs
(x: String) : Prop :=
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
def implementation (string: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "" = true
-- #test implementation "aba" = true
-- #test implementation "aaaaa" = true
-- #test implementation "zbcd" = false
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
sorry
-- end_def correctness_proof
