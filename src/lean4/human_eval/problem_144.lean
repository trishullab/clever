import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def simplify(x: str, n: str) -> Bool"
docstring: |
    Your task is to implement a function that will simplify the expression
    x * n. The function returns True if x * n evaluates to a whole number and False
    otherwise. Both x and n, are string representation of a fraction, and have the following format,
    <numerator>/<denominator> where both numerator and denominator are positive whole numbers.

    You can assume that x, and n are valid fractions, and do not have zero as denominator.
test_cases:
  - input: ["1/5", "5/1"]
    expected_output: True
  - input: ["1/6", "2/1"]
    expected_output: False
  - input: ["7/10", "10/2"]
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → String → Bool)
-- inputs
(x: String) (n: String) :=
-- spec
let spec (result: Bool) :=
let fx := x.splitOn "/";
let fn := n.splitOn "/";
fx.length = 2 → fn.length = 2 →
fx.all String.isNat → fn.all String.isNat →
let p1 := fx[0]!.toNat!;
let q1 := fx[1]!.toNat!;
let p2 := fn[0]!.toNat!;
let q2 := fn[1]!.toNat!;
q1 ≠ 0 → q2 ≠ 0 →
(result ↔ (∃ k, k * p1 * p2 = q1 * q2))
-- program termination
∃ result, impl x n = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String → Bool)
-- inputs
(x: String) (n: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x n, problem_spec impl x n) ↔
(∀ x n, generated_spec impl x n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (x: String) (n: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "1/5" "5/1" = True
-- #test implementation "1/6" "2/1" = False
-- #test implementation "7/10" "10/2" = False
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(x: String) (n: String)
: problem_spec implementation x n :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
