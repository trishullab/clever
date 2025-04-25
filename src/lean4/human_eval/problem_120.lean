import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def maximum(arr: List[int], k: int) -> List[int]"
docstring: |
    Given an array arr of integers and a positive integer k, return a sorted list of length
    k with the maximum k numbers in arr.
    Note:
        1. The length of the array will be in the range of [1, 1000].
        2. The elements in the array will be in the range of [-1000, 1000].
        3. 0 <= k <= len(arr)
test_cases:
  - input: [[2, 4, 3, 1], 3]
    expected_output: [2, 3, 4]
  - input: [[2, 4, 3, 1], 0]
    expected_output: []

-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int → List Int)
-- inputs
(arr: List Int)
(k: Int) :=
-- spec
let spec (result: List Int) :=
    1 ≤ arr.length → arr.length ≤ 1000 → arr.all (fun x => -1000 ≤ x ∧ x ≤ 1000) → 0 ≤ k → k ≤ arr.length →
    result.length = k ∧
    result.Sorted (· ≤ ·) ∧
    ∀ x ∈ result, x ∈ arr ∧

    let result_reversed := result.reverse; -- reverse to get last element
    match result_reversed with
    | [] => k = 0
    | max :: remaining_reversed =>
      arr.max? = some max ∧
      impl (arr.erase max) (k-1) = (remaining_reversed.reverse)
-- program terminates
∃ result, impl arr k = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int → List Int)
-- inputs
(arr: List Int)
(k: Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ arr k, problem_spec impl arr k) ↔
(∀ arr k, generated_spec impl arr k) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (arr: List Int) (k: Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation [2, 4, 3, 1] 3 = [2, 3, 4]
-- #test implementation [2, 4, 3, 1] 0 = []
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(arr: List Int)
(k: Int)
: problem_spec implementation arr k  :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
