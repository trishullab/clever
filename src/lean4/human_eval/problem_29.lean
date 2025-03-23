import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def filter_by_prefix(strings: List[str], prefix: str) -> List[str]"
docstring: |
    Filter an input list of strings only for ones that start with a given prefix.
test_cases:
  - input:
    - []
    - "a"
    expected_output: []
  - input:
    - ["abc", "bcd", "cde", "array"]
    - "a"
    expected_output: ["abc", "array"]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List String → String → List String)
-- inputs
(strings: List String)
(pref: String) :=
-- spec
let spec (result: List String) :=
result.all (λ s => s.startsWith pref) ∧
result.all (λ s => s ∈ strings) ∧
strings.all (λ s => s.startsWith pref → s ∈ result);
-- program termination
∃ result, implementation strings pref = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (strings: List String) (pref: String) : List String :=
-- end_def implementation_signature
-- start_def implementation
strings.filter (λ s => s.startsWith pref)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [] "a" = []
#test implementation ["abc", "bcd", "cde", "array"] "a" = ["abc", "array"]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(strings: List String)
(pref: String)
: problem_spec implementation strings pref
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation strings pref
use result
simp [result]
repeat sorry
-- end_def correctness_proof
