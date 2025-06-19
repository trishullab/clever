import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def separate_paren_groups(paren_string: str) -> List[str]"
docstring: |
    Input to this function is a string containing multiple groups of nested parentheses. Your goal is to
    separate those group into separate strings and return the list of those.
    Separate groups are balanced (each open brace is properly closed) and not nested within each other
    Ignore any spaces in the input string.
test_cases:
  - input: "( ) (( )) (( )( ))"
    expected_output:
      - "()"
      - "(())"
      - "(()())"
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → List String)
-- inputs
(paren_string: String) :=
-- spec
let paren_string_filtered := (paren_string.toList.filter (fun c => c == '(' ∨  c == ')')).asString;
let spec (result_list: List String) :=
-- concat of result is input_filtered
(result_list.foldl (· ++ ·) "" = paren_string_filtered) ∧
-- each item in result is balanced and has only one group
(∀ str ∈ result_list, balanced_paren_non_computable str '(' ')' ∧ count_paren_groups str = 1);
-- program terminates
∃ result, impl paren_string = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → List String)
-- inputs
(paren_string: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ paren_string, problem_spec impl paren_string) ↔
(∀ paren_string, generated_spec impl paren_string) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (paren_string: String) : List String :=
-- end_def implementation_signature
-- start_def implementation
-- remove space or any other characters that are not '(' or ')'
let filtered := paren_string.toList.filter (fun c => c == '(' ∨  c == ')');
-- auxiliary recursive function:
let rec aux (cs : List Char) (cur : List Char) (balance : Int) (acc : List String) : List String :=
  match cs with
  | []      => acc.reverse  -- when finished, return accumulated groups in original order
  | c::rest =>
    let new_cur    := cur ++ [c]
    let new_balance:= if c = '(' then
                      balance + 1
                      else
                      balance - 1
    if new_balance = 0 then
      let group := new_cur.asString
      aux rest [] 0 (group :: acc)
    else
      aux rest new_cur new_balance acc;
aux filtered [] 0 []
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "( ) (( )) (( )( ))" = ["()", "(())", "(()())"]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(paren_string: String)
: problem_spec implementation paren_string :=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation paren_string
use result
simp [result]
sorry
-- end_def correctness_proof
