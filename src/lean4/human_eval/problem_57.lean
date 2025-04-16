import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def monotonic(numbers: List[int]) -> Bool"
docstring: |
    Return True is list elements are monotonically increasing or decreasing.
test_cases:
  - input: [1, 2, 4, 20]
    expected_output: True
  - input: [1, 20, 4, 10]
    expected_output: False
  - input: [4, 1, 0, -10]
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Bool)
-- inputs
(numbers: List Int) :=
let increasing := ∀ i, i < numbers.length - 1 → numbers[i]! ≤ numbers[i + 1]!;
let decreasing := ∀ i, i < numbers.length - 1 → numbers[i + 1]! ≤ numbers[i]!;
-- spec
let spec (result: Bool) :=
  1 < numbers.length →
  result ↔ (increasing ∨ decreasing);
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Bool)
-- inputs
(x : List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x, problem_spec impl x) ↔
(∀ x, generated_spec impl x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1, 2, 3] 4 = [1, 4, 2, 4, 3]
-- #test implementation [] 4 = []
-- #test implementation [1] 4 = [1]
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
sorry
-- end_def correctness_proof
