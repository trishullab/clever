import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def int_to_mini_roman(num: Nat) -> String"
docstring: |
    Given a positive integer, obtain its roman numeral equivalent as a string,
    and return it in lowercase.
    Restrictions: 1 <= num <= 1000
test_cases:
  - input: 19
    expected_output: xix
  - input: 152
    expected_output: clii
  - input: 426
    expected_output: cdxxvi
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Nat → String)
-- inputs
(num: Nat) :=
-- spec
let spec (result: String) :=
1 ≤ num ∧ num ≤ 1000 →
roman_value_non_computable result num
-- program terminates
∃ result, impl num = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → String)
-- inputs
(num: Nat) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ num, problem_spec impl num) ↔
(∀ num, generated_spec impl num) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (num: Nat) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 19 = "xix"
-- #test implementation 152 = "clii"
-- #test implementation 426 = "cdxxvi"
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(num: Nat)
: problem_spec implementation num :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
