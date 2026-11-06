import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_bored(s: str) -> int"
docstring: |
    You'll be given a string of words, and your task is to count the number
    of boredoms. A boredom is a sentence that starts with the word "I".
    Sentences are delimited by '.', '?' or '!'.
test_cases:
  - input: "Hello world"
    expected_output: 0
  - input: "The sky is blue. The sun is shining. I love this weather"
    expected_output: 1
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Nat)
-- inputs
(s: String) :=
-- spec
let chars := string.toList
let isDelim (c : Char) : Prop := c = '.' ∨ c = '?' ∨ c = '!'
-- position i is the start of a sentence consisting of the word "I"
let startsBoredom (i : Nat) : Prop :=
  i < chars.length ∧
  chars[i]! = 'I' ∧
  (∀ j, j < i → ¬ (chars[j]!).isWhitespace →
      ∃ k, j ≤ k ∧ k < i ∧ isDelim chars[k]!) ∧
  (i + 1 = chars.length ∨ (chars[i+1]!).isWhitespace ∨ isDelim chars[i+1]!)
let spec (result : Nat) :=
  ∃ boredomStarts : Finset Nat,
    (∀ i, i ∈ boredomStarts ↔ startsBoredom i) ∧
    result = boredomStarts.card
-- program termination
∃ result, implementation string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Nat)
-- inputs
(s: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ s, problem_spec impl s) ↔
(∀ s, generated_spec impl s) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (s: String) : Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation "Hello world" = 0
-- #test implementation "The sky is blue. The sun is shining. I love this weather" = 1
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(s: String)
: problem_spec implementation s
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
