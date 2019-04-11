(deftemplate point (multislot x) (multislot y))

(defrule distance-calculation
	(point (x ?x1 ?x2) (y ?y1 ?y2))
	=>
	(assert (AB (sqrt (+ (** (- ?x2 ?x1) 2) (** (- ?y2 ?y1) 2))))))

(deffacts points
	(point (x 5 10) (y 5 8)))
