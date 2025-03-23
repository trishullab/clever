import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def all_prefixes(string: str) -> List[str]"
docstring: |
    Return list of all prefixes from shortest to longest of the input string
test_cases:
  - input: "abc"
    expected_output:
      - "a"
      - "ab"
      - "abc"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → List String)
-- inputs
(string: String) :=
-- spec
let spec (result: List String) :=
result.length = string.length ∧
∀ i, i < result.length →
result[i]! = string.take (i + 1);
-- program termination
∃ result, implementation string = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (string: String) : List String :=
-- end_def implementation_signature
-- start_def implementation
let rec aux (chars: List Char) (result: List String) (i: Nat) :=
if i < chars.length then
  aux chars (result ++ [(chars.take (i + 1)).asString]) (i + 1)
else
  result;
aux string.toList [] 0
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "abc" = ["a", "ab", "abc"]
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
