import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def truncate_number(number: float) -> float"
docstring: |
    Given a positive floating point number, it can be decomposed into
    and integer part (largest integer smaller than given number) and decimals
    (leftover part always smaller than 1).
test_cases:
  - input: 3.5
    expected_output: 0.5
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Rat → Rat)
-- inputs
(number: Rat) :=
-- spec
let spec (res):=
res = number - number.floor;
-- program terminates
∃ result, impl number = result →
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (number: Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
number - number.floor
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 3.5 = 0.5
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(number: Rat)
: problem_spec implementation number :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation number
use result
simp [result]
simp [implementation]
-- end_def correctness_proof
