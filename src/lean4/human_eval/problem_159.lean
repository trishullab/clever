import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def eat(number: Nat, need: Nat, remaining: Nat) -> List Nat"
docstring: |
    You're a hungry rabbit, and you already have eaten a certain number of carrots,
    but now you need to eat more carrots to complete the day's meals.
    you should return an array of [ total number of eaten carrots after your meals,
                                    the number of carrots left after your meals ]
    if there are not enough remaining carrots, you will eat all remaining carrots, but will still be hungry.

    Variables:
      @number : integer
          the number of carrots that you have eaten.
      @need : integer
          the number of carrots that you need to eat.
      @remaining : integer
          the number of remaining carrots thet exist in stock

    Constrain:
    * 0 <= number <= 1000
    * 0 <= need <= 1000
    * 0 <= remaining <= 1000
test_cases:
  - input: [5, 6, 10]
    expected_output: [11, 4]
  - input: [4, 8, 9]
    expected_output: [12, 1]
  - input: [1, 10, 10]
    expected_output: [11, 0]
  - input: [2, 11, 5]
    expected_output: [7, 0]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: Nat → Nat → Nat → List Nat)
-- inputs
(number need remaining: Nat) :=
-- spec
let spec (result: List Nat) :=
number ≤ 1000 → need ≤ 1000 → remaining ≤ 1000 →
result.length = 2 ∧
(need ≤ remaining → result[0]! - need = number ∧
need = remaining - result[1]!) ∧
(remaining < need → result[0]! - remaining = number ∧
result[1]! = 0);
-- program terminates
∃ result, impl number need remaining = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Nat → Nat → Nat → List Nat)
-- inputs
(a b c : Nat) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ a b c, problem_spec impl a b c) ↔
(∀ a b c, generated_spec impl a b c) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (a b c: Nat) : List Nat :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 5 6 10 = [11, 4]
-- #test implementation 4 8 9 = [12, 1]
-- #test implementation 1 10 10 = [11, 0]
-- #test implementation 2 11 5 = [7, 0]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(a b c: Nat)
: problem_spec implementation a b c :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
