Guidelines for writing human eval specifications for Lean 4.

Task 1: Correctness Spec with Ideal Types
===
0. Use case:
    - We want these spec to test the functionality of the Lean 4 code.
    - We don't really care about the language specific data types or language specific arithmetic operations (which might lead to overflow, underflow, etc).
    - The purpose to ensure that the code is correct and the logic is sound, then spec should ensure that the code generated is provably correct beyond just the test cases.
1. Each problem should be defined in a separate file like `src/lean4/human_eval/problem_{n}.lean`. Each file imports `import Imports.AllImports`. Make sure to follow the naming conventions and formatting used in that file. See `src/lean4/human_eval/problem_0.lean` for an example.
2. First add `import Imports.AllImports` at the top of the file.
3. Copy the meta-data about the problem from the `src/human_eval_python/{n}.py` file to the `lean4/human_eval/problem_{n}.lean` file. This must include the problem statement, input/output types, constraints, etc. It should be formatted as a comment at the top of the file after the `import` statements. This comment should be yaml formatted. See `src/lean4/human_eval/problem_0.lean` for an example. The comment should be wrapped under comment keywords `-- start_def problem_details` and `-- end_def problem_details`. All this will help in parsing the problem details from the Lean 4 files later for evaluation and generating prompts for the AI evaluators.
4. Problem specifications must be written between the keywords `-- start_def problem_spec` and `-- end_def problem_spec`. See `src/lean4/human_eval/problem_0.lean` for an example.
5. The implementation should be specified something like:
```lean
-- start_def implementation_signature
def implementation (numbers: List Rat) (threshold: Rat) : Bool :=
-- end_def implementation_signature
```
6. The correctness spec should be written as a lemma. It should be written between the keywords `-- start_def correctness_spec` and `-- end_def correctness_spec`. See `src/lean4/human_eval/problem_0.lean` for an example. Something like:
```lean
-- start_def correctness_definition
theorem correctness
(numbers: List Rat)
(threshold: Rat)
: problem_spec implementation numbers threshold  :=
-- end_def correctness_definition
```
7. We don't check-in any implementation or proofs for the problems. However, encouraged to write some implementation and proofs (or partial proofs) to ensure that the spec is meaningful and can be proved. We will provide some initial implementation and proofs for the first few problems in order to understand the difficulty of the problems and the kind of proofs that are needed. It is encouraged to figure out which problems will have the easiest proof and implementation and which will be the hardest. This will help us in designing the AI solutions for the problems.
8. For the writing the spec itself, use computable types like `Nat`, `Int`, `Rat`, `List`, `Array`, `String`, `Char`, `Bool`, etc. Do NOT use `Real`, `Complex`, `Set` etc. Try to make spec distinct from a particular implementation. Ideally, we don't want the spec to mention an implementation because it will make the spec reveal the implementation unless it is the only way reasonable way to go about it. For example, see problem 2, problem 18, and problem 16, here there is one simple way of just leaking the implementation (which is just one line) in the spec. However, we don't use anything which is computable in the spec (non-computable set type which cannot be directly used in the computation). We rather rely on using types which don't really convert to a particular implementation.
9. Break down the problem spec into smaller parts when necessary. If these parts have some standalone meaning, then they should be defined in `src/lean4/Imports/AllImports.lean`. Make sure to follow the naming conventions and formatting used in that file. There are yaml comments added on top of each definition in `src/lean4/Imports/AllImports.lean` to help in parsing the definitions from the Lean 4 files later for evaluation and generating prompts for the AI evaluators. All such definitions should be wrapped under comment keywords `-- start_def helper_definitions` and `-- end_def helper_definitions`. See `src/lean4/Imports/AllImports.lean` for an example. This will help in reusing the definitions across different problems and also allow us to extract the definitions for evaluation and generating prompts for the AI evaluators.
10. While we just want to write specifications for the Lean 4 code, we should try to sometimes come up with the implementation in Lean 4 as well, along with the proof of correctness. This will help us in understanding the problem better and also in writing the spec correctly. It is important to ensure that spec is written in a way that it can be proved in Lean 4. NOTE: A part from first few problems, we will not be checking-in the Lean 4 implementation and proofs for the problems. However, highly encourage to write the proofs (or partial proofs) to ensure that the spec is meaningful and can be proved.


Task 2: Correctness Spec with Machine Types
===


Task 3: Correctness Spec with Rust translated to Lean 4
===