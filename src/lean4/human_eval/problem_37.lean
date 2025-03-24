import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sort_even(l: list)"
docstring: |
    This function takes a list l and returns a list l' such that
    l' is identical to l in the odd indicies, while its values at the even indicies are equal
    to the values of the even indicies of l, but sorted.
test_cases:
  - input: [1, 2, 3]
    output: [1, 2, 3]
  - input: [5, 6, 3, 4]
    output: [3, 6, 5, 4]
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
l.length = result.length ∧
(let even_idx := (List.range l.length).filter (λ i => i % 2 = 0);
let even_val_in_result := even_idx.map (λ i => result.get! i);
let even_val := even_idx.map (λ i => l.get! i);
(∀ i, i < l.length → (i % 2 ≠ 0 → l.get! i = result.get! i)) ∧
(List.Sorted Int.le even_val_in_result) ∧
(even_val.toFinset = even_val_in_result.toFinset));
-- program termination
∃ result, implementation l = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (l: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
let even_idx := (List.range l.length).filter (λ i => i % 2 = 0);
let even_val := even_idx.map (λ i => l.get! i);
let even_val_sorted := List.mergeSort even_val;
let result := l.mapIdx (λ i v =>
  if i % 2 = 0 then even_val_sorted.get! (i / 2)
  else v);
result
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2, 3] = [1, 2, 3]
#test implementation [5, 6, 3, 4] = [3, 6, 5, 4]
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
sorry
-- end_def correctness_proof
