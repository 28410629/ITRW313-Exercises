(deftemplate book (slot name) (slot author) (slot code))

(deffacts current-lib
  (book (name "Alice in Wonderland") (author Lewis-Carroll) (code CAR))
  (book (name "The Bourne Supremacy") (author Robert-Ludlum) (code LUD)))

