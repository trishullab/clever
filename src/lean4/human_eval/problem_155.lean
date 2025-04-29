import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def even_odd_count(num: int) -> Tuple[int, int]"
docstring: |
    Given an integer. return a tuple that has the number of even and odd digits respectively.
test_cases:
  - input: -12
    expected_output: (1, 1)
  - input: 123
    expected_output:(1, 2)
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → Int × Int)
-- inputs
(num: Int) :=
-- spec
let spec (result: Int × Int) :=
  let (even_count, odd_count) := result;
  let num_str := (|num|.toNat).repr;
  let even_digits := num_str.toList.filter (λ c => c.toNat % 2 = 0);
  let odd_digits := num_str.toList.filter (λ c => c.toNat % 2 = 1);
  even_count = even_digits.length ∧
  odd_count = odd_digits.length;
-- program terminates
∃ result, impl num = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Int → Int × Int)
-- inputs
(num: Int) : Prop :=
-- end_def generated_spec
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
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (num: Int) : Int × Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation -12 = (1, 1)
-- #test implementation 123 = (1, 2)
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(num: Int)
: problem_spec implementation num :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
