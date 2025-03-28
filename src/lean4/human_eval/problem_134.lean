import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def check_if_last_char_is_a_letter(txt: String) -> Bool"
docstring: |
    Create a function that returns True if the last character
    of a given string is an alphabetical character and is not
    a part of a word, and False otherwise.
    Note: "word" is a group of characters separated by space.
test_examples:
  - input: "apple pie"
    expected_output: False
  - input: "apple pi e"
    expected_output: True
  - input: "apple pi e "
    expected_output: False
  - input: ""
    expected_output: False
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → Bool)
-- inputs
(txt: String) :=
-- spec
let spec (result: Bool) :=
  let words := txt.split (fun x => x = ' '); -- double-check split works correctly
  let last_word := words[words.length-1]!;
  let last_unicode := (last_word.get 0).toNat;
  last_word.length == 1 ∧ ((last_unicode ≥ 65 ∧ last_unicode ≤ 90) ∨ (last_unicode ≥ 97 ∧ last_unicode ≤ 122)) = result;
-- program termination
∃ result, impl txt = result →
spec result
-- end_def problem_spec



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
