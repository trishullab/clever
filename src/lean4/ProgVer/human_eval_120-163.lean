import Imports.AllImports

-- Given an array arr of integers and a positive integer k, return a sorted list
-- of length k with the maximum k numbers in arr.

-- Note:
--     1. The length of the array will be in the range of [1, 1000].
--     2. The elements in the array will be in the range of [-1000, 1000].
--     3. 0 <= k <= len(arr)

theorem problem_120
(arr: List Int)
(k: Int32)
(impl: List Int32 → Int32 → Option List Int32)
:
let precondition1 := arr.length ≥ 1 ∧ arr.length ≤ 1000;
let precondition2 := arr.all (fun x => ¬x.isNaN ∧ x ≥ -1000 ∧ x ≤ 1000);
let precondition3 := k ≥ 0 ∧ k ≤ arr.length.toInt32;
let sorted := arr.insertionSort ( · ≤ · );
let spec := sorted.rdrop (arr.length - k);
∃ result, impl arr k = result →
match result with
| some result => result = spec
| none => ¬precondition1 ∨ ¬precondition2 ∨ ¬precondition3
:= by
sorry


-- Given a non-empty list of integers, return the sum of all of the odd elements that are in even positions.
-- !Assumes zero-indexed!

-- how to handle overflow?
theorem problem_121
(arr: List Int32)
(impl: List Int32 → Option Int32)
:
let precondition1 := arr ≠ [];
let spec := ((arr.enum.filter (fun (i, x) => i % 2 = 0 ∧ x % 2 = 1)).map Prod.snd).sum; -- enum deprecated?
let precondition2 := spec ≤ Int64Max.toInt;
∃ result, impl arr = result →
match result with
| some result => result = spec
| none => ¬precondition1 ∨ ¬precondition2
:= by
sorry


-- Given a non-empty array of integers arr and an integer k, return
-- the sum of the elements with at most two digits from the first k elements of arr.

-- Constraints:
--     1. 1 <= len(arr) <= 100
--     2. 1 <= k <= len(arr)
theorem problem_122
(arr: List Int32)
(k: Int32)
(impl: List Int32 → Int32 → Option Int32)
:
let precondition1 := arr.length ≥ 1 ∧ arr.length ≤ 100;
let precondition2 := k ≥ 1 ∧ k ≤ arr.length.toInt32;
let spec := (arr.filter (fun x => x ≤ 99 ∨ x ≥ -99)).sum
let precondition3 := spec ≤ Int64.Max.toInt;
∃ result, impl arr k = result →
match result with
| some result => result = spec
| none => ¬precondition1 ∨ ¬precondition2 ∨ ¬precondition3
:= by
sorry


-- Given a positive integer n, return a sorted list that has the odd numbers in collatz sequence.

-- The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined
-- as follows: start with any positive integer n. Then each term is obtained from the
-- previous term as follows: if the previous term is even, the next term is one half of
-- the previous term. If the previous term is odd, the next term is 3 times the previous
-- term plus 1. The conjecture is that no matter what value of n, the sequence will always reach 1.

-- Note:
--     1. Collatz(1) is [1].
--     2. returned list sorted in increasing order.
theorem problem_123
(n: Int32)
:
:= by
sorry


-- Given a list of numbers, return whether or not they are sorted
-- in ascending order. If list has more than 1 duplicate of the same
-- number, return False. Assume no negative numbers and only integers.
theorem problem_126
(arr: List Int32)
(impl: List Int32 → Bool)
:
let precondition1 := ¬arr.any (λ x => x < 0)
let spec := arr.Sorted ( · < · )
∃ result, impl arr = result →
result = spec
:= by
sorry


-- You are given an array arr of integers and you need to return
-- sum of magnitudes of integers multiplied by product of all signs
-- of each number in the array, represented by 1, -1 or 0.
-- Note: return None for empty arr.
theorem problem_128
(arr: List Int32)
(impl: List Int32 → Option Int32)
:
let emptyList := arr = []
let spec :=
