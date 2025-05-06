import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def factorize(n: int) -> List[int]"
docstring: |
    Return list of prime factors of given integer in the order from smallest to largest.
    Each of the factors should be listed number of times corresponding to how many times it appeares in factorization.
    Input number should be equal to the product of all factors
test_cases:
  - input: 8
    expected_output: [2, 2, 2]
  - input: 25
    expected_output: [5, 5]
  - input: 70
    expected_output: [2, 5, 7]
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: Nat → List Nat)
-- inputs
(n: Nat) :=
-- spec
let spec (result: List Nat) :=
2 ≤ n →
(result.prod = n ∧
List.Sorted Nat.le result ∧
result.all (λ i => n % i = 0 ∧ Nat.Prime i));
-- program termination
∃ result, implementation n = result ∧
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(implementation: Nat → List Nat)
-- inputs
(n: Nat) : Prop :=
-- end_def generated_spec
-- start_def generated_spec_body
sorry
-- end_def generated_spec_body


-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ implementation,
(∀ n, problem_spec implementation n) ↔
(∀ n, generated_spec implementation n) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (n: Nat) : List Nat :=
-- end_def implementation_signature
-- start_def implementation
Id.run do
let mut result := []
for num in List.range' 2 n.sqrt do
  let mut n' := n
  while n' % num = 0 do
    n' := n' / num
    result := result ++ [num]
result
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation 8 = [2, 2, 2]
#test implementation 25 = [5, 5]
#test implementation 70 = [2, 5, 7]
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(n: Nat)
: problem_spec implementation n
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation n
use result
simp [result]
simp [implementation, Id.run]
unfold List.foldl
intro h_2_lt_n
sorry
-- end_def correctness_proof
