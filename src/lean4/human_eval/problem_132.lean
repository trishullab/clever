import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_nested(string: str) -> Bool"
docstring: |
    Create a function that takes a string as input which contains only parentheses.
    The function should return True if and only if there is a valid subsequence of parentheses
    where at least one parenthesis in the subsequence is nested.
test_cases:
  - input: '(())'
    expected_output: True
  - input: '()))))))((((()'
    expected_output: False
  - input: '()()'
    expected_output: False
  - input: '()'
    expected_output: False
  - input: '(()())'
    expected_output: True
  - input: '(())(('
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → Bool)
-- inputs
(string: String) :=
-- spec
let spec (result: Bool) :=
string.toList.all (fun x => x = '(' ∨ x = ')') →
result = true ↔
  ∃ x : String,
    is_subsequence x.toList string.toList ∧
    balanced_paren_non_computable x ∧
    2 ≤ count_max_paren_depth x
-- program termination
∃ result, impl string = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Bool)
-- inputs
(lst: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ string, problem_spec impl string) ↔
(∀ string, generated_spec impl string) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (lst: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation
-- start_def test_cases
-- #test implementation "(())" = true
-- #test implementation "()))))))((((()" = false
-- #test implementation "()()" = false
-- #test implementation "()" = false
-- #test implementation "(()())" = true
-- #test implementation "(())((" = true
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(string: String)
: problem_spec implementation string :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
