import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def valid_date(date: String) -> Bool"
docstring: |
    You have to write a function which validates a given date string and
    returns True if the date is valid otherwise False.
    The date is valid if all of the following rules are satisfied:
    1. The date string is not empty.
    2. The number of days is not less than 1 or higher than 31 days for months 1,3,5,7,8,10,12. And the number of days is not less than 1 or higher than 30 days for months 4,6,9,11. And, the number of days is not less than 1 or higher than 29 for the month 2.
    3. The months should not be less than 1 or higher than 12.
    4. The date should be in the format: mm-dd-yyyy
test_cases:
  - input: "03-11-2000"
    expected_output: True
  - input: "15-01-2012"
    expected_output: False
  - input: "04-0-2040"
    expected_output: False
  - input: "06-04-2020"
    expected_output: True
  - input: "06/04/2020"
    expected_output: False
--/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → Bool)
-- inputs
(date: String) :=
-- spec
let dates_valid :=
  match date.split (fun x => x = '-') with
    | [monthStr, dayStr, yearStr] =>
      match (monthStr.toNat?, dayStr.toNat?, yearStr.toNat?) with
      | (some month, some day, some year) =>
        if month < 1 ∨ month > 12 then false else
        match month with
        | 1 | 3 | 5 | 7 | 8 | 10 | 12 => day ≥ 1 ∧ day ≤ 31
        | 4 | 6 | 9 | 11 => day ≥ 1 ∧ day ≤ 30
        | 2 => day ≥ 1 ∧ day ≤ 29
        | _ => false
      | _ => false
    | _ => false;
let spec (result: Bool) :=
  if result then dates_valid else ¬dates_valid
-- program termination
∃ result, impl date = result →
spec result
-- end_def problem_spec


-- start_def implementation_signature
def implementation (date: String) : Bool :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "03-11-2000" = True
-- #test implementation "15-01-2012" = False
-- #test implementation "04-0-2040" = False
-- #test implementation "06-04-2020" = True
-- #test implementation "06/04/2020" = False
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(date: String)
: problem_spec implementation date :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
