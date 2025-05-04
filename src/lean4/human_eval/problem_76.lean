import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_simple_power(x: int, n: int) -> bool"
docstring: |
    Your task is to write a function that returns true if a number x is a simple
    power of n and false in other cases. x is a simple power of n if n**int=x
test_cases:
  - input: (1, 4)
    expected_output: True
  - input: (2, 2)
    expected_output: True
  - input: (8, 2)
    expected_output: True
  - input: (3, 2)
    expected_output: False
  - input: (3, 1)
    expected_output: False
  - input: (5, 3)
    expected_output: False
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → Int → Bool)
-- inputs
(x: Int) (n: Int) :=
-- spec
let spec (result: Bool) :=
  result = exists k: Nat, x == n^k
-- program termination
∃ result, implementation x n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int → Bool)
-- inputs
(x: Int) (n: Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x n, problem_spec impl x n) ↔
(∀ x n, generated_spec impl x n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (x: Int) (n: Int) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 16 2 = True
-- #test implementation 143214 16 = False
-- #test implementation 4 2 = True
-- #test implementation 9 3 = True
-- #test implementation 16 4 = True
-- #test implementation 24 2 = False
-- #test implementation 128 4 = False
-- #test implementation 12 6 = False
-- #test implementation 1 1 = True
-- #test implementation 1 12 = True
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(x: Int) (n: Int)
: problem_spec implementation x n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
