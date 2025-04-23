import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def next_smallest(lst: List[int]) -> Optional[int]"
docstring: |
    You are given a list of integers.
    Write a function next_smallest() that returns the 2nd smallest element of the list.
    Return None if there is no such element.
    TODO(George): Remove this when being reviewed
    The spec is defined as: if result is none there is no second smallest element, which
    exists in a finite list iff there are at least two distinct elements in the list.
    If result is some x, then x is the second smallest element of the list, the spec
    obtains the sublist of elements smaller than the result, and checks that this
    sublist does not contain two distinct elements (they are all the same).
test_cases:
  - input: [1, 2, 3, 4, 5]
    output: 2
  - input: [5, 1, 4, 3, 2]
    output: 2
  - input: []
    output: None
  - input: [1, 1]
    output: None
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Int → Option Int)
-- inputs
(lst: List Int) :=
-- spec
let spec (result : Option Int) :=
  match result with
  | none => ¬ (∃ i j, i < lst.length ∧ j < lst.length ∧ i ≠ j ∧ lst.get! i < lst.get! j)
  | some result =>
    let smaller_els := lst.filter (· < result);
    0 < smaller_els.length ∧
    smaller_els.all (λ x => x = smaller_els.get! 0);
-- program termination
∃ result,
  implementation lst = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List Int → Option Int)
-- inputs
(lst: List Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ lst, problem_spec impl lst) ↔
(∀ lst, generated_spec impl lst) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (lst: List Int) : Option Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation [1, 2, 3, 4, 5] = some 2
-- #test implementation [5, 1, 4, 3, 2] = some 2
-- #test implementation [] = none
-- #test implementation [1, 1] = none
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(lst: List Int)
: problem_spec implementation lst
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
