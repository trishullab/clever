import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def rounded_avg(n: int, m: int) -> Option[string]"
docstring: |
    You are given two positive integers n and m, and your task is to compute the
    average of the integers from n through m (including n and m).
    Round the answer to the nearest integer and convert that to binary.
    If n is greater than m, return none.
test_cases:
  - input: (1, 5)
    expected_output: "0b11"
  - input: (7, 5)
    expected_output: None
  - input: (10, 20)
    expected_output: "0b1111"
  - input: (20, 33)
    expected_output: "0b11010"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → Int → Option String)
-- inputs
(n: Int) (m: Int) :=
-- spec
let spec (result: Option String) :=
  True -- FIX !!
-- program termination
∃ result, implementation n m = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int → Option String)
-- inputs
(n: Int) (m: Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ n m, problem_spec impl n m) ↔
(∀ n m, generated_spec impl n m) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Int) (m: Int) : Option String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 1 5 = some "0b11"
-- #test implementation 7 13 = some "0b1010"
-- #test implementation 964 977 = some "0b1111001010"
-- #test implementation 996 997 = some "0b1111100100"
-- #test implementation 560 851 = some "0b1011000010"
-- #test implementation 185 546 = some "0b101101110"
-- #test implementation 362 496 = some "0b110101101"
-- #test implementation 350 902 = some "0b1001110010"
-- #test implementation 197 233 = some "0b11010111"
-- #test implementation 7 5 = none
-- #test implementation 5 1 = none
-- #test implementation 5 5 = some "0b101"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n: Int) (m: Int)
: problem_spec implementation n m
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
