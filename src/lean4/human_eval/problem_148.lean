import Imports.AllImports

-- start_def problem_details
/--
function_signature: "def bf(planet1: str, planet2: str) -> List[str]"
docstring: |
    There are eight planets in our solar system: the closest to the Sun
    is Mercury, the next one is Venus, then Earth, Mars, Jupiter, Saturn,
    Uranus, Neptune.
    Write a function that takes two planet names as strings planet1 and planet2.
    The function should return a tuple containing all planets whose orbits are
    located between the orbit of planet1 and the orbit of planet2, sorted by
    the proximity to the sun.
    The function should return an empty tuple if planet1 or planet2
    are not correct planet names.
test_cases:
  - input: ("Jupiter", "Neptune")
    expected_output: ("Saturn", "Uranus")
  - input: ("Earth", "Mercury")
    expected_output: ("Venus")
  - input: ("Mercury", "Uranus")
    expected_output: ("Venus", "Earth", "Mars", "Jupiter", "Saturn")
-/
-- end_def problem_details

-- start_def problem_spec
def problem_spec
-- function signature
(impl: String → String → List String)
-- inputs
(planet1: String)
(planet2: String) :=
-- spec
let spec (result: List String) :=
let planets := ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"];
if planet1 ∉ planets ∨ planet2 ∉ planets then
  result = []
else
  let index1 := planets.indexOf planet1;
  let index2 := planets.indexOf planet2;
  let minIdx := if index1 < index2 then index1 else index2;
  let maxIdx := if index1 < index2 then index2 else index1;
  (∀ str ∈ result, str ∈ planets) ∧
  (∀ planet ∈ planets, planet ∈ result ↔
    planets.indexOf planet < maxIdx ∧
    minIdx < planets.indexOf planet) ∧
  result.Sorted (fun a b => planets.indexOf a < planets.indexOf b)
-- program termination
∃ result, impl planet1 planet2 = result ∧
-- return value satisfies spec
spec result
-- end_def problem_spec

-- start_def generated_spec
def generated_spec
-- function signature
(impl: String → String → List String)
-- inputs
(planet1: String)
(planet2: String) : Prop :=
-- end_def generated_spec
--start_def generated_spec_body
sorry
--end_def generated_spec_body

-- start_def spec_isomorphism
theorem spec_isomorphism:
∀ impl,
(∀ planet1 planet2, problem_spec impl planet1 planet2) ↔
(∀ planet1 planet2, generated_spec impl planet1 planet2) :=
-- end_def spec_isomorphism
-- start_def spec_isomorphism_proof
sorry
-- end_def spec_isomorphism_proof

-- start_def implementation_signature
def implementation (planet1: String) (planet2: String) : List String :=
-- end_def implementation_signature
-- start_def implementation
sorry
-- end_def implementation

-- Uncomment the following test cases after implementing the function
-- start_def test_cases
-- #test implementation "Jupiter" "Neptune" = ["Saturn", "Uranus"]
-- #test implementation "Earth" "Mercury" = ["Venus"]
-- #test implementation "Mercury" "Uranus" = ["Venus", "Earth", "Mars", "Jupiter", "Saturn"]
-- end_def test_cases


-- start_def correctness_definition
theorem correctness
(planet1: String)
(planet2: String)
: problem_spec implementation planet1 planet2 :=
-- end_def correctness_definition
-- start_def correctness_proof
sorry
-- end_def correctness_proof
