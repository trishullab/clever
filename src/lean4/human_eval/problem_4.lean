import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def mean_absolute_deviation(numbers: List[float]) -> float"
docstring: |
    For a given list of input numbers, calculate Mean Absolute Deviation
    around the mean of this dataset.
    Mean Absolute Deviation is the average absolute difference between each
    element and a centerpoint (mean in this case):
    MAD = average | x - x_mean |
test_cases:
  - input:
      - 1.0
      - 2.0
      - 3.0
      - 4.0
    expected_output: 1.0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Rat → Rat)
-- inputs
(numbers: List Rat) :=
-- spec
let average (nums: List Rat) := nums.sum / nums.length;
let mean := average numbers;
let mad := average (numbers.map (fun x => |x - mean|));
let spec (result: Rat):=
mad = result;
-- program terminates
∃ result, implementation numbers = result →
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (numbers: List Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
let mean := numbers.sum / numbers.length;
let mad := (numbers.map (fun x => |x - mean|)).sum / numbers.length;
mad
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1.0, 2.0, 3.0, 4.0] = 1.0
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Int)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
-- sometimes we have to create a temporary variable to use in the proof
unfold problem_spec
let result := implementation numbers
use result
simp [result]
simp [implementation]
-- end_def correctness_proof
