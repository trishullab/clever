import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def remove_vowels(string: str) -> Nat"
docstring: |
    Write a function vowels_count which takes a string representing
    a word as input and returns the number of vowels in the string.
    Vowels in this case are 'a', 'e', 'i', 'o', 'u'. Here, 'y' is also a
    vowel, but only when it is at the end of the given word.
test_cases:
  - input: "abcde"
    expected_output: 2
  - input: "ACEDY"
    expected_output: 3
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
let string_list := string.toList;
let vowel_count := (string_list.filter (fun c => c = 'a' ∨ c = 'e' ∨ c = 'i' ∨ c = 'o' ∨ c = 'u' ∨
                            c = 'A' ∨ c = 'E' ∨ c = 'I' ∨ c = 'O' ∨ c = 'U')).length
(string.length = 0 → result = 0) ∧
(string_list.length > 0 →
(result = vowel_count ↔ (string_list[string_list.length - 1]! != 'y' ∧
                          string_list[string_list.length - 1]! != 'Y')) ∨
(result = vowel_count + 1 ↔ (string_list[string_list.length - 1]! = 'y' ∨
                          string_list[string_list.length - 1]! = 'Y')));
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Nat)
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
def implementation (string: String) : Nat :=
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
