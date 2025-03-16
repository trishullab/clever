import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sum_product(numbers: List[int]) -> Tuple[int, int]"
docstring: |
    For a given list of integers, return a tuple consisting of a sum and a product of all the integers in a list.
    Empty sum should be equal to 0 and empty product should be equal to 1.
test_cases:
  - input: []
    expected_output: (0, 1)
  - input: [1, 2, 3, 4]
    expected_output: (10, 24)
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → (Int × Int))
-- inputs
(numbers: List Int) :=
-- spec
let spec (result: (Int × Int)) :=
result = (numbers.sum, numbers.prod);
-- program termination
∃ result, implementation numbers = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (numbers: List Int) : (Int × Int) :=
-- end_def implementation_signature
-- start_def implementation
(numbers.sum, numbers.prod)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [] = (0, 1)
#test implementation [1, 2, 3, 4] = (10, 24)
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Int)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers
use result
simp [result]
simp [implementation]
-- end_def correctness_proof
