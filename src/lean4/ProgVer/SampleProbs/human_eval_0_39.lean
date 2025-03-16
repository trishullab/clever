import Imports.AllImports


-- /*
--  Filter an input list of strings only for ones that contain given substring

-- */
-- fn filter_by_substring(strings: Vec<String>, substring:String) -> Vec<String>{
theorem problem_7
(strings: List String) --inps
(substring: String)
(impl: List String → String → List String) --impl
:
-- spec
let spec := strings.filter (fun x => x.containsSubstr substring);
∃ result, impl strings substring = result → --Program termination (not needed when using Lean)
result = spec
:= by
sorry

-- /*
--  For a given list of integers, return a tuple consisting of a sum and a product of all the integers in a list.
--     Empty sum should be equal to 0 and empty product should be equal to 1.

-- */
-- fn sum_product(numbers:Vec<i32>) -> (i32,i32){
theorem problem_8
(numbers: List Int32) --inps
(impl: List Int32 → Option (Int64 × Int64)) --impl
:
-- spec
let numbers_int := numbers.map (fun x => Int32.toInt x);
let number_sum := numbers_int.sum;
let number_product := numbers_int.prod;
let precondition := number_product ≤ Int64Max.toInt;
∃ result, impl numbers = result → --Program termination (not needed when using Lean)
match result with
| some (sum, product) => sum.toInt = number_sum ∧ product.toInt = number_product
| none => ¬precondition
:= by
sorry

-- /*
--  From a given list of integers, generate a list of rolling maximum element found until given moment
--     in the sequence.

-- */
-- fn rolling_max(numbers:Vec<i32>) -> Vec<i32>{
theorem problem_9
(numbers: List Int32) --inps
(impl: List Int32 → List Int32) --impl
:
-- spec
let numbers_int := numbers.map (fun x => Int32.toInt x);
let spec (i: Nat) := (numbers_int.take (i+1)).maximum.get!;
∃ result, impl numbers = result → --Program termination (not needed when using Lean)
result.map (fun x => x.toInt) = (List.iota numbers_int.length).reverse.map (fun x => spec x)
:= by
sorry
