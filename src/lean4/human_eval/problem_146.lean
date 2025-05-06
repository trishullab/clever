import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def specialFilter(nums: List[int]) -> int"
docstring: |
    Write a function that takes an array of numbers as input and returns
    the number of elements in the array that are greater than 10 and both
    first and last digits of a number are odd (1, 3, 5, 7, 9).
test_cases:
  - input: [15, -73, 14, -15]
    expected_output: 1
  - input: [33, -2, -3, 45, 21, 109]
    expected_output: 2
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int)
-- inputs
(nums: List Int) :=
-- spec
let spec (result: Int) :=
match nums with
| [] => result = 0
| head::tail =>
  let first_digit := (toString head.natAbs).toList[0]!.toNat - Char.toNat '0';
  let last_digit := head % 10;
  let valid := head > 10 ∧ Odd first_digit ∧ Odd last_digit
  if valid then result = 1 + impl tail else result = impl tail
-- program termination
∃ result, impl nums = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int)
-- inputs
(nums: List Int) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ nums, problem_spec impl nums) ↔
(∀ nums, generated_spec impl nums) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (nums: List Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [15, -73, 14, -15] = 1
-- #test implementation [33, -2, -3, 45, 21, 109] = 2
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(nums: List Int)
: problem_spec implementation nums :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
