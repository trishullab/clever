import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def maximum(arr: List[int], k: int) -> List[int]"
docstring: Given an array arr of integers and a positive integer k, return a sorted list of length
k with the maximum k numbers in arr.
Note:
    1. The length of the array will be in the range of [1, 1000].
    2. The elements in the array will be in the range of [-1000, 1000].
    3. 0 <= k <= len(arr)
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
(impl: List Int → Int → List Int)
-- function signature
(arr: List Int)
-- inputs
(k: Int) :=
-- spec
let spec (result: List Int) :=
    let preconditions := arr.length ≥ 1 ∧ arr.length ≤ 1000 ∧
        arr.all (fun x => x ≥ -1000 ∧ x ≤ 1000) ∧ k ≥ 0 ∧ k ≤ arr.length;
    let max_k := arr.take k.natAbs;
    preconditions → Multiset.ofList max_k = Multiset.ofList result ∧ result.Sorted (· ≤ ·);
-- program termination
∃ result, impl arr k = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (arr: List Int) (k: Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation


-- start_def test_cases

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
