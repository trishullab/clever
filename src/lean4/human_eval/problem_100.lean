import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def make_a_pile(n: int) -> List[int]"
docstring: |
    Given a positive integer n, you have to make a pile of n levels of stones.
    The first level has n stones.
    The number of stones in the next level is:
      - the next odd number if n is odd.
      - the next even number if n is even.
    Return the number of stones in each level in a list, where element at index
    i represents the number of stones in the level (i+1).
test_cases:
  - input: 3
    expected_output: [3, 5, 7]
-/
-- end_def problem_details


-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Int → List Int)
-- inputs
(n: Int) :=
-- spec
let spec (result: List Int) :=
  True -- FIX !!
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → List Int)
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
def implementation (n: Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 3 = [3, 5, 7]
-- #test implementation 4 = [4,6,8,10]
-- #test implementation 5 = [5, 7, 9, 11, 13]
-- #test implementation 6 = [6, 8, 10, 12, 14, 16]
-- #test implementation 8 = [8, 10, 12, 14, 16, 18, 20, 22]
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
