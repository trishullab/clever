import Imports.AllImports

def fibonacci : Nat → Nat
| 0 => 0
| 1 => 1
| n + 2 => fibonacci n + fibonacci (n + 1)


def fibonacci' (n : Nat)  :=
Id.run do
  if n = 0 then
    return 0
  else if n = 1 then
    return 1
  else
    let fib1 := fibonacci' (n - 1);
    let fib2 := fibonacci' (n - 2);
    return fib1 + fib2
termination_by n
decreasing_by
  rename_i h_n_neq_0 h_n_neq_1
  simp
  induction n
  contradiction
  simp
  rename_i h_n_neq_0 h_n_neq_1
  simp
  induction n
  contradiction
  simp
