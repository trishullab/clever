import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def find_max(words: List String) -> String"
docstring: |
    Write a function that accepts a list of strings.
    The list contains different words. Return the word with maximum number
    of unique characters. If multiple strings have maximum number of unique
    characters, return the one which comes first in lexicographical order.
test_cases:
  - input: ["name", "of", "string"]
    expected_output: "string"
  - input: ["name", "enam", "game"]
    expected_output: "enam"
  - input: ["aaaaaaa", "bb", "cc"]
    expected_output: "aaaaaaa"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List String → String)
-- inputs
(words: List String) :=
let unique_chars (string: String) :=
  let string_idx := {i: Nat | i < string.length}.toFinset;
  let characters := string_idx.image (fun i => string.toList.get! i);
  characters.card;
-- spec
let spec (result: String) :=
(result = "" ↔ words.length = 0) ∧
(result ∈ words ∧
let unique_chars_list := words.map unique_chars;
let max_unique_chars := unique_chars_list.max?.get!;
unique_chars result = max_unique_chars ∧
∀ i : Nat, i < words.length →
  unique_chars_list[i]! = max_unique_chars →
  result ≤ words[i]!);
-- program terminates
∃ result, impl words = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List String → String)
-- inputs
(words: List String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ words, problem_spec impl words) ↔
(∀ words, generated_spec impl words) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (words: List String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([1, 2, 2, -4]: List Int) = (-9: Int)
-- #test implementation ([0, 1]: List Int) = (0: Int)
-- #test implementation ([]: List Int) = none
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(words: List String)
: problem_spec implementation words :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
