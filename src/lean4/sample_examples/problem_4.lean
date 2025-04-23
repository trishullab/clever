import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_square(x: int, y: int) -> bool"
docstring: |
    Given two integers x and y, your task is to find if x is a square of y.
    The function should return true if x is a square of y, otherwise false.
test_cases:
  - input:
      -1 1
    expected_output: True
  - input:
      0 0
    expected_output: True
  - input:
      5 2
    expected_output: False
  - input:
      100 10
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → Int → Bool)
-- inputs
(x: Int)
(y: Int) :=
-- spec
let spec (result: Bool) :=
result = true ↔ x = y^2;
-- program terminates
∃ result, impl x y = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int → Bool)
-- inputs
(x: Int)
(y: Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
impl x y = if x = y * y then true else false
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x y, problem_spec impl x y) ↔
(∀ x y, generated_spec impl x y) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
by
intro impl
apply Iff.intro
intro h_prob_spec
intro x y
have h_specialized_spec := h_prob_spec x y
simp [generated_spec]
by_cases h: x = y * y
simp [h]
simp [problem_spec] at h_specialized_spec
rw [h] at h_specialized_spec
simp [h_specialized_spec]
ring
simp [h]
simp [problem_spec] at h_specialized_spec
have h_eq: y ^ 2 = y * y := by ring
rw [h_eq] at h_specialized_spec
simp [h] at h_specialized_spec
simp [h_specialized_spec]
-- Proved the forward direction
-- Now prove the reverse direction
intro h_gen_spec
intro x y
have h_specialized_spec := h_gen_spec x y
simp [problem_spec]
simp [generated_spec] at h_specialized_spec
simp [h_specialized_spec]
have h_eq: y ^ 2 = y * y := by ring
rw [h_eq]
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (x: Int) (y: Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
if x = y * y then
  true
else
  false
-- end_def implementation


-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation (-1) 1 = false
#test implementation 0 0 = true
#test implementation 5 2 = false
#test implementation 100 10 = true
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(x: Int)
(y: Int)
: problem_spec implementation x y:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation x y
use result
simp [result]
simp [implementation]
have h_eq: y ^ 2 = y * y := by ring
rw [h_eq]
-- end_def correctness_proof
