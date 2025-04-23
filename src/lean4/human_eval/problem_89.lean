import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def encrypt(str : str) -> str"
docstring: |
    Create a function encrypt that takes a string as an argument and
    returns a string encrypted with the alphabet being rotated.
    The alphabet should be rotated in a manner such that the letters
    shift down by two multiplied to two places.
test_cases:
  - input: "hi"
    output: "lm"
  - input: "asdfghjkl"
    output: "ewhjklnop"
  - input: "gf"
    output: "kj"
  - input: "et"
    output: "ix"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → String)
-- inputs
(str: String) :=
-- spec
let spec (result : String) :=
  result.data.all (fun c => c.isLower) →
  result.length = str.length ∧
  (∀ i, i < str.length →
    let c := str.data[i]!
    let c' := result.data[i]!
    ((c'.toNat - 97) + 2 * 2) % 26 = (c.toNat - 97))
-- program termination
∃ result,
  implementation str = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String)
-- inputs
(str: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ str, problem_spec impl str) ↔
(∀ str, generated_spec impl str) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (str: String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation "hi" = "lm"
-- #test implementation "asdfghjkl" = "ewhjklnop"
-- #test implementation "gf" = "kj"
-- #test implementation "et" = "ix"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(str: String)
: problem_spec implementation str
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
