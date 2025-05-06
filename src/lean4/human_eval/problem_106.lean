import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def f(n: int) -> List[int]"
docstring: |
    Implement the function f that takes n as a parameter,
    and returns a list of size n, such that the value of the element at index i is the factorial of i if i is even
    or the sum of numbers from 1 to i otherwise.
    i starts from 1.
    the factorial of i is the multiplication of the numbers from 1 to i (1 * 2 * ... * i).
test_cases:
  - input: 5
    expected_output: [1, 2, 6, 24, 15]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → List Int)
-- inputs
(n: Int) :=
-- spec
let spec (result: List Int) :=
  (result.length = n) ∧
  (forall i: Nat, (1 ≤ i ∧ i ≤ n ∧ Even i) → (result[i-1]! = Nat.factorial i)) ∧
  (forall i: Nat, (1 ≤ i ∧ i ≤ n ∧ Odd i) → (result[i-1]! = (List.range (i+1)).sum))
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → List Int)
-- inputs
(n: Int) : Prop :=
--end_def generated_spec
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
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 5 = [1, 2, 6, 24, 15]
-- #test implementation 7 = [1, 2, 6, 24, 15, 720, 28]
-- #test implementation 1 = [1]
-- #test implementation 3 = [1, 2, 6]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n: Int)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
