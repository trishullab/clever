import ProgDefs.SampleProbs.Problem_1

/--
Task 5: This is a HARD task.
You can skip this task if you want.
You need to finish the Task 4(a) and Task 4(b)
in the file `ProfDefs/Problem_1.lean` before attempting
this task.
(Points: 25)
NOTE: you may have to define several
auxiliary lemmas to prove this theorem
and apply them in the proof.
-/
theorem findIndexIsSameAsBinarySearch :
∀ (xs: List Int) (y: Int),
findIndex xs y = binarySearch (insertionSort xs) y := by
sorry
