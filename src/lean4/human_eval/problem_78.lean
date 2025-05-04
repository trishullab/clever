import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def hex_key(num: string) -> int"
docstring: |
    You have been tasked to write a function that receives
    a hexadecimal number as a string and counts the number of hexadecimal
    digits that are primes (prime number, or a prime, is a natural number
    greater than 1 that is not a product of two smaller natural numbers).
    Hexadecimal digits are 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F.
    Prime numbers are 2, 3, 5, 7, 11, 13, 17,...
    So you have to determine a number of the following digits: 2, 3, 5, 7,
    B (=decimal 11), D (=decimal 13).
    Note: you may assume the input is always correct or empty string,
    and symbols A,B,C,D,E,F are always uppercase.
test_cases:
  - input: "AB"
    expected_output: 1
  - input: "1077E"
    expected_output: 2
  - input: "ABED1A33"
    expected_output: 4
  - input: "123456789ABCDEF0"
    expected_output: 6
  - input: "2020"
    expected_output: 2
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → Int)
-- inputs
(num: String) :=
let IsPrimeHexDigit (c: Char): Bool :=
  if c = '2' ∨ c = '3' ∨ c = '5' ∨ c = '7' ∨ c = 'B' ∨ c = 'D' then 1 else 0;
-- spec
let spec (result: Int) :=
  result = num.foldl (λ acc a => acc + (IsPrimeHexDigit a)) 0
-- program termination
∃ result, implementation num = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → Int)
-- inputs
(num: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ num, problem_spec impl num) ↔
(∀ num, generated_spec impl num) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (num: String) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "AB" = 1
-- #test implementation "1077E" = 2
-- #test implementation "ABED1A33" = 4
-- #test implementation "2020" = 2
-- #test implementation "123456789ABCDEF0" = 6
-- #test implementation "112233445566778899AABBCCDDEEFF00" = 12
-- #test implementation "" = 0
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(num: String)
: problem_spec implementation num
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
