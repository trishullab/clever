import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def is_balanced(paren_string: str) -> bool"
docstring: |
    Given a string that may include various characters, your task is to check if the parentheses are balanced.
    For this problem, only consider the '(' and ')' characters. A string is considered balanced if every
    opening parenthesis '(' has a corresponding closing parenthesis ')' in the correct order. Ignore all
    other characters. Return True if the string is balanced, and False otherwise.
test_cases:
  - input: "a*(b+c) - {d/e}"
    expected_output: true
  - input: "(()())"
    expected_output: true
  - input: "())("
    expected_output: false
  - input: "(hello (world))"
    expected_output: true
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → Bool)
-- inputs
(paren_string: String) :=
-- spec
let spec (result: Bool) :=
paren_string.length > 0 →
(result ↔ balanced_paren_non_computable paren_string);
-- program terminates
∃ result, impl paren_string = result →
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (paren_string: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
let rec loop (s_chars: List Char) (num_open: Int): Int :=
  match s_chars with
  | [] => num_open
  | '(' :: tail => loop tail (num_open + 1)
  | ')' :: tail =>
    if num_open > 0 then
      loop tail (num_open - 1)
    else
      loop tail num_open
  | _ :: tail => loop tail num_open
(loop paren_string.toList 0) = 0
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "(()())" = true
#test implementation "())(" = false
#test implementation "(hello (world))" = true
#test implementation "a*(b+c) - {d/e}" = true
#test implementation "((a+b)*(c+d))" = true
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(paren_string: String)
: problem_spec implementation paren_string
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
-- sometimes we have to create a temporary variable to use in the proof
unfold problem_spec
let result := implementation paren_string
use result
simp [result]
simp [implementation]
sorry
-- end_def correctness_proof
