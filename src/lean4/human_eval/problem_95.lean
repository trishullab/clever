import Imports.AllImports
-- start_def problem_details
/--
function_signature: "def check_dict_case(s : dict[str, str]) -> bool"
docstring: |
    Given a dictionary, return True if all keys are strings in lower
    case or all keys are strings in upper case, else return False.
    The function should return False is the given dictionary is empty.
    Note(George): Modified the problem to use strings only for both keys and values.
test_cases:
  - input: {"a":"apple", "b":"banana"}
    expected_output: True
  - input: {"a":"apple", "A":"banana", "B":"banana"}
    expected_output: False
  - input: {"a":"apple", "b":"banana", "a":"apple"}
    expected_output: False
  - input: {"Name":"John", "Age":"36", "City":"Houston"}
    expected_output: False
  - input: {"STATE":"NC", "ZIP":"12345" }
    expected_output: True
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Std.HashMap String String → Bool)
-- inputs
(D: Std.HashMap String String) :=
-- spec
let spec (result : Bool) :=
  match D.isEmpty with
  | true => result = false
  | false =>
    let keys := D.keys
    let all_lower := keys.all (fun s => s.toLower = s)
    let all_upper := keys.all (fun s => s.toUpper = s)
    result = true ↔ all_lower || all_upper
-- program termination
∃ result,
  implementation D = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: Std.HashMap String String → Bool)
-- inputs
(D: Std.HashMap String String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ D, problem_spec impl D) ↔
(∀ D, generated_spec impl D) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (D: Std.HashMap String String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation (Std.HashMap.ofList [("a", "apple"), ("b", "banana")]) = true
-- #test implementation (Std.HashMap.ofList [("a", "apple"), ("A", "banana"), ("B", "banana")]) = false
-- #test implementation (Std.HashMap.ofList [("a", "apple"), ("b", "banana"), ("a", "apple")]) = false
-- #test implementation (Std.HashMap.ofList [("Name", "John"), ("Age", "36"), ("City", "Houston")]) = false
-- #test implementation (Std.HashMap.ofList [("STATE", "NC"), ("ZIP", "12345")]) = true
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(D: Std.HashMap String String)
: problem_spec implementation D
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
