import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def longest(strings: List[str]) -> Optional[str]"
docstring: |
    Out of list of strings, return the longest one. Return the first one in case of multiple
    strings of the same length. Return None in case the input list is empty.
test_cases:
  - input: []
    expected_output: None
  - input: ["a", "b", "c"]
    expected_output: "a"
  - input: ["a", "bb", "ccc"]
    expected_output: "ccc"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List String → Option String)
-- inputs
(strings: List String) :=
-- spec
let spec (result: Option String) :=
  (result = none ↔ strings.length = 0) ∨
  (∃ longest, result = some longest →
  longest ∈ strings →
  ∀ s, s ∈ strings → s.length ≤ longest.length →
  (∃ i, i < strings.length →
  strings[i]! = longest → ∀ j < i, strings[j]!.length < longest.length));
-- program termination
∃ result, implementation strings = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (strings: List String) : Option String :=
-- end_def implementation_signature
-- start_def implementation
if strings = [] then none
else
  let longest := (strings.map (λ s => s.length)).maximum.get!
  (strings.find? (λ s => s.length = longest)).get!
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation ["a", "b", "c"] = some "a"
#test implementation ["a", "bb", "ccc"] = some "ccc"
#test implementation [] = none
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
sorry
-- end_def correctness_proof
