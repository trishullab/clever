import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def find_closest_elements(numbers: List[float]) -> Tuple[float, float]"
docstring: |
    From a supplied list of numbers (of length at least two) select and return two that are the closest to each
    other and return them in order (smaller number, larger number).
test_cases:
  - input: [1.0, 2.0, 3.0, 4.0, 5.0, 2.2]
    expected_output: (2.0, 2.2)
  - input: [1.0, 2.0, 3.0, 4.0, 5.0, 2.0]
    expected_output: (2.0, 2.0)
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Rat → (Rat × Rat))
-- inputs
(numbers: List Rat) :=
-- spec
let spec (result: (Rat × Rat)) :=
2 ≤ numbers.length →
(let (smaller, larger) := result;
let abs_diff := |larger - smaller|;
smaller ≤ larger ∧
smaller ∈ numbers ∧
larger ∈ numbers ∧
(∀ x y, x ∈ numbers → y ∈ numbers →  abs_diff ≤ |x - y|) ∧
(smaller = larger → 1 ≤ (numbers.filter (fun z => z = smaller)).length));
-- program termination
∃ result, implementation numbers = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: List Rat → (Rat × Rat))
-- inputs
(numbers: List Rat) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
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
def implementation (numbers: List Rat): (Rat × Rat) :=
-- end_def implementation_signature
-- start_def implementation
let n := numbers.length;
let sorted_numbers := numbers.mergeSort;
let min_diff := sorted_numbers.get! 1 - sorted_numbers.get! 0;
let min_pair := (sorted_numbers.get! 0, sorted_numbers.get! 1);
let rec loop (i: Nat) (min_diff: Rat) (min_pair: (Rat × Rat)): (Rat × Rat) :=
  if i < n - 1 then
    let diff := sorted_numbers.get! (i + 1) - sorted_numbers.get! i;
    if diff < min_diff then
      loop (i + 1) diff (sorted_numbers.get! i, sorted_numbers.get! (i + 1))
    else
      loop (i + 1) min_diff min_pair
  else
    min_pair;
loop 1 min_diff min_pair
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1.0, 2.0, 3.0, 4.0, 5.0, 2.2] = (2.0, 2.2)
#test implementation [1.0, 2.0, 3.0, 4.0, 5.0, 2.0] = (2.0, 2.0)
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
sorry
-- end_def correctness_proof
