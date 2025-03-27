import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def intersperse(numbers: List[int], delimeter: int) -> List[int]"
docstring: |
    Insert a number 'delimeter' between every two consecutive elements of input list `numbers'
test_cases:
  - input:
      - []
      - 4
    expected_output: []
  - input:
      - [1, 2, 3]
      - 4
    expected_output: [1, 4, 2, 4, 3]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Int → List Int)
-- inputs
(numbers: List Int)
(delimeter: Int) :=
-- spec
let spec (result: List Int) :=
(result.length = 0 ∧ result = numbers) ∨
(result.length = 2 * numbers.length - 1 ∧
∀ i, i < numbers.length →
result[2 * i]! = numbers[i]! ∧
(2*i - 1 > 0 → result[2 * i - 1]! = delimeter));
-- program termination
∃ result, implementation numbers delimeter = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (numbers: List Int) (delimeter: Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
numbers.intersperse delimeter
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2, 3] 4 = [1, 4, 2, 4, 3]
#test implementation [] 4 = []
#test implementation [1] 4 = [1]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Int)
(delimeter: Int)
: problem_spec implementation numbers delimeter
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers delimeter
use result
simp [result]
sorry
-- end_def correctness_proof
