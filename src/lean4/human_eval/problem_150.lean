import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def x_or_y(int n, int x, int y) -> int"
docstring: |
    A simple program which should return the value of x if n is
    a prime number and should return the value of y otherwise.
test_cases:
  - input: [7, 34, 12]
    expected_output: 34
  - input: [15, 8, 5]
    expected_output: 5
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → Int → Int → Int)
-- inputs
(n x y: Int) :=
-- spec
let spec (result: Int) :=
(result = x ↔ Nat.Prime n.toNat) ∧
(result = y ↔ (¬ Nat.Prime n.toNat ∨ n ≤ 1))
-- program terminates
∃ result, impl n x y = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int → Int → Int)
-- inputs
(n x y: Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ n x y, problem_spec impl n x y) ↔
(∀ n x y, generated_spec impl n x y) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n x y: Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 7 34 12 = 34
-- #test implementation 15 8 5 = 5
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n x y: Int)
: problem_spec implementation n x y :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
