import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def car_race_collision(x: Nat) -> Nat"
docstring: |
    Imagine a road that's a perfectly straight infinitely long line.
    n cars are driving left to right;  simultaneously, a different set of n cars
    are driving right to left.   The two sets of cars start out being very far from
    each other.  All cars move in the same speed.  Two cars are said to collide
    when a car that's moving left to right hits a car that's moving right to left.
    However, the cars are infinitely sturdy and strong; as a result, they continue moving
    in their trajectory as if they did not collide.
    This function outputs the number of such collisions.
test_cases:
  - input: 0
    expected_output: 0
  - input: 5
    expected_output: 25
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Nat)
-- inputs
(x : Nat) :=
-- spec
let spec (result: Nat) :=
  result = x * x;
-- -- program termination
∃ result, implementation x = result →
spec result
-- -- end_def problem_spec

-- start_def implementation_signature
def implementation (x : Nat) : Nat :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- start_def correctness_definition
theorem correctness
(x : Nat)
: problem_spec implementation x
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation x
use result
simp [result]
sorry
-- end_def correctness_proof
