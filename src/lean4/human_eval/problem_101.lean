import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def words_string(s: string) -> List[string]"
docstring: |
    You will be given a string of words separated by commas or spaces. Your task is
    to split the string into words and return an array of the words.
test_cases:
  - input: "Hi, my name is John"
    expected_output: ["Hi", "my", "name", "is", "John"]
  - input: "One, two, three, four, five, six"
    expected_output: ["One", "two", "three", "four", "five", "six"]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: String → List String)
-- inputs
(s: String) :=
-- spec
let spec (result: List String) :=
  result = List.map (fun s => (s.toList.filter (fun c => c != ',')).asString) ((s.splitOn).filter (fun s => s != "" ∧ s != ","))
-- program termination
∃ result, implementation s = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → List String)
-- inputs
(s: String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ s, problem_spec impl s) ↔
(∀ s, generated_spec impl s) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (s: String) : List String :=
-- end_def implementation_signature
-- start_def implementation
  List.map (fun s => (s.toList.filter (fun c => c != ',')).asString) ((s.splitOn).filter (fun s => s != "" ∧ s != ","))
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "Hi, my name is John" = ["Hi", "my", "name", "is", "John"]
-- #test implementation "One, two, three, four, five, six" = ["One", "two", "three", "four", "five", "six"]
-- #test implementation "Hi, my name" = ["Hi", "my", "name"]
-- #test implementation "One,, two, three, four, five, six," = ["One", "two", "three", "four", "five", "six"]
-- #test implementation "" = []
-- #test implementation "ahmed     , gamal" = ["ahmed", "gamal"]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(s: String)
: problem_spec implementation s
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
