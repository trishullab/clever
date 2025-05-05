import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def int_to_mini_roman(num: Nat) -> String"
docstring: |
    Given a positive integer, obtain its roman numeral equivalent as a string,
    and return it in lowercase.
    Restrictions: 1 <= num <= 1000
test_cases:
  - input: 19
    expected_output: xix
  - input: 152
    expected_output: clii
  - input: 426
    expected_output: cdxxvi
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Nat → String)
-- inputs
(num: Nat) :=

let is_sorted_asc : List Int → Bool := fun numbers =>
let rec is_sorted_asc_helper : List Int → Bool → Bool := fun numbers is_sorted =>
  match numbers with
  | [] => is_sorted
  | [x] => is_sorted
  | x::y::rest => if x <= y then is_sorted_asc_helper (y::rest) true else false;
is_sorted_asc_helper numbers false;

let is_mini_roman : Nat → String → Bool := fun input result =>

  let sym_to_num : Std.HashMap String Nat :=
    Std.HashMap.ofList [
      ("I", 1),
      ("IV", 4),
      ("V", 5),
      ("IX", 9),
      ("X", 10),
      ("XL", 40),
      ("L", 50),
      ("XC", 90),
      ("C", 100),
      ("CD", 400),
      ("D", 500),
      ("CM", 900),
      ("M", 1000)
    ];

  -- Recursive function `go` that checks the Roman numeral
  let rec decode : Nat → List Char → Bool := fun input result =>
    match result with
    | [] => input = 0  -- Base case: If no symbols left, input should be 0
    | [x] =>
      match sym_to_num[String.mk (result.take 1)]? with
      | some n => input = n  -- If only 1 symbol left, it should match the input value
      | none => false  -- If no valid symbol, return false
    | x::y::rest =>
      -- Ensure that there are at least 2 characters to take
      let two := result.take 2
      let one := result.take 1
      -- Try two-symbol match
      match sym_to_num[String.mk two]? with
      | some n => decode (input - n) rest
      | none =>
        -- If two-symbol match fails, try one-symbol match
        match sym_to_num[String.mk one]? with
        | some m => decode (input - m) (y::rest)
        | none => false  -- If both fail, return false


  decode input result.toList
-- spec
let spec (result: String) :=
1 ≤ num ∧ num ≤ 1000 →
is_mini_roman num result
-- program terminates
∃ result, impl num = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → String)
-- inputs
(num: Nat) : Prop :=
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
def implementation (num: Nat) : String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 19 = xix
-- #test implementation 152 = clii
-- #test implementation 426 = cdxxvi
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(num: Nat)
: problem_spec implementation num :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
