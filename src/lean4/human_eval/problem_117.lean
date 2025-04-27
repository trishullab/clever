import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def select_words(s : str, n : int) -> list[str]"
docstring: |
    Given a string s and a natural number n, you have been tasked to implement
    a function that returns a list of all words from string s that contain exactly
    n consonants, in order these words appear in the string s.
    If the string s is empty then the function should return an empty list.
    Note: you may assume the input string contains only letters and spaces.
test_cases:
  - input: "Mary had a little lamb", 4
    expected_output: ["little"]
  - input: "Mary had a little lamb", 3
    expected_output: ["Mary", "lamb"]
  - input: "simple white space", 2
    expected_output: []
  - input: "Hello world", 4
    expected_output: ["world"]
  - input: "Uncle sam", 3
    expected_output: ["Uncle"]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Nat → List String)
-- inputs
(s: String)
(n: Nat) :=
-- spec
let spec (result : List String) :=
  let is_consonant (c: Char) :=
    c ∉ ['a', 'e', 'i', 'o', 'u'] ∧
    c ∉ ['A', 'E', 'I', 'O', 'U'] ∧
    c.isAlpha
  s.all (fun c => c = ' ' ∨ c.isAlpha) →
  (s.length = 0 → result = []) ∧
  let words := s.splitOn " "
  (result.length > 0 →
    let first_word := result[0]!
    first_word ∈ words ∧
    let first_word_idx := words.indexOf first_word
    (∀ i, i < first_word_idx →
      (words[i]!.data.filter (fun c => is_consonant c)).length ≠ n) ∧
    result.tail! =
      implementation ((words.drop (first_word_idx + 1)).foldl (fun acc word => acc ++ " " ++ word) "") n
  )

-- program termination
∃ result,
  implementation s n = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Nat → List String)
-- inputs
(s: String)
(n: Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ s n, problem_spec impl s n) ↔
(∀ s n, generated_spec impl s n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof


-- start_def implementation_signature
def implementation (s: String) (n: Nat) : List String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation "Mary had a little lamb" 4 = ["little"]
-- #test implementation "Mary had a little lamb" 3 = ["Mary", "lamb"]
-- #test implementation "simple white space" 2 = []
-- #test implementation "Hello world" 4 = ["world"]
-- #test implementation "Uncle sam" 3 = ["Uncle"]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(s: String)
(n: Nat)
: problem_spec implementation s n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
