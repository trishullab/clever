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
Answer: The specification doesn't require that the
number maxList returns is actually a part of List.

(b) Give examples of incorrect implementations of maxList that satisfy the
current specification, other than the one given in the code above.
(Points: 2)
Answer:
maxListIncorrect (list : List Int) := maxListV1 + 100
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
The given specification is almost correct, but this one
will reject implementations that do not return an element of the list.
(d) In general, one might think that specifications are hack proof, and more stronger
    than tests. However, for `maxList_spec_v1`, we have seen that it is not hack proof.
    Suggests ways to write better specifications that cannot be
    hacked by incorrect implementations. Write your answer
    as a comment below. (Points: 4)
Answer:

-/
lemma maxList_spec_v2
 (list : List Int)
(h_list_nonempty : list ≠ []) :
 ((maxListV2 list) ∈ list) ∧ (∀ x ∈ list, x <= (maxListV2 list))
:= by
intros
apply And.intro
case right =>
  intro x h_x_in
  induction list
  contradiction
  rename_i head tail ih
  cases tail
  unfold maxListV2
  simp at h_x_in
  simp [h_x_in]
  rename_i head2 tail
  simp at ih
  cases hxin : h_x_in; simp at hxin
  unfold maxListV2
  simp
  rename_i hxinreal
  cases hxinreal
  simp at ih
  unfold maxListV2
  simp [ih]
  rename_i ih_help
  have ihhh : x ∈ tail := ih_help
  simp [ihhh] at ih
  unfold maxListV2
  simp [ih]
case left =>
  induction list
  contradiction
  rename_i head tail ih
  cases tail
  unfold maxListV2
  simp
  rename_i head2 tail
  simp at ih
  cases ih
  rename_i ih
  unfold maxListV2
  simp [ih]
  cases hi : (Int.le_total head2 head)
  rename_i hii
  apply Or.inl
  assumption
  apply Or.inr
  apply Or.inl
  rename_i hii
  assumption
  rename_i ih
  simp [ih]
  cases hi : (Int.le_total head (maxListV2 (head2 :: tail)))
  rename_i hii
  apply Or.inr
  unfold maxListV2
  simp [hii]
  simp [Or.inr, ih]
  rename_i hii
  simp [maxListV2, hii]
