import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def unique_digits(x: List[nat]) -> List[nat]"
docstring: |
    Given a list of positive integers x. return a sorted list of all
    elements that hasn't any even digit.

    Note: Returned list should be sorted in increasing order.
test_cases:
  - input: [15, 33, 1422, 1]
    expected_output: [1, 15, 33]
  - input: [152, 323, 1422, 10]
    expected_output: []
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Nat → List Nat)
-- inputs
(x: List Nat) :=
-- spec
let spec (result: List Nat) :=
  let has_even_digits(i: Nat): Bool :=
    (List.filter (fun d => Even d) (Nat.digits 10 i)).length > 0;
  (List.Sorted Nat.le result) ∧
  (forall i, i ∈ result ↔ (i ∈ x ∧ !(has_even_digits i)))
-- program termination
∃ result, implementation x = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Nat → List Nat)
-- inputs
(x: List Nat) : Prop :=
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
def implementation (x: List Nat) : List Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [15, 33, 1422, 1] = [1, 15, 33]
-- #test implementation [152, 323, 1422, 10] = []
-- #test implementation [12345, 2033, 111, 151] = [111, 151]
-- #test implementation [135, 103, 31] = [31, 135]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(x: List Nat)
: problem_spec implementation x
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
