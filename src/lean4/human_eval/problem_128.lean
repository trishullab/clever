import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def prod_signs(arr: List[int]) -> Optional[int]"
docstring: |
    You are given an array arr of integers and you need to return
    sum of magnitudes of integers multiplied by product of all signs
    of each number in the array, represented by 1, -1 or 0.
    Note: return None for empty arr.
test_cases:
  - input: [1, 2, 2, -4]
    expected_output: -9
  - input: [0, 1]
    expected_output: 0
  - input: []
    expected_output: None
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Option Int)
-- inputs
(arr: List Int) :=
-- spec
let magnitude_sum := (arr.map (fun x => Int.ofNat x.natAbs)).sum;
let sign_product := (arr.map (fun x => if x > 0 then 1 else if x < 0 then -1 else 0)).prod;
let spec (result: Option Int) :=
  arr = [] → result = none ∧
  arr ≠ [] → match result with
             | some result => magnitude_sum * sign_product = result
             | none => false
-- program termination
∃ result, impl arr = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (arr: List Int) : Option Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([1, 2, 2, -4]: List Int) = (-9: Int)
-- #test implementation ([0, 1]: List Int) = (0: Int)
-- #test implementation ([]: List Int) = none
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(arr: List Int)
: problem_spec implementation arr :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
