import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def get_coords_sorted(lst : list(list(int)), x : int) -> list((int, int))"
docstring: |
    """
    You are given a 2 dimensional data, as a nested lists,
    which is similar to matrix, however, unlike matrices,
    each row may contain a different number of columns.
    Given lst, and integer x, find integers x in the list,
    and return list of tuples, [(x1, y1), (x2, y2) ...] such that
    each tuple is a coordinate - (row, columns), starting with 0.
    Sort coordinates initially by rows in ascending order.
    Also, sort coordinates of the row by columns in descending order.
test_cases:
  - input: [[1,2,3,4,5,6], [1,2,3,4,1,6], [1,2,3,4,5,1]], 1
    output: [(0, 0), (1, 4), (1, 0), (2, 5), (2, 0)]
  - input: [], 1
    output: []
  - input: [[], [1], [1, 2, 3]], 3
    output: [(2, 2)]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List (List Int) → Int → List (Nat × Nat))
-- inputs
(lst: List (List Int))
(x: Int) :=
-- spec
let spec (result : List (Nat × Nat)) :=
  (∀ i, i < result.length →
    let (row, col) := result[i]!
    row < lst.length ∧
    col < lst[row]!.length ∧
    (lst[row]!)[col]! = x) ∧
  (∀ᵉ (i < lst.length) (j < lst[i]!.length),
    (lst[i]!)[j]! = x → (i, j) ∈ result) ∧
  (result.map (fun (r, c) => r)).Sorted Nat.le ∧
  (∀ i < result.length,
    let (row, col) := result[i]!
    ((result.filter (fun (r, c) => r = row)).map (fun (r, c) => c)).Sorted (fun a b => a ≥ b))
-- program termination
∃ result,
  implementation lst x = result ∧
  spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List (List Int) → Int → List (Nat × Nat))
-- inputs
(lst: List (List Int))
(x: Int) : Prop :=
--end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ lst x, problem_spec impl lst x) ↔
(∀ lst x, generated_spec impl lst x) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (lst: List (List Int)) (x: Int) : List (Nat × Nat) :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation "Hi" = "Hi"
-- #test implementation "hello" = "ehllo"
-- #test implementation "Hello World!!!" = "Hello !!!Wdlor"
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(lst: List (List Int))
(x: Int)
: problem_spec implementation lst x
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
sorry
-- end_def correctness_proof
