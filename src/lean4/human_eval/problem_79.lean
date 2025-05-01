import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def decimal_to_binary(decimal: int) -> string"
docstring: |
    You will be given a number in decimal form and your task is to convert it to
    binary format. The function should return a string, with each character representing a binary
    number. Each character in the string will be '0' or '1'.

    There will be an extra couple of characters 'db' at the beginning and at the end of the string.
    The extra characters are there to help with the format.
test_cases:
  - input: 15
    expected_output: "db1111db"
  - input: 32
    expected_output: "db100000db"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → String)
-- inputs
(decimal: Int) :=
-- spec
let spec (result: String) :=
  True -- FIX !!
-- program termination
∃ result, implementation decimal = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → String)
-- inputs
(decimal: Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ decimal, problem_spec impl decimal) ↔
(∀ decimal, generated_spec impl decimal) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (decimal: Int) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 0 = "db0db"
-- #test implementation 32 = "db100000db"
-- #test implementation 103 = "db1100111db"
-- #test implementation 15 = "db1111db"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(decimal: Int)
: problem_spec implementation decimal
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
