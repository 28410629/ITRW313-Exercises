(deftemplate person (slot name)(slot surname))

(defrule readname
=>
    (printout t "Enter your name: ")
    (bind ?response (readline))
    (assert (person (name ?response))))

(defrule addsurname
    ?out <- (person (name ?getname)(surname nil))
=>
    (printout t "Enter the surname for " ?getname " : ")
    (bind ?response (readline))
    (printout t crlf)
    (open "people.dat" thePerson "a")
    (printout thePerson "Name: " ?getname " " ?response crlf)
    (close thePerson)
    (retract ?out))
    
