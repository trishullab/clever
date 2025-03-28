import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def can_arrange(arr: List[int]) -> int"
docstring: |
    Create a function which returns the largest index of an element which
    is not greater than or equal to the element immediately preceding it. If
    no such element exists then return -1. The given array will not contain
    duplicate values.
test_examples:
  - input: [1, 2, 4, 3, 5]
    expected_output: 3
  - input: [1, 2, 3]
    expected_output: -1
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int)
-- inputs
(arr: List Int) :=
-- spec
let spec (result: Int) :=
  let ms := Multiset.ofList arr;
  let precondition := arr.any (fun x => ms.count x > 1);
  precondition → if result = -1 then arr.Sorted (· ≤ ·) else
    arr[result.natAbs]! < arr[result.natAbs-1]! ∧ ¬(∃ (i: Nat), i > result ∧ i < arr.length ∧ arr[i]! < arr[i-1]!);
-- program termination
∃ result, impl arr = result →
spec result
-- end_def problem_spec


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
