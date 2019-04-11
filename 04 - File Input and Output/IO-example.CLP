(deftemplate person (slot name)(slot surname))

(defrule readname
=>
  (printout t "Enter your name: ")
  (bind ?response (read))
  (open "people.dat" thePerson "w")
  (printout thePerson "Name: " ?response crlf)
  (close thePerson))
