import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def by_length(arr: List[int]) -> List[string]"
docstring: |
    Given an array of integers, sort the integers that are between 1 and 9 inclusive,
    reverse the resulting array, and then replace each digit by its corresponding name from
    "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine".
test_cases:
  - input: [2, 1, 1, 4, 5, 8, 2, 3]
    expected_output: ["Eight", "Five", "Four", "Three", "Two", "Two", "One", "One"]
  - input: []
    expected_output: []
  - input: [1, -1 , 55]
    expected_output: ['One']
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List String)
-- inputs
(arr: List Int) :=
-- spec
let spec (result: List String) :=
  let digits: List String := ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"];
  (forall s: String, (s ∈ result → s ∈ digits)) ∧
  (arr.length ≥ result.length) ∧
  (forall x: Nat, ((x: Int) ∈ arr ∧ 1 ≤ x ∧ x ≤ 9) → (digits[x-1]! ∈ result)) ∧
  (List.Sorted Int.le (List.map (fun (s: String) => (List.indexOf s digits) + 1) result).reverse)
-- program termination
∃ result, implementation arr = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → List String)
-- inputs
(arr: List Int) : Prop :=
--end_def generated_spec
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
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (arr: List Int) : List String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [2, 1, 1, 4, 5, 8, 2, 3] = ["Eight", "Five", "Four", "Three", "Two", "Two", "One", "One"]
-- #test implementation [] = []
-- #test implementation [1, -1 , 55] = ["One"]
-- #test implementation [1, -1, 3, 2] = ["Three", "Two", "One"]
-- #test implementation [9, 4, 8] = ["Nine", "Eight", "Four"]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(arr: List Int)
: problem_spec implementation arr
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
