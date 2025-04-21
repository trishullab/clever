import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sum_product(numbers: List[int]) -> Tuple[int, int]"
docstring: |
  From a given list of integers, generate a list of rolling maximum element found until given moment
  in the sequence.
test_cases:
  - input: [1, 2, 3, 2, 3, 4, 2]
    expected_output: [1, 2, 3, 3, 3, 4, 4]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(numbers: List Int) :=
-- spec
let spec (result: List Int) :=
result.length = numbers.length ∧
∀ i, i < numbers.length →
result[i]! = (numbers.take (i + 1)).maximum.get!;
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(numbers: List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ numbers, problem_spec implementation numbers) ↔
(∀ numbers, generated_spec implementation numbers) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
let rec rolling_max (numbers: List Int) (results: List Int) (acc: Int) : List Int :=
  match numbers with
  | [] => results
  | n :: ns =>
    let new_acc := max acc n
    let new_results := results ++ [new_acc]
    rolling_max ns new_results new_acc
rolling_max numbers [] 0
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2, 3, 2, 3, 4, 2] = [1, 2, 3, 3, 3, 4, 4]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Int)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers
use result
simp [result]
simp [implementation]
apply And.intro
induction numbers
simp
simp [implementation.rolling_max]
rename_i head tail ih
unfold implementation.rolling_max
simp
-- At this point we will have to
-- strengthen the induction hypothesis
-- to prove the correctness of the implementation
sorry
sorry
-- end_def correctness_proof
