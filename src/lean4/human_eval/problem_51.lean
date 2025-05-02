import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def remove_vowels(string: str) -> string"
docstring: |
    remove_vowels is a function that takes string and returns string without vowels.
test_cases:
  - input: ""
    expected_output: ""
  - input: "abcdef\nghijklm"
    expected_output: "bcdf\nghjklm"
  - input: "abcdef"
    expected_output: "bcdf"
  - input: "aaaaa"
    expected_output: ""
  - input: "aaBAA"
    expected_output: "B"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → String)
-- inputs
(string: String) :=
let check_vowels (s: String): Bool :=
  let vowels := "aeiouAEIOU"
  s.all (λ c => not (vowels.contains c))
-- spec
let spec (result: String) :=
let vowels := "aeiouAEIOU";
check_vowels result ∧ result.length ≤ string.length ∧
∀ c, result.contains c → string.contains c ∧
∀ c , string.contains c ∧ (not (vowels.contains c)) → (result.contains c);
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String)
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
def implementation (string: String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "" = ""
-- #test implementation "cat" = "catac"
-- #test implementation "cata" = "catac"
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
