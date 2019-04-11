(deftemplate student (multislot name) (slot student_no))

(deffacts filter
  (student (name Monkey Giraffe Animal) (student_no 123456))
  (student (name Bear Banimal) (student_no 234567))
  (student (name Camel Giraffe Canimal) (student_no 345678))
  (student (name Deer Camel Danimal) (student_no 456789)))

(defrule readnew "inputs potential new student details"
=>
  (printout t "Enter the student number:")
  (bind ?s_no (read))
  (assert (potential ?s_no)))

(defrule add-student "determine if student already exists otherwise add"
  ?out <- (potential ?newnumber)
  (and (potential ?newnumber)
       (not (student (name $?) (student_no ?s_no&?newnumber))))
=>
  (printout t "Number is new, please enter the first name:" crlf)
  (bind ?first (read))
  (printout t "Please enter the middle name:" crlf)
  (bind ?second (read))
  (printout t "Please enter the surname:" crlf)
  (bind ?last (read))
  (assert (student (name ?first ?second ?last) (student_no ?newnumber)))
  (retract ?out))