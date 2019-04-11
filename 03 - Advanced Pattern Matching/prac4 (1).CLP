; 28410629 - Coenraad Human

(deftemplate book
  (slot name)
  (slot author)
  (slot code))

(deffacts current-lib
  (book
    (name "Alice in Wonderland")
    (author Lewis-Carroll)
    (code CAR))
  (book
    (name "The Bourne Supremacy")
    (author Robert-Ludlum)
    (code LUD)))

(defrule readnew
=>
  (printout t "Enter the name of the book:")
  (bind ?name (readline))
  (assert (potential ?name)))

(defrule add-book
  ?out <- (potential ?newbook)
  (and (potential ?newbook)
       (not (book
              (name ?newbook)
              (author ?)
              (code ?))))
=>
  (printout t "Book is new, please enter the author name:" crlf)
  (bind ?ath (readline))
  (printout t "Book is new, please enter the code:" crlf)
  (bind ?cde (readline))
  (assert (book (name ?newbook) (author ?ath) (code ?cde)))
  (retract ?out))

(defrule remove-potential
  ?t <- (potential ?)
=>
  (retract ?t))
