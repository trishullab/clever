import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def concatenate(strings: List[str]) -> str"
docstring: |
    Concatenate list of strings into a single string
test_cases:
  - input: []
    expected_output: ""
  - input: ["a", "b", "c"]
    expected_output: "abc"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List String → String)
-- inputs
(strings: List String) :=
-- spec
let spec (result: String) :=
let result_chars := result.toList;
result_chars.length = (strings.map (λ s => s.length)).sum ∧
∀ i, i < strings.length →
(let string_in_result := strings.get! i;
let end_idx := ((strings.take (i + 1)).map (λ s => s.length)).sum;
let start_idx := end_idx - string_in_result.length;
let corresponding_string_in_result := ((result_chars.take end_idx).drop start_idx).asString;
corresponding_string_in_result = string_in_result);
-- program termination
∃ result, implementation strings = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (strings: List String) : String :=
-- end_def implementation_signature
-- start_def implementation
String.join strings
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [] = ""
#test implementation ["a", "b", "c"] = "abc"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(strings: List String)
: problem_spec implementation strings
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation strings
use result
simp [result]
apply And.intro
simp [implementation]
repeat sorry
-- end_def correctness_proof
