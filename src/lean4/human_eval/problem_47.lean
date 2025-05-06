import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def median(numbers: List[float]) -> float"
docstring: |
    Return median of elements in the list l
test_cases:
  - input: [3, 1, 2, 4, 5]
    output: 3
  - input: [-10, 4, 6, 1000, 10, 20]
    output: 15.0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Rat → Rat)
-- inputs
(numbers: List Rat) :=
-- spec
let spec (result: Rat) :=
  0 < numbers.length →
  let less_eq := (numbers.filter (fun x => x ≤ result));
  let more_eq := (numbers.filter (fun x => result ≤ x));
  let max_more_eq := more_eq.max?;
  let min_less_eq := less_eq.min?;
  let less_eq_count := less_eq.length;
  let more_eq_count := more_eq.length;
  let eq_count := (numbers.filter (fun x => x = result)).length;
  (less_eq_count + more_eq_count - eq_count = numbers.length →
  numbers.length ≤ 2 * less_eq_count →
  numbers.length ≤ 2 * more_eq_count) ∧
  ((numbers.length % 2 = 1 →
    result ∈ numbers) ∧
    (numbers.length % 2 = 0 → max_more_eq.isSome ∧
    min_less_eq.isSome ∧
    2 * result = max_more_eq.get! + min_less_eq.get!));
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Rat → Rat)
-- inputs
(x: List Rat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x, problem_spec impl x) ↔
(∀ x, generated_spec impl x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (numbers: List Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [3, 1, 2, 4, 5] = 3
-- #test implementation [-10, 4, 6, 1000, 10, 20] = 15.0
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(numbers: List Rat)
: problem_spec implementation numbers
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation numbers
use result
simp [result]
repeat sorry
-- end_def correctness_proof
