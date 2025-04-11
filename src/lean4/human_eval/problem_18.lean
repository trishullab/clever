import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def how_many_times(string: str, substring: str) -> int"
docstring: |
  Find how many times a given substring can be found in the original string. Count overlaping cases.
test_cases:
  - input:
      - ""
      - "a"
    expected_output: 0
  - input:
      - "aaa"
      - "a"
    expected_output: 3
  - input:
      - "aaaa"
      - "aa"
    expected_output: 3
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → String → Nat)
-- inputs
(string substring: String) :=
-- spec
let spec (result: Nat) :=
(string.length < substring.length → result = 0)
∧
(string.length = substring.length →
((string = substring ↔ result = 1) ∧
(substring ≠ string ↔ result = 0)))
∧
(substring.length < string.length  →
let subtring_start_idx := {i: Nat | i ≤ string.length - substring.length};
let substring_occurrences := {i ∈ subtring_start_idx | (string.take (i + substring.length)).drop i = substring };
result = substring_occurrences.toFinset.card);
-- program termination
∃ result, implementation string substring = result ∧
spec result
-- end_def problem_spec


-- start_def generated_spec
def generated_spec
-- function signature
(implementation: String → String → Nat)
-- inputs
(string substring: String) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ string substring, problem_spec implementation string substring) ↔
(∀ string substring, generated_spec implementation string substring) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (string: String) (substring: String) : Nat :=
-- end_def implementation_signature
-- start_def implementation
(string.findAllSubstr substring).size
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "aaa" "a" = 3
#test implementation "aaaa" "aa" = 3
#test implementation "" "a" = 0
#test implementation "a" "" = 1
#test implementation "a" "a" = 1
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(string: String)
(substring: String)
: problem_spec implementation string substring
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation string substring
use result
simp [result]
sorry
-- end_def correctness_proof
