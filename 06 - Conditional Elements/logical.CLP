(deftemplate person (slot name))

(deffacts trythese
  (person (name anyone)))

(defrule try-dependances
  (logical (person (name myself))
           (person (name me))
           (person (name I)))
=>
  (assert (you-are-the-same))
  (printout t "There are depenancies" crlf))
