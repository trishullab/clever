Guidelines for writing human eval specifications for Lean 4.

Task 1: Correctness Spec with Ideal Types
===
0. Use case:
    - We want these spec to test the functionality of the Lean 4 code.
    - We don't really care about the language specific data types or language specific arithmetic operations (which might lead to overflow, underflow, etc).
    - The purpose to ensure that the code is correct and the logic is sound, then spec should ensure that the code generated is provably correct beyond just the test cases.
1. Use computable types like `Nat`, `Int`, `Rat`, `List`, `Array`, `String`, `Char`, `Bool`, etc. Do NOT use `Real`, `Complex`, `Set` etc.
2. Break down the problem spec into smaller parts when necessary. These parts if have some standalone meaning, then they should be defined in `lean4/Imports/AllImports.lean`. Make sure to follow the naming conventions and formatting used in that file.
3. Each problem should be defined in a separate file like `lean4/human_eval/problem_{n}.lean`. Each file imports `import Imports.AllImports`. Make sure to follow the naming conventions and formatting used in that file. See `lean4/human_eval/problem_0.lean` for an example.
4. While we just want to write specifications for the Lean 4 code, we should try to sometimes come up with the implementation in Lean 4 as well, along with the proof of correctness. This will help us in understanding the problem better and also in writing the spec correctly. It is important to ensure that spec is written in a way that it can be proved in Lean 4. NOTE: A part from first few problems, we will not be checking-in the Lean 4 implementation and proofs for the problems. However, highly encourage to write the proofs (or partial proofs) to ensure that the spec is meaningful and can be proved.


Task 2: Correctness Spec with Machine Types
===


Task 3: Correctness Spec with Rust translated to Lean 4
===