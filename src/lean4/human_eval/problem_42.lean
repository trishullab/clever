import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def incr_list(numbers: List[Int]) -> List[Int]"
docstring: |
    incr_list takes a list of integers as input and returns a new list
    where each element is incremented by 1.
test_cases:
  - input: []
    expected_output: []
  - input: [1, 3, -2, 1]
    expected_output: [2, 4, -1, 2]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(numbers: List Int) :=
-- spec
let spec (result: List Int) :=
  (result.length = numbers.length) →
  ∀ i, i < numbers.length →
  result[i]! = numbers[i]! + 1
-- -- program termination
∃ result, implementation numbers = result →
spec result
-- -- end_def problem_spec

-- start_def implementation_signature
def implementation (numbers: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- start_def correctness_definition
theorem correctness
(numbers : List Int)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers
use result
simp [result]
sorry
-- end_def correctness_proof
