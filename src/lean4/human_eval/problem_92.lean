import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def any_int(a: rat, b: rat, c: rat) -> bool"
docstring: |
    Create a function that takes 3 numbers.
    Returns true if one of the numbers is equal to the sum of the other two, and all numbers are integers.
    Returns false in any other cases.
test_cases:
  - input: [5, 2, 7]
    expected_output: true
  - input: [3, 2, 2]
    expected_output: false
  - input: [3, -2, 1]
    expected_output: true
  - input: [3.6, -2.2, 2]
    expected_output: false
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Rat → Rat → Rat → Bool)
-- inputs
(a: Rat) (b: Rat) (c: Rat) :=
-- spec
let spec (result : Bool) :=
  result = (a + b = c) ∨ (a + c = b) ∨ (b + c = a) ∧ a.den = 1 ∧ b.den = 1 ∧ c.den = 1
-- program termination
∃ result,
  implementation a b c = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Rat → Rat → Rat → Bool)
-- inputs
(a: Rat) (b: Rat) (c: Rat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ a b c, problem_spec impl a b c) ↔
(∀ a b c, generated_spec impl a b c) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a: Rat) (b: Rat) (c: Rat) : Bool := sorry
-- end_def implementation_signature

-- start_def implementation
-- end_def implementation

-- start_def test_cases
-- #test implementation 5 2 7 = true
-- #test implementation 3 2 2 = false
-- #test implementation 3 (-2) 1 = true
-- #test implementation 3.6 (-2.2) 2 = false
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(a: Rat) (b: Rat) (c: Rat)
: problem_spec implementation a b c
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
