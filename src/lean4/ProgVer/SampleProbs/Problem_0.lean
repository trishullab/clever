import ProgDefs.SampleProbs.Problem_0

def maxList : List Int → Int := maxListV2

#eval maxList [2, -1, 2, 3, 4, 5]
#test maxList [2, -1, 2, 3, 4, 5] = 5
#eval maxList [-4, -1, -1, -3, -4, -5]
-- NOTE: the ^ above code will return 0, but answer is -1

/-
Specification for checking if the maximum of a list is correct.
Task 2:
(a) What is wrong with the current specification? It accepts an
incorrect implementation of maxList. Write brief answer as a comment below.
(Points: 2)
Answer: The current specification only checks that the returned value is
larger than every list element, not that it belongs to the list.

(b) Give examples of incorrect implementations of maxList that satisfy the
current specification, other than the one given in the code above.
(Points: 2)
Answer: Any implemenetation that always returns the max int value, or one that
returns the max of the list plus one.

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
  simp [maxList, maxListV2]
  simp at h_x_in_list
  rw [h_x_in_list]
  rename_i list'_nonempty
  simp [list'_nonempty] at inductive_hypothesis
  simp at h_x_in_list
  cases h_x_in_list
  rename_i h_eq_list_hd
  simp [maxList, maxListV2]
  rw [h_eq_list_hd]
  simp
  rename_i h_x_in_list'
  simp [h_x_in_list'] at inductive_hypothesis
  simp [maxList, maxListV2]
  simp [maxList] at inductive_hypothesis
  simp [inductive_hypothesis]

/-
Task 3:
(a) Write a correct specification for maxList `maxList_spec_v2`. (Points: 4)
(b) Write a proof that maxList satisfies the specification. (Points: 8)
(c) Justify that your specification is hack proof, in the sense that it
    does not accept an incorrect implementation of maxList? Write your answer
    as a comment below. (Points: 4)
Answer: If the list is nonempty, the maximum of the list is the largest value present in the list.
This means it must be 1. greater than or equal to all other elements, and 2. be an element of the list.
The specification states this exactly, so any implementation that passes it must correctly return the max
of a list.

(d) In general, one might think that specifications are hack proof, and more stronger
    than tests. However, for `maxList_spec_v1`, we have seen that it is not hack proof.
    Suggests ways to write better specifications that cannot be
    hacked by incorrect implementations. Write your answer
    as a comment below. (Points: 4)
Answer: One way could be to add additional properties to the proof that correct implementations should satisfy,
like maxList(list :: maxList(list)+1) = maxList(list)+1. Another way is just manually writing test cases
targeting edge cases, or maybe having an LLM trained to automatically generate adversarial tests (as long
as they are manually verified). But in general, these just add layers of defense and can't formally verify anything.

-/
def maxList2 : List Int → Int := maxListV2
lemma maxList_spec_v2
(list : List Int)
(h_list_nonempty : list ≠ [])
-- Change 0 = 0 to the correct specification
: (∀ x ∈ list, x ≤ maxList list) ∧  (∃ s ∈ list, s = maxList list) := by
  apply And.intro
  exact maxList_spec_v1 list h_list_nonempty
  set s := maxList list
  use s
  apply And.intro
  simp [s]
  induction list
  contradiction
  rename_i list_hd list' inductive_hypothesis
  by_cases list_hd = s
  rename_i h_list_hd_le_s
  simp [h_list_hd_le_s]
  by_cases list' = []
  rename_i h_list'_empty
  simp [h_list'_empty]
  simp [maxList, maxListV2]
  rename_i h_list'_nonempty
  simp [h_list'_nonempty] at inductive_hypothesis
  simp [s] at h_list_hd_le_s
  simp [maxList, maxListV2]
  simp [s]
  left
  simp [maxList, maxListV2]
  rename_i h_hd_new_s
  by_cases list' = []
  rename_i h_list'_empty
  simp [s] at h_hd_new_s
  simp [h_list'_empty] at *
  simp [maxList, maxListV2] at *
  rename_i h_list'_nonempty
  simp [h_list'_nonempty] at inductive_hypothesis
  simp [s] at h_hd_new_s
  simp [maxList, maxListV2]
  right
  set s' := list_hd ⊔ maxListV2 list'
  simp [maxList, maxListV2] at h_hd_new_s
  have h_s_gt_list'_max : maxListV2 list' = list_hd ⊔ maxListV2 list' := by
    simp
    linarith
  simp [s']
  rw [←h_s_gt_list'_max]
  exact inductive_hypothesis
  rfl
