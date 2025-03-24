import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sort_third(l: list):"
docstring: |
    This function takes a list l and returns a list l' such that
    l' is identical to l in the indicies that are not divisible by three, while its values at the indicies that are divisible by three are equal
    to the values of the corresponding indicies of l, but sorted.
test_cases:
  - input: [1, 2, 3]
    output: [1, 2, 3]
  - input: [5, 6, 3, 4, 8, 9, 2]
    output: [2, 6, 3, 4, 8, 9, 5]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → List Int)
-- inputs
(l: List Int) :=
-- spec
let spec (result: List Int) :=
let every_third_idx := (List.range l.length).filter (λ i => i % 3 = 0);
let every_third_val_in_result := every_third_idx.map (λ i => result.get! i);
let every_third_val := every_third_idx.map (λ i => l.get! i);
l.length = result.length ∧
(∀ i, i < l.length → (i % 3 ≠ 0 → l.get! i = result.get! i)) ∧
(List.Sorted Int.le every_third_val_in_result) ∧
(every_third_val.toFinset = every_third_val_in_result.toFinset);
-- program termination
∃ result, implementation l = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (l: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
let every_third_idx := (List.range l.length).filter (λ i => i % 3 = 0);
let every_third_val := every_third_idx.map (λ i => l.get! i);
let every_third_val_sorted := List.mergeSort every_third_val;
let result := l.mapIdx (λ i v =>
  if i % 3 = 0 then every_third_val_sorted.get! (i / 3)
  else v);
result
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2, 3] = [1, 2, 3]
#test implementation [5, 6, 3, 4, 8, 9, 2] = [2, 6, 3, 4, 8, 9, 5]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(l: List Int)
: problem_spec implementation l
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation l
use result
simp [result]
repeat sorry
-- end_def correctness_proof
