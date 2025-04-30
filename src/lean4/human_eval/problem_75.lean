import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_multiply_prime(a: int) -> bool"
docstring: |
    Write a function that returns true if the given number is the multiplication of 3 prime numbers
    and false otherwise. Knowing that (a) is less then 100.
test_cases:
  - input: 30
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → Bool)
-- inputs
(a: Int) :=
-- spec
let spec (result: Bool) :=
  True -- FIX !!
-- program termination
∃ result, implementation a = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Bool)
-- inputs
(a: Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ a, problem_spec impl a) ↔
(∀ a, generated_spec impl a) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a: Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 5 = False
-- #test implementation 30 = True
-- #test implementation 8 = True
-- #test implementation 10 = False
-- #test implementation 125 = True
-- #test implementation (3 * 5 * 7) = True
-- #test implementation (3 * 6 * 7) = False
-- #test implementation (9 * 9 * 9) = False
-- #test implementation (11 * 9 * 9) = False
-- #test implementation (11*13*7) = True
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(a: Int)
: problem_spec implementation a
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
