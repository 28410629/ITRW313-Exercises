(deftemplate person (slot name))

(defrule try-dependances
  (exists (person))
=>
  (assert (there-is-a-person-in-the-list)))
