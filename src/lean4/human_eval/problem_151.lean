import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def double_the_difference(numbers: List[float]) -> Int"
docstring: |
    Given a list of numbers, return the sum of squares of the numbers
    in the list that are odd. Ignore numbers that are negative or not integers.
test_cases:
  - input: [1, 3, 2, 0]
    expected_output: 10
  - input: [-1. -2, 0]
    expected_output: 0
  - input: [9, -2]
    expected_output: 81
  - input: [0]
    expected_output: 0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Rat → Int)
-- inputs
(numbers: List Rat) :=
let isEven (n : Rat) := n % 2 = 0;
let isNegative (n : Rat) := n < 0;
let isNotInteger (n : Rat) := ¬ n.isInt;
-- spec
let spec (result: Int) :=
0 < numbers.length →
0 ≤ result ∧
if numbers.length = 1
then result = if (isEven numbers[0]! ∨ isNegative numbers[0]! ∨ isNotInteger numbers[0]!) then (0 : Int) else numbers[0]!.floor ^ 2
else result = if (isEven numbers[0]! ∨ isNegative numbers[0]! ∨ isNotInteger numbers[0]!) then (0 : Int) else numbers[0]!.floor ^ 2 + impl numbers.tail
-- program terminates
∃ result, impl numbers = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Rat → Int)
-- inputs
(numbers: List Rat) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ numbers, problem_spec impl numbers) ↔
(∀ numbers, generated_spec impl numbers) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Rat) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([1, 3, 2, 0]: List Rat) = (10: Int)
-- #test implementation ([-1, -2, 0]: List Int) = (0: Int)
-- #test implementation ([9, -2]: List Int) = 81
-- #test implementation ([0]: List Int) = 0
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(numbers: List Rat)
: problem_spec implementation numbers :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
