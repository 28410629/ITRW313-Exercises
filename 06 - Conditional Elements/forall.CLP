(deftemplate is-animal (slot name) (slot sub-group))
(deftemplate is-mammal (slot animal) (slot group))

(deffacts all-animals
	(is-animal (name red-fox) (sub-group canine))
	(is-animal (name lion))
	(is-animal (name dolphin) (sub-group cetacean))
	(is-animal (name kudu) (sub-group antelope)))

(defrule is-redfox-mm
	(is-animal (name ?name) (sub-group canine))
	=>
	(assert (is-mammal (animal ?name) (group mammal))))

(defrule is-lion-mm
	(is-animal (name lion) (sub-group carnivore))
	=>
	(assert (is-mammal (animal lion) (group mammal))))

(defrule is-dolphin-mm
	(is-animal (name ?name) (sub-group cetacean))
	=>
	(assert (is-mammal (animal ?name) (group mammal))))

(defrule is-kudu-mm
	(is-animal (name ?name) (sub-group antelope))
	=>
	(assert (is-mammal (animal ?name) (group mammal))))

(defrule all-categorised
        (forall (is-mammal (animal red-fox) (group ?mammal))
		(is-mammal (animal lion) (group ?mammal))
		(is-mammal (animal dolphin) (group ?mammal))
		(is-mammal (animal kudu) (group ?mammal)))
=>
	(printout t "All animals categorised." crlf))