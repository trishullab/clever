import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def derivative(xs: List Int) -> List Int"
docstring: |
    xs represent coefficients of a polynomial.
    xs[0] + xs[1] * x + xs[2] * x^2 + ....
     Return derivative of this polynomial in the same form.
test_cases:
  - input: [3, 1, 2, 4, 5]
    expected_output: [1, 4, 12, 20]
  - input: [1, 2, 3]
    expected_output: [2, 6]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → List Int)
-- inputs
(xs: List Int) :=
-- spec
let spec (result: List Int) :=
  result.length = xs.length - 1 ∧
  (∃ div_array: List Int, div_array.length = xs.length ∧
  div_array[0]! = 0 ∧
  ∀ i, i < xs.length ∧ 0 < i → div_array[i]! = xs[i]! / result[i - 1]! ∧
  div_array = List.range (xs.length));
-- program terminates
∃ result, impl xs = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → List Int)
-- inputs
(x : List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x, problem_spec impl x) ↔
(∀ x, generated_spec impl x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (xs: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [3, 1, 2, 4, 5] : List Int = [1, 4, 12, 20]
-- #test implementation [1, 2, 3] : List Int = [2, 6]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(xs: List Int)
: problem_spec implementation xs :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation xs
use result
simp [result]
sorry
-- end_def correctness_proof
