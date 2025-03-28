import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def triples_sum_to_zero(l: list) -> bool"
docstring: |
    triples_sum_to_zero takes a list of integers as an input. It returns True if there are three distinct elements in the list that sum to zero, and False otherwise.
test_cases:
  - input: [1, 3, 5, 0]
    expected_output: "False"
  - input: [1, 3, -2, 1]
    expected_output: "True"
  - input: [1, 2, 3, 7]
    expected_output: "False"
  - input: [2, 4, -5, 3, 9, 7]
    expected_output: "True"
  - input: [1]
    expected_output: "False"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → String)
-- inputs
(l: List) :=
-- spec
let spec (result: String) :=
(result == "True" → (∃ (x y z : Int), x ≠ y ∧ x ≠ z ∧ y ≠ z ∧ (l[x] + l[y] + l[z] = 0))) ∧
(result == "False" → (∀ (x y z : Int), (x ≠ y ∧ x ≠ z ∧ y ≠ z) → (l[x] + l[y] + l[z] ≠ 0)));
-- program termination
∃ result, implementation n = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (n: Nat) : String :=
-- end_def implementation_signature
-- start_def implementation
(String.join (List.map (fun i => String.append i.repr " ") (List.range n))).append (n.repr)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1,3,5,0] = "False"
#test implementation [1,3,-2,1] = "True"
#test implementation [1,2,3,7] = "False"
#test implementation [2,4,-5,3,9,7] = "True"
#test implementation [1] = "False"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(l: List Int)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation n
use result
simp [result]
sorry
-- end_def correctness_proof
