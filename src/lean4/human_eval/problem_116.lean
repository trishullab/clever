import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def max_fill_count(grid : list[list[int]], capacity : int) -> int"
docstring: |
    Please write a function that sorts an array of non-negative integers according to
    number of ones in their binary representation in ascending order.
    For similar number of ones, sort based on decimal value.
test_cases:
  - input: [1, 5, 2, 3, 4]
    expected_output: [1, 2, 3, 4, 5]
  - input: [1, 0, 2, 3, 4]
    expected_output: [0, 1, 2, 3, 4]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Nat → List Nat)
-- inputs
(lst: List Nat) :=
-- spec
let spec (result : List Nat) :=
  ∀ x : Nat, lst.count x = result.count x ∧
  result.length = lst.length ∧
  (∀ i j : Nat, i < j → j < result.length →
    Nat.digits 2 (result.get! i) < Nat.digits 2 (result.get! j) ∨
    (Nat.digits 2 (result.get! i) = Nat.digits 2 (result.get! j) ∧ result.get! i < result.get! j))
-- program termination
∃ result,
  implementation lst = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Nat → List Nat)
-- inputs
(lst: List Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ lst, problem_spec impl lst) ↔
(∀ lst, generated_spec impl lst) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof


-- start_def implementation_signature
def implementation (lst: List Nat) : List Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation [1, 5, 2, 3, 4] = [1, 2, 3, 4, 5]
-- #test implementation [1, 0, 2, 3, 4] = [0, 1, 2, 3, 4]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Nat)
: problem_spec implementation lst
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
