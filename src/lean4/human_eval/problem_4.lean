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
let spec (result: Rat):=
0 < numbers.length →
0 ≤ result ∧
result * numbers.length * numbers.length =
(numbers.map (fun x => |x * numbers.length - numbers.sum|)).sum;
-- program terminates
∃ result, implementation numbers = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List Rat → Rat)
-- inputs
(numbers: List Rat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ numbers, problem_spec implementation numbers) ↔
(∀ numbers, generated_spec implementation numbers) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
if numbers.length = 0 then 1.0
else
  let mean := numbers.sum / numbers.length;
  let abs_diffs := numbers.map (fun x => |x - mean|);
  abs_diffs.sum / abs_diffs.length
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1.0, 2.0, 3.0, 4.0] = 1.0
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Rat)
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
by_cases (numbers.length = 0)
rename_i h
simp [h]
rename_i h
simp at h
have h1: 0 < numbers.length := by
  by_contra
  rename_i h2
  simp at h2
  contradiction
simp [h1]
simp [h]
sorry
-- end_def correctness_proof
