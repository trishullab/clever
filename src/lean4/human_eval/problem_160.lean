import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def do_algebra(operator: List String, operand: List Nat) -> Int"
docstring: |
    Given two lists operator, and operand. The first list has basic algebra operations, and
    the second list is a list of integers. Use the two given lists to build the algebric
    expression and return the evaluation of this expression.

    The basic algebra operations:
    Addition ( + )
    Subtraction ( - )
    Multiplication ( * )
    Floor division ( // )
    Exponentiation ( ** )

    Note:
        The length of operator list is equal to the length of operand list minus one.
        Operand is a list of of non-negative integers.
        Operator list has at least one operator, and operand list has at least two operands.
test_cases:
  - input: [['+', '*', '-'], [2, 3, 4, 5]]
    expected_output: 9
-/
-- end_def problem_details

-- /-- The five supported operators. -/
inductive Op where
  | add     -- `+`
  | sub     -- `-`
  | mul     -- `*`
  | floordiv-- `//`
  | exp     -- `**`
deriving Repr, DecidableEq

instance : Inhabited Op where
  default := Op.add

/-- Convert from the string symbols to our `Op`. -/
def Op.ofString : String → Option Op
  | "+"  => some .add
  | "-"  => some .sub
  | "*"  => some .mul
  | "//" => some .floordiv
  | "**" => some .exp
  | _    => none

/-- Precedences: +,- = 1; *,// = 2; ** = 3. -/
def Op.prec : Op → Nat
  | .add | .sub      => 1
  | .mul | .floordiv => 2
  | .exp             => 3

/-- Associativity: all left-assoc except exponentiation. -/
def Op.leftAssoc : Op → Bool
  | .exp => false
  | _    => true

/-- Integer exponentiation (exponent must be ≥ 0). -/
partial def intPow (x : Int) : Nat → Int
  | 0     => 1
  | n + 1 => x * intPow x n

/-- Apply an `Op` to two operands. -/
def Op.apply : Op → Int → Int → Int
  | .add,      x, y => x + y
  | .sub,      x, y => x - y
  | .mul,      x, y => x * y
  | .floordiv, x, y => x / y
  | .exp,      x, y =>
    if y < 0 then panic! "negative exponent"
    else       intPow x y.toNat

/-- A token is either a literal integer or an operator. -/
inductive Token where
  | num : Int → Token
  | op  : Op  → Token
deriving Repr

open Token

/-- Interleave the two input lists into a flat token stream. -/
def buildTokens (ops : List Op) (xs : List Int) : List Token :=
  let rec go (ops : List Op) (rem : List Int) : List Token :=
    match ops, rem with
    | [], [n]       => [num n]
    | o :: ops', n :: m :: rem' =>
        num n :: op o :: go ops' (m::rem')
    | _, _ => panic! "buildTokens: operator/operand length mismatch"
  go ops xs

/-- Shunting-yard: convert infix tokens into RPN. -/
def toRPN (tokens : List Token) : List Token :=
  let rec loop
    (inps : List Token)
    (opSt : List Op)
    (out  : List Token) : List Token :=
  match inps with
  | []      =>
    -- flush remaining ops
    opSt.foldl (fun acc o => acc ++ [op o]) out
  | t::ts   =>
    match t with
    | num _ => loop ts opSt (out ++ [t])
    | op o   =>
      -- pop while top-of-stack has higher prec, or equal+left-assoc
      let rec pop
        (stk : List Op)
        (acc : List Token)
        : (List Op × List Token) :=
      match stk with
      | o' :: stk' =>
        if o'.prec > o.prec ∨ (o'.prec == o.prec ∧ o.leftAssoc) then
          pop stk' (acc ++ [op o'])
        else
          (stk, acc)
      | [] => ([], acc)
      let (stk', out') := pop opSt out
      loop ts (o::stk') out'
  loop tokens [] []

/-- check a list of RPN token is equal to result -/
def evalRPN (rpn : List Token) (result : Int) : Bool :=
  let rec evalLoop (rpn : List Token) (result : Int) : Bool :=
    match rpn with
    | [num n] => (result = n)
    | (op o)::(num x)::(num y)::rest => evalRPN rest (result - o.apply x y)
    | _ => panic! "evalRPN: malformed expression"
  evalLoop rpn result

/-- Main entry: given a list of operator‐strings (e.g. `["+","*","-"]`) and
    a list of nonnegative `Int`s, evaluate the expression. -/
def doAlgebra (opsStr : List String) (xs : List Int) (result : Int) : Bool :=
  -- parse operators, error on invalid symbol
  let ops : List Op :=
    opsStr.map fun s =>
      match Op.ofString s with
      | some o => o
      | none   => panic! "unknown operator"
  let toks := buildTokens ops xs
  evalRPN (toRPN toks) result

-- start_def problem_spec
def problem_spec
-- function signature
(impl: List String → List Nat → Int)
-- inputs
(operator : List String)
(operand : List Nat) :=
-- spec
let spec (result: Int) :=
operator.length = operand.length - 1 ∧ 1 < operator.length →
doAlgebra operator operand result
-- program terminates
∃ result, impl operator operand = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: List String → List Nat → Int)
-- inputs
(operator : List String)
(operand : List Nat) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ operator operand, problem_spec impl operator operand) ↔
(∀ operator operand, generated_spec impl operator operand) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (operator: List String) (operand : List Nat) : Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation ['+', '*', '-'] [2,3,4,5] = 9
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(operator : List String) (operand : List Nat)
: problem_spec implementation operator operand :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
