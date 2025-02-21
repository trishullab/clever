import ProgDefs.SampleProbs.Problem_0

def maxList : List Int → Int := maxListV1

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
: maxListV2 list ∈ list ∧
  ∀ x ∈ list,
  x ≤ maxList2 list := by
  constructor
  -- maxList list ∈ list
  induction list
  contradiction

  rename_i list_head list_tail inductive_hypothesis
  by_cases list_tail = []
  rename_i list_tail_empty
  simp [list_tail_empty]
  simp [maxList2, maxListV2]

  rename_i list_tail_nonempty
  simp [list_tail_nonempty] at inductive_hypothesis
  simp [maxList2, maxListV2]
  by_cases maxList2 (list_head :: list_tail) = list_head
  rename_i x
  simp [maxList2, maxListV2] at x
  left
  exact x

  rename_i x
  simp [maxList2, maxListV2] at x
  right
  rw [max_eq_right_of_lt]
  exact inductive_hypothesis
  exact x

  -- x ≤ maxList2 list
  intro x h_x_in_list
  induction list
  contradiction
  rename_i list_hd list' inductive_hypothesis
  by_cases list' = []
  rename_i h_list'_empty
  rw [h_list'_empty] at h_x_in_list
  simp [h_list'_empty]
  simp [maxList2, maxListV2]
  simp at h_x_in_list
  rw [h_x_in_list]
  rename_i list'_nonempty
  simp [list'_nonempty] at inductive_hypothesis
  simp at h_x_in_list
  cases h_x_in_list
  rename_i h_eq_list_hd
  simp [maxList2, maxListV2]
  rw [h_eq_list_hd]
  simp
  rename_i h_x_in_list'
  simp [h_x_in_list'] at inductive_hypothesis
  simp [maxList2, maxListV2]
  simp [maxList2] at inductive_hypothesis
  simp [inductive_hypothesis]
