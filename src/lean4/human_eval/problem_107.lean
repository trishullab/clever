import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def even_odd_palindrome(n: int) -> (int, int)"
docstring: |
    Given a positive integer n, return a tuple that has the number of even and odd
    integer palindromes that fall within the range(1, n), inclusive.
test_cases:
  - input: 3
    expected_output: (1, 2)
  - input: 12
    expected_output: (4, 6)
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → Int × Int)
-- inputs
(n: Int) :=
-- spec
let spec (result: Int × Int) :=
  True -- FIX !!
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int × Int)
-- inputs
(n: Int) : Prop :=
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
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Int) : Int × Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 123 = (8, 13)
-- #test implementation 12 = (4, 6)
-- #test implementation 3 = (1, 2)
-- #test implementation 63 = (6, 8)
-- #test implementation 25 = (5, 6)
-- #test implementation 19 = (4, 6)
-- #test implementation 9 = (4, 5)
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n: Int)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
