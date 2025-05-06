import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def filter_by_substring(strings: List[str], substring: str) -> List[str]"
docstring: |
  Filter an input list of strings only for ones that contain given substring
test_cases:
  - input:
    - []
    - "a"
    expected_output: []
  - input:
    - ["abc", "bacd", "cde", "array"]
    - "a"
    expected_output: ["abc", "bacd", "array"]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List String → String → List String)
-- inputs
(strings: List String)
(substring: String)
:=
-- spec
let spec (result: List String) :=
(∀ i, i < result.length → result[i]!.containsSubstr substring →
∀ j, j < strings.length ∧ strings[j]!.containsSubstr substring → strings[j]! ∈ result →
∀ j, j < result.length → result.count result[j]! = strings.count result[j]!);
-- program termination
∃ result, implementation strings substring = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List String → String → List String)
-- inputs
(strings: List String)
(substring: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ strings substring, problem_spec implementation strings substring) ↔
(∀ strings substring, generated_spec implementation strings substring) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof


-- start_def implementation_signature
def implementation (strings: List String) (substring: String): List String :=
-- end_def implementation_signature
-- start_def implementation
strings.filter (fun x => x.containsSubstr substring)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [] "a" = []
#test implementation ["abc", "bacd", "cde", "array"] "a" = ["abc", "bacd", "array"]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(strings: List String)
(substring: String)
: problem_spec implementation strings substring
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation strings substring
use result
simp [result]
sorry
-- end_def correctness_proof
