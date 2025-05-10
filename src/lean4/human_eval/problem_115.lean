import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def max_fill_count(grid : list[list[int]], capacity : int) -> int"
docstring: |
    You are given a rectangular grid of wells. Each row represents a single well,
    and each 1 in a row represents a single unit of water.
    Each well has a corresponding bucket that can be used to extract water from it,
    and all buckets have the same capacity.
    Your task is to use the buckets to empty the wells.
    Output the number of times you need to lower the buckets.
    Constraints:
        * all wells have the same length
        * 1 <= grid.length <= 10^2
        * 1 <= grid[:,1].length <= 10^2
        * grid[i][j] -> 0 | 1
        * 1 <= capacity <= 10
test_cases:
  - input: ([[0,0,1,0], [0,1,0,0], [1,1,1,1]], 1)
    expected_output: 6
  - input: ([[0,0,1,1], [0,0,0,0], [1,1,1,1], [0,1,1,1]], 2)
    expected_output: 5
  - input: ([[0,0,0], [0,0,0]], 5)
    expected_output: 0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List (List Nat) → Nat → Nat)
-- inputs
(grid: List (List Nat))
(capacity: Nat) :=
-- spec
let spec (result : Nat) :=
  (grid.all (fun row => row.all (fun cell => cell = 0 ∨ cell = 1))) →
  (∃ len : Nat, grid.all (fun row => row.length = len)) →
  (result = 0 ↔ grid.length = 0) ∧
  (grid.length > 0 →
    let well_water_count := grid.head!.sum;
    result - (well_water_count / capacity) - (if well_water_count % capacity > 0 then 1 else 0) = implementation grid.tail! capacity)
-- program termination
∃ result,
  implementation grid capacity = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List (List Nat) → Nat → Nat)
-- inputs
(grid: List (List Nat))
(capacity: Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ grid capacity, problem_spec impl grid capacity) ↔
(∀ grid capacity, generated_spec impl grid capacity) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof


-- start_def implementation_signature
def implementation (grid: List (List Nat)) (capacity: Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation [[0,0,1,0], [0,1,0,0], [1,1,1,1]] 1 = 6
-- #test implementation [[0,0,1,1], [0,0,0,0], [1,1,1,1], [0,1,1,1]] 2 = 5
-- #test implementation [[0,0,0], [0,0,0]] 5 = 0
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(grid: List (List Nat))
(capacity: Nat)
: problem_spec implementation grid capacity
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
