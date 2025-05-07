import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def can_arrange(arr: List[int]) -> int"
docstring: |
    Create a function which returns the largest index of an element which
    is not greater than or equal to the element immediately preceding it. If
    no such element exists then return -1. The given array will not contain
    duplicate values.
test_cases:
  - input: [1, 2, 4, 3, 5]
    expected_output: 3
  - input: [1, 2, 3]
    expected_output: -1
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int)
-- inputs
(arr: List Int) :=
-- spec
let spec (result: Int) :=
  ¬arr.any (fun x => 1 < arr.count x) →
  (arr.length = 0 ∨ arr.length = 1 → result = -1) ∧
  (1 < arr.length →
    let last := arr.length-1;
    let i := if arr[last]! < arr[last-1]! then Int.ofNat last else -1;
    result = max (impl (arr.take last)) i);
-- program termination
∃ result, impl arr = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int)
-- inputs
(arr: List Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ arr, problem_spec impl arr) ↔
(∀ arr, generated_spec impl arr) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (arr: List Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [1, 2, 4, 3, 5] = 3
-- #test implementation [1, 2, 3] = -1
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(arr: List Int)
: problem_spec implementation arr :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
