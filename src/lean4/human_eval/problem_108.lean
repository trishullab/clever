import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def count_nums(arr: List[int]) -> int"
docstring: |
    Write a function count_nums which takes an array of integers and returns
    the number of elements which has a sum of digits > 0.
    If a number is negative, then its first signed digit will be negative:
    e.g. -123 has signed digits -1, 2, and 3.
test_cases:
  - input: []
    expected_output: 0
  - input: [-1, 11, -11]
    expected_output: 1
  - input: [1, 1, 2]
    expected_output: 3
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Int)
-- inputs
(arr: List Int) :=
-- spec
let spec (result: Int) :=
  let signed_digits(x: Int): List Int :=
    let x': Nat := Int.natAbs x;
    if x >= 0 then
      Nat.digits 10 x'
    else
      let (xs: List Nat) := Nat.digits 10 x';
      (-Int.ofNat (xs[0]!)) :: xs.tail;
  result = ((List.map (fun (x: Int) => (signed_digits x).sum) arr).filter (fun (x: Int) => x > 0)).length
-- program termination
∃ result, implementation arr = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Int)
-- inputs
(arr: List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ arr, problem_spec impl arr) ↔
(∀ arr, generated_spec impl arr) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (arr: List Int) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [] = 0
-- #test implementation [-1, -2, 0] = 0
-- #test implementation [1, 1, 2, -2, 3, 4, 5] = 6
-- #test implementation [1, 6, 9, -6, 0, 1, 5] = 5
-- #test implementation [1, 100, 98, -7, 1, -1] = 4
-- #test implementation [12, 23, 34, -45, -56, 0] = 5
-- #test implementation [-0, 1^0] = 1
-- #test implementation [1] = 1
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(arr: List Int)
: problem_spec implementation arr
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
