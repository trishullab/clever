import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def match_parens(l : list[str]) -> str"
docstring: |
    You are given a list of two strings, both strings consist of open
    parentheses '(' or close parentheses ')' only.
    Your job is to check if it is possible to concatenate the two strings in
    some order, that the resulting string will be good.
    A string S is considered to be good if and only if all parentheses in S
    are balanced. For example: the string '(())()' is good, while the string
    '())' is not.
    Return 'Yes' if there's a way to make a good string, and return 'No' otherwise.
test_cases:
  - input: ['()(', ')']
    expected_output: "Yes"
  - input: [')', ')']
    expected_output: "No"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List String → String)
-- inputs
(l: List String) :=
-- spec
let spec (result : String) :=
  l.length = 2 →
  l[0]!.all (fun c => c = '(' ∨ c = ')') →
  l[1]!.all (fun c => c = '(' ∨ c = ')') →
  let res := (balanced_paren_non_computable (l[0]! ++ l[1]!) '(' ')' ∨
            balanced_paren_non_computable (l[1]! ++ l[0]!) '(' ')')
  (res → result = "Yes") ∧
  (¬ res → result = "No")
-- program termination
∃ result,
  implementation l = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List String → String)
-- inputs
(l: List String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ l, problem_spec impl l) ↔
(∀ l, generated_spec impl l) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof


-- start_def implementation_signature
def implementation (l: List String) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation ['()(', ')'] = "Yes"
-- #test implementation [')', ')'] = "No"
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(l: List String)
: problem_spec implementation l
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
