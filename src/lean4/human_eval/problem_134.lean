import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def check_if_last_char_is_a_letter(txt: String) -> Bool"
docstring: |
    Create a function that returns True if the last character
    of a given string is an alphabetical character and is not
    a part of a word, and False otherwise.
    Note: "word" is a group of characters separated by space.
test_cases:
  - input: "apple pie"
    expected_output: False
  - input: "apple pi e"
    expected_output: True
  - input: "apple pi e "
    expected_output: False
  - input: ""
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → Bool)
-- inputs
(txt: String) :=
-- spec
let spec (result: Bool) :=
  let words := txt.splitOn " ";
  match words with
  | [] => result = False
  | [last_word] => (result ↔ last_word.length = 1) ∧ (let diff := (last_word.get 0).toLower.toNat - 'a'.toNat; 0 ≤ diff ∧ diff ≤ 25)
  | head::tail => result ↔ (let tail_txt := String.join tail; impl tail_txt);
-- program terminates
∃ result, impl txt = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Bool)
-- inputs
(txt: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ txt, problem_spec impl txt) ↔
(∀ txt, generated_spec impl txt) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (txt: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "apple pie" = false
-- #test implementation "apple pi e" = true
-- #test implementation "apple pi e " = false
-- #test implementation "" = false
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(txt: String)
: problem_spec implementation txt :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
