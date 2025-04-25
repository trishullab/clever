import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def fix_spaces(text: String) -> String"
docstring: |
    Given a string text, replace all spaces in it with underscores,
    and if a string has more than 2 consecutive spaces,
    then replace all consecutive spaces with -
test_cases:
  - input: "Example"
    expected_output: "Example"
  - input: "Example 1"
    expected_output: "Example_1"
  - input: " Example 2"
    expected_output: "_Example_2"
  - input: " Example   3"
    expected_output: "_Example-3"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → String)
-- inputs
(text: String) :=
-- spec
let spec (result: String) :=
  (result = "" → text = "") ∧
  (result ≠ "" → (
    (∃ pref s, text = pref ++ s
      ∧ pref.length = 1
      ∧ pref ≠ " "
      ∧ result = pref ++ impl s)
    ∨
    (∃ pref s : String, text = pref ++ s ∧ pref ≠ "" ∧ (∀ ch, ch ∈ pref.toList → ch = ' ')
      ∧ let k := pref.length;
        (k ≤ 2 → result = (String.replicate k '_') ++ (impl (text.drop k)))
      ∧ (2 < k → result = "-" ++ (impl (text.drop k)))) )
  )
-- program termination
∃ result, impl text = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String)
-- inputs
(text: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ text, problem_spec impl text) ↔
(∀ text, generated_spec impl text) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (text: String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "Example" = "Example"
-- #test implementation "Example 1" = "Example_1"
-- #test implementation " Example 2" = "_Example_2"
-- #test implementation " Example   3" = "_Example-3"
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(text: String)
: problem_spec implementation text :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
