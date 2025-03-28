import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def digits(n: int) -> int"
docstring: |
    Given a positive integer n, return the product of the odd digits.
    Return 0 if all digits are even.
test_examples:
  - input: 1
    expected_output: 1
  - input: 4
    expected_output: 0
  - input: 235
    expected_output: 15
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → Int)
-- inputs
(n: Int) :=
-- spec
let spec (result: Int) :=
  n > 0 →
  let odd_digits := (Nat.digits 10 n.natAbs).filter (fun x => x % 2 == 1)
  if odd_digits = [] then result = 0 else result = odd_digits.prod;
-- program termination
∃ result, impl n = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (n: Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 1 = 1
-- #test implementation 4 = 0
-- #test implementation 235 = 15
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n: Int)
: problem_spec implementation n :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
