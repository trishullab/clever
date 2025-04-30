import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def triangle_area(a: float, h: float) -> float"
docstring: |
    Given length of a side and high return area for a triangle.
test_cases:
  - input: (5, 3)
    expected_output: 7.5
  - input: (8, 2)
    expected_output: 8.0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Rat → Rat -> Rat)
-- inputs
(a h: Rat) :=
-- spec
let spec (result: Rat) :=
  a = 0 → result = 0 ∧
  (a ≠ 0 → (2 * result) / a = h);
-- -- program termination
∃ result, implementation a h = result ∧
spec result
-- -- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Rat → Rat → Rat)
-- inputs
(a h: Rat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x y, problem_spec impl x y) ↔
(∀ x y, generated_spec impl x y) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a h: Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
  0.5 * a * h
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 5 3 = 7.5
-- #test implementation 8 2 = 8.0
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(a h : Rat)
: problem_spec implementation a h
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation a h
use result
simp [result]
sorry
-- end_def correctness_proof
