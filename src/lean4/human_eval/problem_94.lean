import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def sum_largest_prime(lst : list[int]) -> int"
docstring: |
    You are given a list of integers.
    You need to find the largest prime value and return the sum of its digits.
test_cases:
  - input: [0,3,2,1,3,5,7,4,5,5,5,2,181,32,4,32,3,2,32,324,4,3]
    expected_output: 10
  - input: [1,0,1,8,2,4597,2,1,3,40,1,2,1,2,4,2,5,1]
    expected_output: 25
  - input: [1,3,1,32,5107,34,83278,109,163,23,2323,32,30,1,9,3]
    expected_output: 13
  - input: [0,724,32,71,99,32,6,0,5,91,83,0,5,6]
    expected_output: 11
  - input: [0,81,12,3,1,21]
    expected_output: 3
  - input: [0,8,1,2,1,7]
    expected_output: 7
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Int)
-- inputs
(lst: List Int) :=
-- spec
let spec (result : Int) :=
  match result with
  | 0 => ¬ (∃ i, i < lst.length ∧ Prime (lst.get! i))
  | _ => result > 0 ∧ ∃ i, i < lst.length ∧ Prime (lst.get! i) ∧
    (∀ j, j < lst.length ∧ Prime (lst.get! j) → lst.get! i ≤ lst.get! j) ∧
    result = (Nat.digits 10 (lst.get! i).toNat).sum
-- program termination
∃ result,
  implementation lst = result ∧
  spec result

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int)
-- inputs
(lst: List Int) : Prop :=
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
def implementation (lst: List Int) : Int := sorry
-- end_def implementation_signature

-- start_def implementation
-- end_def implementation

-- start_def test_cases
-- #test implementation [0,3,2,1,3,5,7,4,5,5,5,2,181,32,4,32,3,2,32,324,4,3] = 10
-- #test implementation [1,0,1,8,2,4597,2,1,3,40,1,2,1,2,4,2,5,1] = 25
-- #test implementation [1,3,1,32,5107,34,83278,109,163,23,2323,32,30,1,9,3] = 13
-- #test implementation [0,724,32,71,99,32,6,0,5,91,83,0,5,6] = 11
-- #test implementation [0,81,12,3,1,21] = 3
-- #test implementation [0,8,1,2,1,7] = 7
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
