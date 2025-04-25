import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def tri(n: int) -> List[int]"
docstring: |
    Everyone knows Fibonacci sequence, it was studied deeply by mathematicians in
    the last couple centuries. However, what people don't know is Tribonacci sequence.
    Tribonacci sequence is defined by the recurrence:
    tri(1) = 3
    tri(n) = 1 + n / 2, if n is even.
    tri(n) =  tri(n - 1) + tri(n - 2) + tri(n + 1), if n is odd.
    For example:
    tri(2) = 1 + (2 / 2) = 2
    tri(4) = 3
    tri(3) = tri(2) + tri(1) + tri(4)
           = 2 + 3 + 3 = 8
    You are given a non-negative integer number n, you have to a return a list of the
    first n + 1 numbers of the Tribonacci sequence.
test_cases:
  - input: 3
    expected_output: [1, 3, 2, 8]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → List Int)
-- inputs
(n: Int) :=
-- spec
let spec (result: List Int) :=
  n ≥ 0 →
  0 < result.length ∧
  let i := result.length-1;
  (i = 0 → result[0]! = 1) ∧ -- base case
  (i = 1 → result[1]! = 3) ∧
  (2 ≤ i ∧ i % 2 = 0 → result[i]! = 1 + i / 2) ∧
  (2 ≤ i ∧ i % 2 = 1 → result[i]! = result[i-2]! + result[i-1]! + (1 + (i+1) / 2)) ∧
  if i = 0 then true else result.take i = impl (i-1)
-- program termination
∃ result, impl n = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → List Int)
-- inputs
(n: Int) : Prop :=
-- end_def generated_spec
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
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Int) : List Int:=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 3 = [1, 3, 2, 8]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n: Int)
: problem_spec implementation n :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
