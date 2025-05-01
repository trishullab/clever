import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def words_in_sentence(sentence: String) -> String"
docstring: |
    You are given a string representing a sentence,
    the sentence contains some words separated by a space,
    and you have to return a string that contains the words from the original sentence,
    whose lengths are prime numbers,
    the order of the words in the new string should be the same as the original one.

    Constraints:
    * 1 <= len(sentence) <= 100
    * sentence contains only letters
test_cases:
  - input: "This is a test"
    expected_output: "is"
  - input: "lets go for swimming"
    expected_output: "go for"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → String)
-- inputs
(sentence: String) :=
-- spec
let spec (result: String) :=
let words := sentence.splitOn;
let result_words := result.splitOn;
  1 ≤ sentence.length → sentence.length ≤ 100 →
  sentence.all (fun x => Char.isAlpha x) →
  result_words.length ≤ words.length ∧
  (∀ word ∈ result_words, word ∈ words ∧ Nat.Prime word.length) ∧
  match result_words with
  | [] => ∀ word ∈ words, ¬(Nat.Prime word.length)
  | head :: tail => if Nat.Prime head.length ∧ head = words[0]! then String.join tail = impl (String.join (words.drop 1))
    else result = impl (String.join (words.drop 1))
-- program termination
∃ result, impl sentence = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String)
-- inputs
(sentence: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ sentence, problem_spec impl sentence) ↔
(∀ sentence, generated_spec impl sentence) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (sentence : String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "This is a test" = "is"
-- #test implementation "lets go for swimming" = "go for"
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(sentence : String)
: problem_spec implementation sentence :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
