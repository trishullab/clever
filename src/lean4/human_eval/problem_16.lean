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
let string_idx := {i: Nat | i < string.length}.toFinset
let characters := string_idx.image (fun i => string.toList.get! i)
let lowercase_characters := characters.image (fun c => c.toLower)
result = lowercase_characters.card;
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: String → Nat)
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
rcases string with ⟨data⟩
induction data
simp
have h1: "".toLower = "" := by
  unfold String.toLower
  unfold Char.toLower
  unfold String.map
  unfold String.mapAux
  simp
  intros
  contradiction
simp [h1]
rename_i head tail ih
unfold String.toLower
rw [String.map_eq]
simp
sorry
-- end_def correctness_proof
