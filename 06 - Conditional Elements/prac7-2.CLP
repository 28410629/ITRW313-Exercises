(deftemplate student (multislot name) (slot student_no) (slot course))

(deffacts filter
  (student (name Monkey Giraffe Animal) (student_no 123456))
  (student (name Bear Banimal) (student_no 234567))
  (student (name Camel Giraffe Canimal) (student_no 345678))
  (student (name Deer Camel Danimal) (student_no 456789)))

(defrule all-subject
  (logical (module Experts) (student (name $?) (student_no ?num) (course ?)))
  ?out <- (student (name $?name) (student_no ?num) (course ?)) 
=>
  (modify ?out (course ITRW313)))

(defrule all-categorised
  (forall (student (student_no ?nr))
          (student (student_no ?nr) (course ITRW313)))
=>
	(printout t "All students are updated." crlf))


; CLIPS> (clear)
; CLIPS> (load "prac7-2.CLP")
; %$**
; TRUE
; CLIPS> (reset)
; CLIPS> (facts)
; f-1     (student (name Monkey Giraffe Animal) (student_no 123456) (course nil))
; f-2     (student (name Bear Banimal) (student_no 234567) (course nil))
; f-3     (student (name Camel Giraffe Canimal) (student_no 345678) (course nil))
; f-4     (student (name Deer Camel Danimal) (student_no 456789) (course nil))
; For a total of 4 facts.
; CLIPS> (assert (module Experts))
; <Fact-5>
; CLIPS> (run)
; All students are updated.
; CLIPS> (facts)
; f-5     (module Experts)
; For a total of 1 fact.
; CLIPS> 

; "Explain why all of the students except one is removed from the fact list. 
; Type your answer as a comment in the .clp file and save it as prac7-2.clp." 

; As can be seen from the output from my code, it does not replicate the same situation
; as described within the question. Within my scenario logical retracts the modification 
; which is each student with the course ITRW313 due to the fact not satisfying logical's
; conditions anymore and being the result of logical's 'then' part. Forall is executed 
; because its condition is satisfied due to the group students being 0 and 0 facts are matched.
