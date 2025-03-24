import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def unique(l: list)"
docstring: |
    Return sorted unique elements in a list
test_cases:
  - input: [5, 3, 5, 2, 3, 3, 9, 0, 123]
    output: [0, 2, 3, 5, 9, 123]
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
(∀ x, x ∈ result ↔ x ∈ l ∧ result.count x = 1) ∧
List.Sorted Int.le result
-- program termination
∃ result, implementation l = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (l: List Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
l.eraseDup.mergeSort
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [5, 3, 5, 2, 3, 3, 9, 0, 123] = [0, 2, 3, 5, 9, 123]
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
simp [implementation]
apply And.intro
intro x
apply Iff.intro
intro h
apply And.intro
repeat sorry
-- end_def correctness_proof
