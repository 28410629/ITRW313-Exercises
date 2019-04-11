(deftemplate student (multislot name) (slot student_no) (slot course))

(deffacts filter
  (student (name Monkey Giraffe Animal) (student_no 123456))
  (student (name Bear Banimal) (student_no 234567))
  (student (name Camel Giraffe Canimal) (student_no 345678))
  (student (name Deer Camel Danimal) (student_no 456789)))

(defrule all-subject
  (exists (module Experts) (student (name $?) (student_no ?num) (course ?)))
  ?out <- (student (name $?) (student_no ?num) (course ?)) 
=>
  (modify ?out (course ITRW313)))

(defrule all-categorised
  (forall (student (student_no ?nr))
          (student (student_no ?nr) (course ITRW313)))
=>
	(printout t "All students are updated." crlf))

; CLIPS> (load "prac7-1.CLP")
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
; CLIPS> (facts)
; f-1     (student (name Monkey Giraffe Animal) (student_no 123456) (course nil))
; f-2     (student (name Bear Banimal) (student_no 234567) (course nil))
; f-3     (student (name Camel Giraffe Canimal) (student_no 345678) (course nil))
; f-4     (student (name Deer Camel Danimal) (student_no 456789) (course nil))
; f-5     (module Experts)
; For a total of 5 facts.
; CLIPS> (run)

; All students are updated.
; CLIPS> (facts)
; f-1     (student (name Monkey Giraffe Animal) (student_no 123456) (course ITRW313))
; f-2     (student (name Bear Banimal) (student_no 234567) (course ITRW313))
; f-3     (student (name Camel Giraffe Canimal) (student_no 345678) (course ITRW313))
; f-4     (student (name Deer Camel Danimal) (student_no 456789) (course ITRW313))
; f-5     (module Experts)
; For a total of 5 facts.
; CLIPS> 