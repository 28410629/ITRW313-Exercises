; Coenraad Human 28410629
; sources that helped : https://www.csie.ntu.edu.tw/~sylee/courses/clips/advpattern.htm
; file has been named 'info.dat' and is included in the submit

(deftemplate fruit (slot object) (slot color) (slot type) (slot quantity))

(deffacts table
  (fruit (color red) (type mcintosh) (quantity 100))
  (fruit (color red) (type seedless) (quantity 500))
  )

(defrule test-1
  ?out <- (fruit (object nil) (quantity ?size&~nil&:(> 200 ?size)&:(> ?size 99)))
=>
  (modify ?out (object apple))
  (open "info.dat" myfile "a")
  (printout myfile "Computer found: Apple" crlf)
  (close myfile))

(defrule test-2
  ?out <- (fruit (object nil) (type ?recorded&~mcintosh))
=>
  (printout t "This type is not a computer: " ?recorded crlf)
  (retract ?out))
  

