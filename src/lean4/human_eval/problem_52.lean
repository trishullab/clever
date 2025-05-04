import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def below_threshold(numbers: List[Int], threshold: Int) -> bool"
docstring: Return True if all numbers in the list l are below threshold t, and False otherwise.
test_cases:
  - input: [[1, 2, 4, 10], 100]
    expected_output: True
  - input: [[1, 20, 4, 10], 5]
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List Int → Int → Bool)
-- inputs
(numbers: List Int)
(threshold: Int) :=
-- spec
let numbers_below_threshold :=
  ∀ i, i < numbers.length → numbers[i]! < threshold;
let spec (res: Bool) :=
(numbers.length = 0 → res) ∧
(res ↔ numbers_below_threshold)
-- program terminates
∃ result, impl numbers threshold = result ∧
-- return value satisfies spec
spec result
-- if result then spec else ¬spec
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int → Bool)
-- inputs
(numbers : List Int)
(threshold : Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ numbers threshold, problem_spec impl numbers threshold) ↔
(∀ numbers threshold, generated_spec impl numbers threshold) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Int) (threshold: Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ([1, 2, 4, 10]: List Int) 100 = true
-- #test implementation ([1, 20, 4, 10]: List Int) 5 = false
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(numbers: List Int)
(threshold: Int)
: problem_spec implementation numbers threshold  :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers threshold
use result
simp [result]
sorry
-- end_def correctness_proof
