import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def change_base(x: Nat, base: Nat) -> String"
docstring: |
    Change numerical base of input number x to base.
    return string representation after the conversion.
    base numbers are less than 10.
test_cases:
  - input: (8, 3)
    expected_output: '22'
  - input: (8, 2)
    expected_output: '1000'
  - input: (7, 2)
    expected_output: '111'
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → Nat -> String)
-- inputs
(x base: Nat) :=
-- spec
let spec (result: String) :=
let result_array := result.toList.map (fun c => c.toNat - '0'.toNat);
let pow_array := (List.range result_array.length).map (fun i => base^(result_array.length - i - 1) * result_array[i]!);
let pow_sum := pow_array.sum;
(0 < base ∧ base ≤ 10) ∧
(∀ i, i < result_array.length →
result_array[i]! < base ∧ 0 ≤ result_array[i]! →
pow_sum = x);
-- program termination
∃ result, implementation x base = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat → String)
-- inputs
(x base: Nat) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ x y, problem_spec impl x y) ↔
(∀ x y, generated_spec impl x y) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (x base: Nat) : String :=
-- end_def implementation_signature
-- start_def implementation
  sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 8 3 = '22'
-- #test implementation 8 2 = '1000'
-- #test implementation 7 2 = '111'
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(x base : Nat)
: problem_spec implementation x base
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation x base
use result
simp [result]
sorry
-- end_def correctness_proof
