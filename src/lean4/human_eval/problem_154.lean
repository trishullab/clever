import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def cycpattern_check(String a, String b) -> Bool"
docstring: |
    You are given 2 words. You need to return True if the second word or any of its rotations is a substring in the first word, else False
test_cases:
  - input: ["abcd", "abd"]
    expected_output: False
  - input: ["hello", "ell"]
    expected_output: True
  - input: ["whassup", "psus"]
    expected_output: False
  - input: ["abab", "baa"]
    expected_output: True
  - input: ["efef", "eeff"]
    expected_output: False
  - input: ["himenss", "simen"]
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → String → Bool)
-- inputs
(a b: String) :=
-- spec
let spec (result: Bool) :=
(b.length = 0 → result) ∧
(0 < b.length →
result ↔ ((b.length ≤ a.length) ∧
  (∃ i : Nat, i < b.length ∧
  let b_rotation := b.drop i ++ b.take i;
  a.containsSubstr b_rotation)));
-- program terminates
∃ result, impl a b = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String → Bool)
-- inputs
(a b: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ a b, problem_spec impl a b) ↔
(∀ a b, generated_spec impl a b) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a b: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "abcd" "abd" = False
-- #test implementation "hello" "ell" = True
-- #test implementation "whassup" "psus" = False
-- #test implementation "abab" "baa" = True
-- #test implementation "efef" "eeff" = False
-- #test implementation "himenss" "simen" = True
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(a b: String)
: problem_spec implementation a b :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
