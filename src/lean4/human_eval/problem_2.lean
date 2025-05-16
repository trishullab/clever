import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def truncate_number(number: float) -> float"
docstring: |
    Given a positive floating point number, it can be decomposed into
    and integer part (largest integer smaller than given number) and decimals
    (leftover part always smaller than 1).

    Return the decimal part of the number.
test_cases:
  - input: 3.5
    expected_output: 0.5
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Rat → Rat)
-- inputs
(number: Rat) :=
-- spec
let spec (res) :=
0 ≤ res ∧
res < 1 ∧
number.floor + res = number;
number > 0 →
-- program terminates
(∃ result, impl number = result ∧
-- return value satisfies spec
spec result)
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Rat → Rat)
-- inputs
(number: Rat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
-- end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ number, problem_spec impl number) ↔
(∀ number, generated_spec impl number) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (number: Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
number - number.floor
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 3.5 = 0.5
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(number: Rat)
: problem_spec implementation number :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation number
simp [result]
simp [implementation]
have h1: ∀ x: Rat, x.floor ≤ x := by
  intro x
  rw [←Rat.le_floor]
intro npos
apply And.intro
apply h1
have h2 := h1 number
sorry
-- end_def correctness_proof
