(deftemplate number (slot num)(multislot factors))

(defrule readnum
=>
    (printout t "Enter a number: ")
    (bind ?response (read))
    (assert (number (num ?response))))

(defrule multi-num
    ?out <- (number (num ?x)(factors))
=>
    (modify ?out (factors (* ?x 2) (* ?x 3) (* ?x 4) (* ?x 5))))

(defrule check-num
    (number (num ?x)(factors ?f2 ?f3 ?f4 ?f5))
    (test (not (integerp ?x)))
=>
    (open "answers.dat" file "a")
    (printout file (format nil "Number: %-3.1f Factors: %-3.1f %-3.1f %-3.1f %-3.1f" ?x ?f2 ?f3 ?f4 ?f5) crlf)
    (close file))
    
