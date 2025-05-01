import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_equal_to_sum_even(n: int) -> Bool"
docstring: |
    Evaluate whether the given number n can be written as the sum of exactly 4 positive even numbers
test_cases:
  - input: 4
    expected_output: False
  - input: 6
    expected_output: False
  - input: 8
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → Bool)
-- inputs
(n: Int) :=
-- spec
let spec (result: Bool) :=
  let sum_exists := ∃ a b c d : Nat,
    Even a ∧
    Even b ∧
    Even c ∧
    Even d ∧
    (a + b + c + d = n);
  result = true ↔ sum_exists
-- program termination
∃ result, impl n = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Bool)
-- inputs
(n: Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ n, problem_spec impl n) ↔
(∀ n, generated_spec impl n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 4 = false
-- #test implementation 6 = false
-- #test implementation 8 = true
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n: Int)
: problem_spec implementation n :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
