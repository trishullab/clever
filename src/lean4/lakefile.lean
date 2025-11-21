import Lake
open Lake DSL

package «clever» where
  -- add package configuration options here
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]
require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "v4.24.0"

@[default_target]
lean_lib «clever» where
  globs := #[.submodules `Imports, .submodules `human_eval, .submodules `sample_examples]
