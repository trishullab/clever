import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def total_match(lst1: List[str], lst2: List[str]) -> List[str]"
docstring: |
  Write a function that accepts two lists of strings and returns the list that has
  total number of chars in the all strings of the list less than the other list.
  If the two lists have the same number of chars, return the first list.
test_cases:
  - input: ([], [])
    expected_output: []
  - input: (['hi', 'admin'], ['hI', 'Hi'])
    expected_output: ['hI', 'Hi']
  - input: (['hi', 'admin'], ['hi', 'hi', 'admin', 'project'])
    expected_output: ['hi', 'admin']
  - input: (['hi', 'admin'], ['hI', 'hi', 'hi'])
    expected_output: ['hI', 'hi', 'hi']
  - input: (['4'], ['1', '2', '3', '4', '5'])
    expected_output: ['4']
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List String → List String → List String)
-- inputs
(lst1: List String) (lst2: List String) :=
let sum_chars (xs: List String) : Int :=
  xs.foldl (λ acc a => acc + a.length) 0;
-- spec
let spec (result : List String) :=
  ((result = lst1) ∨ (result = lst2))
  ∧
  (sum_chars result ≤ sum_chars lst1)
  ∧
  (sum_chars result ≤ sum_chars lst2)
  ∧
  ((sum_chars lst1 = sum_chars lst2) → (result = lst1))
-- program termination
∃ result, implementation lst1 lst2 = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List String → List String → List String)
-- inputs
(lst1: List String) (lst2: List String) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ lst1 lst2, problem_spec impl lst1 lst2) ↔
(∀ lst1 lst2, generated_spec impl lst1 lst2) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
--end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (lst1: List String) (lst2: List String) : List String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation [] [] = []
-- #test implementation ["hi", "admin"] ["hi", "hi"] = ["hi", "hi"]
-- #test implementation ["hi", "admin"] ["hi", "hi", "admin", "project"] = ["hi", "admin"]
-- #test implementation ["4"] ["1", "2", "3", "4", "5"] = ["4"]
-- #test implementation ["hi", "admin"] ["hI", "Hi"] = ["hI", "Hi"]
-- #test implementation ["hi", "admin"] ["hI", "hi", "hi"] = ["hI", "hi", "hi"]
-- #test implementation ["hi", "admin"] ["hI", "hi", "hii"] = ["hi", "admin"]
-- #test implementation [] ["this"] = []
-- #test implementation ["this"] [] == []
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(lst1: List String) (lst2: List String)
: problem_spec implementation lst1 lst2
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
