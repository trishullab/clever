import Lake
open Lake DSL

package «clever» where
  -- add package configuration options here
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]
require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "v4.15.0"

@[default_target]
lean_lib «clever» where
  globs := #[.submodules `Imports, .submodules `ProgDefs, .submodules `ProgVer]

lean_lib «clever_with_solutions» where
  globs := #[.submodules `ProgDefs]
