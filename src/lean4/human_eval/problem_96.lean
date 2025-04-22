import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def count_up_to(n : int) -> list[int]"
docstring: |
    Implement a function that takes an non-negative integer and returns an array of the first n
    integers that are prime numbers and less than n.
test_cases:
  - input: 5
    expected_output: [2,3]
  - input: 11
    expected_output: [2,3,5,7]
  - input: 0
    expected_output: []
  - input: 20
    expected_output: [2,3,5,7,11,13,17,19]
  - input: 1
    expected_output: []
  - input: 18
    expected_output: [2,3,5,7,11,13,17]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → List Nat)
-- inputs
(n: Nat) :=
-- spec
let spec (result : List Nat) :=
  match n with
  | 0 => result = []
  | n => n > 0 → (∀ i, i < result.length → (Nat.Prime (result.get! i)) ∧ (result.get! i) < n) ∧
         (∀ i : Nat, i < n → Nat.Prime i → i ∈ result)
-- program termination
∃ result,
  implementation n = result ∧
  spec result

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → List Nat)
-- inputs
(n: Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ n, problem_spec impl n) ↔
(∀ n, generated_spec impl n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof


-- start_def implementation_signature
def implementation (n: Nat) : List Nat := sorry
-- end_def implementation_signature

-- start_def implementation
-- end_def implementation

-- start_def test_cases
-- #test implementation 5 = [2,3]
-- #test implementation 11 = [2,3,5,7]
-- #test implementation 0 = []
-- #test implementation 20 = [2,3,5,7,11,13,17,19]
-- #test implementation 1 = []
-- #test implementation 18 = [2,3,5,7,11,13,17]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n: Nat)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
