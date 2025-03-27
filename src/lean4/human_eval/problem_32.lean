import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def find_zero(xs: list)"
docstring: |
    xs are coefficients of a polynomial.
    find_zero find x such that poly(x) = 0.
    find_zero returns only only zero point, even if there are many.
    Moreover, find_zero only takes list xs having even number of coefficients
    and largest non zero coefficient as it guarantees
    a solution.
test_cases:
  - input: [1, 2]
    output: -0.5
  - input: [-6, 11, -6, 1]
    output: 1.0
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(implementation: List Rat → Rat)
-- inputs
(xs: List Rat) :=
-- spec
let spec (result: Rat) :=
let eps := (1: Rat) / 1000000;
xs.length ≥ 1 → xs.length % 2 = 0 →
∀ poly : Polynomial Rat,
poly.degree = some (xs.length - 1) →
(∀ i, i ≤ xs.length - 1 → poly.coeff i = xs.get! i) →
|poly.eval result| ≤ eps;
-- program termination
∃ result, implementation xs = result →
spec result
-- end_def problem_spec

-- start_def implementation_signature
def implementation (xs: List Rat) : Rat :=
-- end_def implementation_signature
-- start_def implementation
let rec poly (xs: List Rat) (x: Rat) := xs.reverse.foldl (λ acc a => acc * x + a) 0;
let rec poly' (xs: List Rat) (x: Rat) := (xs.drop 1).reverse.foldl (λ acc a => acc * x + a) 0;
let rec eps := (1: Rat) / 1000000;
let rec find_zero (xs: List Rat) (guess: Rat) (fuel: Nat) :=
let eval := poly xs guess;
let eval' := poly' xs guess;
if eval ≤ eps ∨ fuel = 0 then (guess, fuel)
else
let guess' := (eval' * guess - eval) / eval';
find_zero xs guess' (fuel - 1);
(find_zero xs 1.0 1000000).1
-- Note: The above implementation can fail to converge in some cases. For example,
-- on the test case [-6, 11, -6, 1] as the derivative of the polynomial
-- can be zero at if the guess is 0. In such cases, the implementation will not
-- converge. The implementation can be improved by using a better guess.
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
#test implementation [1, 2] = -0.5
#test implementation [-6, 11, -6, 1] = 1.0
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(xs: List Rat)
: problem_spec implementation xs
:=
-- end_def correctness_definition
-- start_def correctness_proof
by
unfold problem_spec
let result := implementation xs
use result
simp [result]
intros h1 h2 poly h3 h4
repeat sorry
-- end_def correctness_proof
