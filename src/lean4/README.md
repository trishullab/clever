# Introduction to Lean 4
- What is Lean: https://lean-lang.org/lean4/doc/whatIsLean.html
- Quick start guide: https://leanprover.github.io/lean4/doc/quickstart.html
- Theorem Proving in Lean: https://lean-lang.org/lean4/doc/tpil.html
- Functional Programming in Lean: https://lean-lang.org/lean4/doc/fplean.html
- Example code in Lean 4: https://lean-lang.org/lean4/doc/examples.html

# More topics:
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

# The Challenge:
- Need to prove theorems/ state definitions in Lean 4 in different `*.lean` files, in the `src/lean4` directory.
- Theorems/definitions are mostly related to programs written in Lean 4 and verification conditions of those programs.
- Each problem has corresponding points and the points are awarded based on the correctness of the solution.
- You just have to submit a PR by removing the comments in each of these files and adding your solution.
- The PR will be automatically graded and the points will be awarded based on the correctness of the solution.
- The winner will be decided based on the total points scored in the PRs.
- In case of a tie, the time of submission will be considered to decide the winner.

## Instructions for building the project:
- Install Lean 4: https://leanprover.github.io/lean4/doc/quickstart.html
- Run `lake build clever` to build the project after changing the directory to `src/lean4`. OR use VS Code with Lean 4 extension to build the project.
