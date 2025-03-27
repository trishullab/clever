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
8. Some practices while writing specs:
    - For the writing the spec itself, use computable types like `Nat`, `Int`, `Rat`, `List`, `Array`, `String`, `Char`, `Bool`, etc. Do NOT use `Real`, `Complex`, `Set` etc. 
    - It is important to test the correctness of the code and not just verify certain properties of that the final output should satisfy. For example, if the code is supposed to sort a list, then the spec should not just say that the output should be sorted, but rather it should say that the output should be a permutation of the input list and it should be sorted. This will ensure that the code is correct and not just that the output satisfies some property.
    - Make sure to add the preconditions in the spec as well. For example, if the code is supposed to find the average of a list of numbers, then the spec should say that the input list should not be empty. This will allow the spec to accept multiple correct implementations which can handle the edge case of empty list in different ways. In other words, the spec should not be too restrictive and should allow multiple correct implementations. In this case, the spec should even allow the implementation to return an error if the input list is empty. Hence the spec should begin with a precondition i.e. `numbers.length > 0 → ...`. Refer to problem 34, problem 20, problem 19, problem 11, problem 4, etc.
    - Try to make spec distinct from a particular implementation. Ideally, we don't want the spec to mention an implementation because it will make the spec reveal the implementation unless it is the only way reasonable way to go about it. For example, see problem 2, problem 16, and problem 18, problem 23 here there is one simple way of just leaking the implementation (which is just one line) in the spec. However, we don't use anything which is computable in the spec (non-computable set type which cannot be directly used in the computation). We rather rely on using types which don't really convert to a particular implementation.
    - For function signatures which involve `Any` types we should try to narrow down the types or simply ignore the problem spec for those problem if such narrow down is not possible. See problem 22 for an example.
    - Break down the problem spec into smaller parts when necessary. If these parts have some standalone meaning, then they should be defined in `src/lean4/Imports/AllImports.lean`. Make sure to follow the naming conventions and formatting used in that file. There are yaml comments added on top of each definition in `src/lean4/Imports/AllImports.lean` to help in parsing the definitions from the Lean 4 files later for evaluation and generating prompts for the AI evaluators. All such definitions should be wrapped under comment keywords `-- start_def helper_definitions` and `-- end_def helper_definitions`. See `src/lean4/Imports/AllImports.lean` for an example. This will help in reusing the definitions across different problems and also allow us to extract the definitions for evaluation and generating prompts for the AI evaluators.
    - Some problems might need you to account for floating point errors, and you should mention the acceptable range of error in the spec. For example, see problem 32. Sometimes the implementation need to have added some `fuel` to ensure that the implementation terminates (like in problem 32). In such cases, one enhancement could be that spec includes the fuel as an argument and the correctness spec should ensure that the implementation terminates within the fuel limit. However, we are not targeting such enhancements in the first version of the spec.
    - Some problems may have no possible implementation, even though we can write spec for it. For example, see problem 39. In problem 39, it is hard to write an implementation whose termination can be proved. However, we can write a spec for it. In such cases, we should write the spec and not worry about the implementation.
10. While we just want to write specifications for the Lean 4 code, we should try to sometimes come up with the implementation in Lean 4 as well as the proof of correctness. This will help us in understanding the problem better and also in writing the spec correctly. It is important to ensure that spec is written in a way that it can be proved in Lean 4. 
>NOTE: A part from first few problems, we will not be checking-in the Lean 4 implementation and proofs for the problems. However, it is highly encouraged to at least attempt writing the proofs (or partial proofs) to ensure that the spec is meaningful and one can atleast attempt to prove it for some basecases.
11. Sometimes we can use implementations which are loop like. For example, see problem 24. The only caveat is the proofs can be tricky.


Task 2: Correctness Spec with Machine Types
===


Task 3: Correctness Spec with Rust translated to Lean 4
===


Build Instructions
===
- Install Lean 4: https://leanprover.github.io/lean4/doc/quickstart.html
- Run `lake build clever` to build the project after changing the directory to `src/lean4`. OR use VS Code with Lean 4 extension to build the project.

Lean Tutorial
===
- What is Lean: https://lean-lang.org/lean4/doc/whatIsLean.html
- Quick start guide: https://leanprover.github.io/lean4/doc/quickstart.html
- Theorem Proving in Lean: https://lean-lang.org/lean4/doc/tpil.html
- Functional Programming in Lean: https://lean-lang.org/lean4/doc/fplean.html
- Example code in Lean 4: https://lean-lang.org/lean4/doc/examples.html

#### More topics:
- Natural Numbers in Lean: https://leanprover-community.github.io/theories/naturals.html
- Sets and Lists in Lean: https://leanprover-community.github.io/theories/sets.html
- Understanding Lean and Mathlib: https://leanprover-community.github.io/mathematics_in_lean/mathematics_in_lean.pdf
- Mathlib GitHub repository: https://github.com/leanprover-community/mathlib4
- Tactics in Lean and Mathlib:
    - [Basic Tacitcs](https://leanprover-community.github.io/mathlib-manual/html-multi/Tactics/Basic-tactics-___-assumptions/#Mathlib-Manual--Tactics--Basic-tactics-___-assumptions)
    - [Induction](https://leanprover-community.github.io/mathlib-manual/html-multi/Tactics/Induction-___-case-distinction/#Mathlib-Manual--Tactics--Induction-___-case-distinction)
    - [Automation (like simp etc)](https://leanprover-community.github.io/mathlib-manual/html-multi/Tactics/Automation/#Mathlib-Manual--Tactics--Automation)
    - [Logic](https://leanprover-community.github.io/mathlib-manual/html-multi/Tactics/Logic/#Mathlib-Manual--Tactics--Logic)
    - [Equality of Definitions](https://leanprover-community.github.io/mathlib-manual/html-multi/Tactics/Definitional-equality/#Mathlib-Manual--Tactics--Definitional-equality)
    - [All Tactics](https://leanprover-community.github.io/mathlib-manual/html-multi/)

#### Sample Challenge:
- Need to prove theorems/ state definitions in Lean 4 in different `*.lean` files, in the `src/lean4/ProgDefs` and `src/lean4/ProgVer` directory.
- Theorems/definitions are mostly related to programs written in Lean 4 and verification conditions of those programs.
- Each problem has corresponding points and the points are awarded based on the correctness of the solution.
- You just have to submit a PR by removing the comments in each of these files and adding your solution.
- The PR will be automatically graded and the points will be awarded based on the correctness of the solution.
- The winner will be decided based on the total points scored in the PRs.
- In case of a tie, the time of submission will be considered to decide the winner.