import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def parse_nested_parens(paren_string: str) -> List[int]"
docstring: |
    Input to this function is a string represented multiple groups for nested parentheses separated by spaces.
    For each of the group, output the deepest level of nesting of parentheses.
    E.g. (()()) has maximum two levels of nesting while ((())) has three.
test_cases:
  - input: "(()()) ((())) () ((())()())"
    expected_output: [2, 3, 1, 3]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → List Int)
-- inputs
(paren_string: String)
:=
-- spec
let spec (result: List Int) :=
let paren_space_split := paren_string.split (fun x => x = ' ');
result.length = paren_space_split.length ∧
∀ i, i < result.length →
let group := paren_space_split[i]!;
balanced_paren_non_computable group '(' ')' →
0 < result[i]! ∧ count_max_paren_depth group = result[i]!.toNat;
-- program termination
∃ result, implementation paren_string = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: String → List Int)
-- inputs
(paren_string: String) : Prop :=
--end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ paren_string, problem_spec implementation paren_string) ↔
(∀ paren_string, generated_spec implementation paren_string) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (paren_string: String) : List Int :=
-- end_def implementation_signature
-- start_def implementation
(paren_string.split (fun x => x = ' ')).map (fun x => count_max_paren_depth x)
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation "(()()) ((())) () ((())()())" = [2, 3, 1, 3]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(paren_string: String)
: problem_spec implementation paren_string
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation paren_string
use result
simp [result]
sorry
-- end_def correctness_proof
