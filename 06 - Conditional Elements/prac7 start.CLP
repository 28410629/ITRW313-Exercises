(deftemplate student (multislot name) (slot student_no) (slot course))

(deffacts filter
  (student (name Monkey Giraffe Animal) (student_no 123456))
  (student (name Bear Banimal) (student_no 234567))
  (student (name Camel Giraffe Canimal) (student_no 345678))
  (student (name Deer Camel Danimal) (student_no 456789)))

