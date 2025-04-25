import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def common(l1: List[Int], l2: List[Int]) -> List[Int]"
docstring: |
    Return sorted unique common elements for two lists.
test_cases:
  - input: [[1, 4, 3, 34, 653, 2, 5], [5, 7, 1, 5, 9, 653, 121]]
    expected_output: [1, 5, 653]
  - input: [[5, 3, 2, 8], [3, 2]]
    expected_output: [2, 3]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List Int → List Int)
-- inputs
(l1 l2: List Int) :=
let is_unique (result: List Int) :=
  ∀ i j, i < result.length → j < result.length →
  i ≠ j → result[i]! ≠ result[j]!;
let is_sorted (result: List Int) :=
  ∀ i, i < result.length - 1 →
  result[i]! ≤ result[i + 1]!;
-- spec
let spec (result: List Int) :=
  is_unique result ∧
  is_sorted result ∧
  (∀ i : Int, i ∈ result ↔ i ∈ l1 ∧ i ∈ l2)
-- program termination
∃ result, implementation l1 l2 = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → List Int → List Int)
-- inputs
(x y: List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x y, problem_spec impl x y) ↔
(∀ x y, generated_spec impl x y) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (l1 l2: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1, 4, 3, 34, 653, 2, 5] [5, 7, 1, 5, 9, 653, 121] = [1, 5, 653]
-- #test implementation [5, 3, 2, 8] [3, 2] = [2, 3]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(l1 l2: List Int)
: problem_spec implementation l1 l2
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation l1 l2
use result
simp [result]
sorry
-- end_def correctness_proof
