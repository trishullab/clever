import Imports.AllImports


-- /*
--  Given a positive floating point number, it can be decomposed into
--     and integer part (largest integer smaller than given number) and decimals
--     (leftover part always smaller than 1).

--     Return the decimal part of the number.

-- */
-- fn truncate_number(number: &f32) -> f32{
theorem problem_2
(number: Float) --inps
(impl: Float → Option Float) --impl
:
-- spec
let precondition := ¬number.isNaN ∧ number.isFinite;
let number_rational := number.toRat0;
let spec := number_rational - number_rational.floor;
∃ result, impl number = result → --Program termination (not needed when using Lean)
match result with
| some result => result.toRat0 = spec
| none => ¬precondition
:= by
sorry

-- /*
--  You're given a list of deposit and withdrawal operations on a bank account that starts with
--     zero balance. Your task is to detect if at any point the balance of account fallls below zero, and
--     at that point function should return True. Otherwise it should return False.

-- */
-- fn below_zero(operations:Vec<i32>) -> bool{
theorem problem_3
(operations: List Int32) --inps
(impl: List Int32 → Bool) --impl
:
-- spec
let operations_int := operations.map (fun x => Int32.toInt x);
-- ^ Important to convert to Int from Int32 to avoid overflow
-- in the spec itself
let spec := ∃ i, i < operations_int.length ∧
(operations_int.take i).sum < 0;
∃ result, impl operations = result → --Program termination (not needed when using Lean)
if result then spec else ¬spec
:= by
sorry


-- /*
--  For a given list of input numbers, calculate Mean Absolute Deviation
--     around the mean of this dataset.
--     Mean Absolute Deviation is the average absolute difference between each
--     element and a centerpoint (mean in this case):
--     MAD = average | x - x_mean |

-- */
-- fn mean_absolute_deviation(numbers:Vec<f32>) -> f32{
theorem problem_4
(numbers: List Float) --inps
(impl: List Float → Option Float) --impl
:
-- spec
let precondition1 := numbers.length > 0;
let precondition2 := numbers.all (fun x => ¬x.isNaN ∧ x.isFinite);
let rational_numbers := numbers.map (fun x => x.toRat0);
let mean := rational_numbers.sum / rational_numbers.length;
let spec := (rational_numbers.map (fun x => |x - mean|)).sum / rational_numbers.length;
∃ result, impl numbers = result → --Program termination (not needed when using Lean)
match result with
| some result => result.toRat0 = spec
| none => ¬precondition1 ∨ ¬precondition2
:= by
sorry


-- /*
--  Insert a number 'delimeter' between every two consecutive elements of input list `numbers'

-- */
-- fn intersperse(numbers:Vec<u32>, delimeter: u32) -> Vec<u32>{
theorem problem_5
(numbers: List UInt32) --inps
(delimeter: UInt32)
(impl: List UInt32 → UInt32 → List UInt32) --impl
:
-- spec
let spec := numbers.intersperse delimeter;
∃ result, impl numbers delimeter = result → --Program termination (not needed when using Lean)
result = spec
:= by
sorry

-- /*
--  Input to this function is a string represented multiple groups for nested parentheses separated by spaces.
--     For each of the group, output the deepest level of nesting of parentheses.
--     E.g. (()()) has maximum two levels of nesting while ((())) has three.

-- */
-- fn parse_nested_parens(paren_string:String) -> Vec<i32>{
theorem problem_6
(paren_string: String) --inps
(impl: String → Option (List UInt32)) --impl
:
-- spec
let groups := paren_string.split (fun x => x = ' ');
let pre_condition1 :=
paren_string.all (fun x => x == '(' ∨ x == ')' ∨ x == ' ') ∨ paren_string.isEmpty;
let pre_condition2 := groups.all (fun x => string_is_paren_balanced x);
let spec := groups.map (fun x => x.count '(');
let pre_condition3 := spec.all (fun x => x ≤ UInt32Max.toNat);
∃ result, impl paren_string = result → --Program termination (not needed when using Lean)
pre_condition1 → pre_condition2 →
match result with
| some result => result.map (fun x => x.toNat) = spec
| none => ¬pre_condition3
:= by
sorry

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
