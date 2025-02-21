import Imports.AllImports

-- Problem statement
-- Find maximum of a list of integers


def maxListV1 : List Int → Int
| [] => 0
| x::xs => max x (maxListV1 xs)

/--
Task 1: Find the bug in the current implementation of maxListV1
and write a new implementation maxListV2 that will be correct.
(Points: 4)
-/
def maxListV2 : List Int → Int
| [] => 0
| [x] => x
| x::xs => max x (maxListV2 xs)

#eval maxListV2 [3, 1, 4, 1, 5, 9, 2]
#eval maxListV2 []
#eval maxListV2 [-10, -5, -2]
