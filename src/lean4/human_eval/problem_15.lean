import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def string_sequence(n: int) -> str"
docstring: |
    Return a string containing space-delimited numbers starting from 0 upto n inclusive.
test_cases:
  - input: 0
    expected_output: "0"
  - input: 5
    expected_output: "0 1 2 3 4 5"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → String)
-- inputs
(n: Nat) :=
-- spec
let spec (result: String) :=
let result_nums := result.splitOn " ";
result_nums.length = n + 1 ∧
∀ i, i < n + 1 → result_nums[i]! = i.repr;
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: Nat → String)
-- inputs
(n: Nat) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ n, problem_spec implementation n) ↔
(∀ n, generated_spec implementation n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : String :=
-- end_def implementation_signature
-- start_def implementation
(String.join (List.map (fun i => String.append i.repr " ") (List.range n))).append (n.repr)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 0 = "0"
#test implementation 5 = "0 1 2 3 4 5"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n: Nat)
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
