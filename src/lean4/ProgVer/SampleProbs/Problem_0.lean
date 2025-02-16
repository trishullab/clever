import ProgDefs.SampleProbs.Problem_0

def maxList : List Int → Int := maxListV1

#eval maxList [2, -1, 2, 3, 4, 5]
#test maxList [2, -1, 2, 3, 4, 5] = 5
#eval maxList [-4, -1, -1, -3, -4, -5]
-- NOTE: the ^ above code will return 0, but answer is -1

/--
Specification for checking if the maximum of a list is correct.
Task 2:
(a) What is wrong with the current specification? It accepts an
incorrect implementation of maxList. Write brief answer as a comment below.
(Points: 2)
Answer:

(b) Give examples of incorrect implementations of maxList that satisfy the
current specification, other than the one given in the code above.
(Points: 2)
Answer:

-/
lemma maxList_spec_v1
(list : List Int)
(h_list_nonempty : list ≠ [])
: ∀ x ∈ list,
  x ≤ maxList list := by
  intro x h_x_in_list
  induction list
  contradiction
  rename_i list_hd list' inductive_hypothesis
  by_cases list' = []
  rename_i h_list'_empty
  rw [h_list'_empty] at h_x_in_list
  simp [h_list'_empty]
  simp [maxList, maxListV1]
  simp at h_x_in_list
  rw [h_x_in_list]
  simp
  rename_i list'_nonempty
  simp [list'_nonempty] at inductive_hypothesis
  simp at h_x_in_list
  cases h_x_in_list
  rename_i h_eq_list_hd
  simp [maxList, maxListV1]
  rw [h_eq_list_hd]
  simp
  rename_i h_x_in_list'
  simp [h_x_in_list'] at inductive_hypothesis
  simp [maxList, maxListV1]
  simp [maxList] at inductive_hypothesis
  simp [inductive_hypothesis]

/--
Task 3:
(a) Write a correct specification for maxList `maxList_spec_v2`. (Points: 4)
(b) Write a proof that maxList satisfies the specification. (Points: 8)
(c) Justify that your specification is hack proof, in the sense that it
    does not accept an incorrect implementation of maxList? Write your answer
    as a comment below. (Points: 4)
Answer:

(d) In general, one might think that specifications are hack proof, and more stronger
    than tests. However, for `maxList_spec_v1`, we have seen that it is not hack proof.
    Suggests ways to write better specifications that cannot be
    hacked by incorrect implementations. Write your answer
    as a comment below. (Points: 4)
Answer:

-/
lemma maxList_spec_v2
(list : List Int)
(h_list_nonempty : list ≠ [])
-- Change 0 = 0 to the correct specification
: 0 = 0 := by
sorry
