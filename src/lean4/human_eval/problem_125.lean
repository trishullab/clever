import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def split_words(txt: str) -> Union[List[str], int]"
docstring: |
    Given a string of words, return a list of words split on whitespace, if no whitespaces exists in the text you
    should split on commas ',' if no commas exists you should return the number of lower-case letters with odd order in the
    alphabet, ord('a') = 0, ord('b') = 1, ... ord('z') = 25
test_cases:
  - input: "Hello world!"
    expected_output: ["Hello", "world!"]
  - input: "Hello,world!"
    expected_output: ["Hello", "world!"]
  - input: "abcdef"
    expected_output: 3
-/
-- end_def problem_details
-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → List String ⊕ Int)
-- inputs
(txt: String) :=
-- spec
let spec (result: List String ⊕ Int) :=
match result with
| Sum.inl lst =>
  (txt.toList.any (fun x => x = ' ') ∨ txt.toList.any (fun x => x = ',')) ∧
  if txt.toList.any (fun x => x = ' ') then
    ∃ left right : String,
      left ++ " " ++ right = txt ∧
      left = lst[0]! ∧
      impl right = Sum.inl (lst.drop 1)
  else
    ∃ left right : String,
      left ++ "," ++ right = txt ∧
      left = lst[0]! ∧
      impl right = Sum.inl (lst.drop 1)
| Sum.inr count =>
  ¬ (txt.toList.any (fun x => x = ' ') ∨ txt.toList.any (fun x => x = ',')) ∧
  (txt = "" → count = 0) ∧
  (txt ≠ "" →
    let letter := txt.get ⟨0⟩;
    let order := letter.toNat - 'a'.toNat;
    if letter.isLower ∧ Odd order then
      Sum.inr (count - 1) = impl (txt.drop 1)
    else
      Sum.inr (count) = impl (txt.drop 1))
-- program termination)

∃ result, impl txt = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → List String ⊕ Int)
-- inputs
(lst: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ txt, problem_spec impl txt) ↔
(∀ txt, generated_spec impl txt) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (txt: String) : List String ⊕ Int :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- start_def test_cases
-- #test implementation "Hello world!" = Sum.inl ["Hello", "world!"]
-- #test implementation "Hello,world!" = Sum.inl ["Hello", "world!"]
-- #test implementation "abcdef" = Sum.inr 3
-- end_def test_cases

-- start_def correctness_definition
theorem correctness
(txt: String)
: problem_spec implementation txt :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
