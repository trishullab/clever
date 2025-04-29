import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def right_angle_triangle(a: Nat, b: Nat, c: Nat) -> Bool"
docstring: |
    Given the lengths of the three sides of a triangle. Return True if the three
    sides form a right-angled triangle, False otherwise.
    A right-angled triangle is a triangle in which one angle is right angle or
    90 degree.
test_cases:
  - input: [3, 4, 5]
    expected_output: True
  - input: [1, 2, 3]
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Nat → Nat → Nat → Bool)
-- inputs
(a b c: Nat) :=
-- spec
let spec (result: Bool) :=
result ↔
  0 < a ∧ 0 < b ∧ 0 < c ∧
  (((a * a + b * b = c * c) ∨
  (a * a + c * c = b * b) ∨
  (b) * b + c * c = a * a))
-- program terminates
∃ result, impl a b c = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat → Nat → Bool)
-- inputs
(a b c: Nat) : Prop :=
-- end_def generated_spec
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
def implementation (a b c: Nat) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([1, 2, 2, -4]: List Int) = (-9: Int)
-- #test implementation ([0, 1]: List Int) = (0: Int)
-- #test implementation ([]: List Int) = none
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(a b c: Nat)
: problem_spec implementation a b c :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
