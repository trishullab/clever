import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def flip_case(string: str) -> str"
docstring: |
    For a given string, flip lowercase characters to uppercase and uppercase to lowercase.
test_cases:
  - input: "Hello"
    expected_output: "hELLO"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → String)
-- inputs
(string: String) :=
-- spec
let spec (result: String) :=
let chars_in_result := result.toList;
let chars_in_string := string.toList;
chars_in_result.length = string.length ∧
(∀ i, i < chars_in_result.length →
  let c := chars_in_result.get! i;
  let c' := chars_in_string.get! i;
  (c.isUpper → c'.isLower) ∧
  (c.isLower → c'.isUpper) ∧
  ((¬ c.isUpper ∧ ¬ c.isLower) → c = c')
);
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: String → String)
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
def implementation (string: String) : String :=
-- end_def implementation_signature
-- start_def implementation
string.map (λ c => if c.isUpper then c.toLower else c.toUpper)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "Hello" = "hELLO"
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
sorry
-- end_def correctness_proof
