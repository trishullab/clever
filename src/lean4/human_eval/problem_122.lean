import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def add_elements(arr: List[int], k: int) -> int"
docstring: |
    Given a non-empty array of integers arr and an integer k, return
    the sum of the elements with at most two digits from the first k elements of arr.

    Constraints:
        1. 1 <= len(arr) <= 100
        2. 1 <= k <= len(arr)
test_cases:
  - input: [[111, 21, 3, 4000, 5, 6, 7, 8, 9], 4]
    expected_output: 24
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Nat → Int)
-- inputs
(arr: List Int)
(k: Nat) :=
-- spec
let spec (result: Int) :=
  1 ≤ arr.length → arr.length ≤ 100 → 1 ≤ k → k ≤ arr.length →
  ((∀ i, 0 ≤ i ∧ i < k → ¬(arr[i]! ≤ 99 ∧ -99 ≤ arr[i]!)) → result = 0) ∧
  ∃ i, i < k
    ∧ arr[i]! ≤ 99 ∧ -99 ≤ arr[i]!
    ∧ result = arr[i]! + (if i = 0 then 0 else impl arr i)
    ∧ ∀ i', i < i' ∧ i' < k → ¬(arr[i']! ≤ 99 ∧ -99 ≤ arr[i']!)
-- program termination
∃ result, impl arr k = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Nat → Int)
-- inputs
(arr: List Int)
(k: Nat) : Prop :=
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
def implementation (arr: List Int) (k: Nat) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([111, 21, 3, 4000, 5, 6, 7, 8, 9]: List Int) 4 = 24
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(arr: List Int)
(k: Nat)
: problem_spec implementation arr k :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
