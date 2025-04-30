import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def triangle_area(a: float, b: float, c: float) -> float"
docstring: |
    Given the lengths of the three sides of a triangle. Return the area of the triangle rounded to 2 decimal points
    if the three sides form a valid triangle. Otherwise return -1. Three sides make a valid triangle when the sum of
    any two sides is greater than the third side.
test_cases:
  - input: (3, 4, 5)
    expected_output: 6
  - input: (1, 2, 10)
    expected_output: -1
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Rat → Rat → Rat → Rat)
-- inputs
(a: Rat) (b: Rat) (c: Rat) :=
-- spec
let spec (result : Rat) :=
  True -- FIX !!
-- program termination
∃ result, implementation a b c = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Rat → Rat → Rat → Rat)
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
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a: Rat) (b: Rat) (c: Rat): Rat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 3 4 5 = 6.00
-- #test implementation 1 2 10 = -1
-- #test implementation 4 8 5 = 8.18
-- #test implementation 2 2 2 = 1.73
-- #test implementation 1 2 3 = -1
-- #test implementation 10 5 7 = 16.25
-- #test implementation 2 6 3 = -1
-- #test implementation 1 1 1 =  0.43
-- #test implementation 2 2 10 = -1
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
