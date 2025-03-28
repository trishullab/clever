import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def get_odd_collatz (n: int) -> List[int]"
docstring: |
    Given a positive integer n, return a sorted list that has the odd numbers in collatz sequence.

    The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined
    as follows: start with any positive integer n. Then each term is obtained from the
    previous term as follows: if the previous term is even, the next term is one half of
    the previous term. If the previous term is odd, the next term is 3 times the previous
    term plus 1. The conjecture is that no matter what value of n, the sequence will always reach 1.

    Note:
        1. Collatz(1) is [1].
        2. returned list sorted in increasing order.
test_cases:
  - input: 5
    expected_output: [1, 5]
--/
-- end_def problem_details

-- helper function
def collatzSequence (n : Int) : List Int :=
  if n ≤ 0 then [] else
  if n == 1 then [1] else
  let rec loop (currNum : Int) (arr : List Int) : List Int :=
    let arr' := currNum :: arr;
    if currNum == 1 then arr' else
    let next := if currNum % 2 == 0 then currNum / 2 else 3 * currNum + 1;
    loop next arr'
  loop n []


-- start_def problem_spec
def problem_spec
-- function signature
(impl: Int → List Int)
-- inputs
(n: Int) :=
-- spec
let odd_collatz := (collatzSequence n).filter (fun x => x % 2 = 0);
let spec (result: List Int) :=
  n > 0 → Multiset.ofList odd_collatz = Multiset.ofList result ∧ result.Sorted (· ≤ ·);
-- program termination
∃ result, impl n = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (n: Int) : List Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation 5 = [1, 5]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(n: Int)
: problem_spec implementation n :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
