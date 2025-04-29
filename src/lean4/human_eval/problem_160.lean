import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def do_algebra(operator: List String, operand: List Nat) -> Int"
docstring: |
    Given two lists operator, and operand. The first list has basic algebra operations, and
    the second list is a list of integers. Use the two given lists to build the algebric
    expression and return the evaluation of this expression.

    The basic algebra operations:
    Addition ( + )
    Subtraction ( - )
    Multiplication ( * )
    Floor division ( // )
    Exponentiation ( ** )

    Note:
        The length of operator list is equal to the length of operand list minus one.
        Operand is a list of of non-negative integers.
        Operator list has at least one operator, and operand list has at least two operands.
test_cases:
  - input: [['+', '*', '-'], [2, 3, 4, 5]]
    expected_output: 9
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List String → List Nat → Int)
-- inputs
(operator : List String)
(operand : List Nat) :=
-- spec
let spec (result: Int) :=
operator.length = operand.length - 1 ∧ 1 < operator.length →
sorry
-- program terminates
∃ result, impl operator operand = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List String → List Nat → Int)
-- inputs
(operator : List String)
(operand : List Nat) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ operator operand, problem_spec impl operator operand) ↔
(∀ operator operand, generated_spec impl operator operand) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (operator: List String) (operand : List Nat) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ['+', '*', '-'] [2,3,4,5] = 9
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(operator : List String) (operand : List Nat)
: problem_spec implementation operator operand :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
