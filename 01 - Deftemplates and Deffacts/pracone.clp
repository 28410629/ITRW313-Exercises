(deftemplate shape "shapes of the objects"
	(slot name)
	(slot is))

(deftemplate location "location of the objects"
    (slot name)
	(slot on))

(deftemplate clearness "when nothing is on top of the objects"
    (slot name)
	(slot clear))

(deffacts shapes 
	(shape (name C) (is pyramid))
	(shape (name A) (is cube))
	(shape (name B) (is cube)))

(deffacts locations
	(location (name C) (on B))
	(location (name A) (on table))
	(location (name B) (on table)))

(deffacts clears
	(clearness (name A) (clear yes))
	(clearness (name C) (clear yes)))
