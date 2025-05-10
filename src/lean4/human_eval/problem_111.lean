import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def histogram(s : str) -> Dict[str, int]"
docstring: |
    Given a string representing a space separated lowercase letters, return a dictionary
    of the letter with the most repetition and containing the corresponding count.
    If several letters have the same occurrence, return all of them.
    -- Note(George): I believe the equality extensionality for HashMaps makes this spec true.
test_cases:
  - input: 'a b c'
    expected_output: {'a': 1, 'b': 1, 'c': 1}
  - input: 'a b b a'
    expected_output: {'a': 2, 'b': 2}
  - input: 'a b c a b'
    expected_output: {'a': 2, 'b': 2}
  - input: 'b b b b a'
    expected_output: {'b': 4}
  - input: ''
    expected_output: {}
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Std.HashMap Char Nat)
-- inputs
(s: String) :=
-- spec
let spec (result : Std.HashMap Char Nat) :=
    let chars := s.splitOn " "
    chars.all (fun c => c.length = 1) ∧ s.all (fun c => c.isLower ∨ c = ' ') →
    ∀ key ∈ result.keys,
      (key.isLower ∧
      key ∈ s.data ∧
      result.get! key = s.count key) ∧
    (∀ char ∈ s.data, char.isLower →
      ((∃ char2 ∈ s.data, char2.isLower ∧ char2 ≠ char ∧
      s.count char < s.count char2) ↔ char ∉ result.keys))
-- program termination
∃ result,
  implementation s = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Std.HashMap Char Nat)
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
def implementation (s: String) : Std.HashMap Char Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation 'a b c' = {'a': 1, 'b': 1, 'c': 1}
-- #test implementation 'a b b a' = {'a': 2, 'b': 2}
-- #test implementation 'a b c a b' = {'a': 2, 'b': 2}
-- #test implementation 'b b b b a' = {'b': 4}
-- #test implementation '' = {}
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
