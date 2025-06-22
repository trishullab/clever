import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def count_upper(s : String) -> Int"
docstring: |
    Given a string s, count the number of uppercase vowels in even indices.
    -- Note(): I also feel like this one is hard to not leak, I tried a trick about keeping implementation for a recursive call in the spec. Let me know if this doesn't work..
test_cases:
  - input: "aBCdEf"
    expected_output: 1
  - input: "abcdefg"
    expected_output: 0
  - input: "dBBE"
    expected_output: 0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Int)
-- inputs
(s: String) :=
-- spec
let uppercase_vowels := ['A', 'E', 'I', 'O', 'U']
let spec (result : Int) :=
  let chars := s.toList
  (result = 0 ↔ ∀ i, i < chars.length → chars[i]! ∉ uppercase_vowels) ∧
  (1 < chars.length →
    (result - 1 = implementation (chars.drop 2).toString ↔ chars[0]! ∈ uppercase_vowels) ∨
    (result = implementation (chars.drop 2).toString ↔ chars[0]! ∉ uppercase_vowels)
  )
-- program termination
∃ result,
  implementation s = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Int)
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
def implementation (s: String) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation "aBCdEf" = 1
-- #test implementation "abcdefg" = 0
-- #test implementation "dBBE" = 0
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
