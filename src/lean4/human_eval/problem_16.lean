import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def count_distinct_characters(string: str) -> int"
docstring: |
    Given a string, find out how many distinct characters (regardless of case) does it consist of
test_cases:
  - input: "xyzXYZ"
    expected_output: 3
  - input: "Jerry"
    expected_output: 4
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
string.toLower.toList.toFinset.card = result
-- program termination
∃ result, implementation string = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (string: String) : Nat :=
-- end_def implementation_signature
-- start_def implementation
let char_set := string.toLower.toList.toFinset
char_set.card
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "xyzXYZ" = 3
#test implementation "Jerry" = 4
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
