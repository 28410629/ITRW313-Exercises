;input number from keyboard
(defrule read-from-user
=>
(printout t "Please enter a number: " crlf)
(assert (input (read))))

;test if input number is between 10 and 20
;bind number to variable ?num
;test if ?num > 10 AND
;if ?num < 20
(defrule test-input-number
 (input ?num)
 (test (and (> ?num 10)	
            (< ?num 20))) 
=>
(printout t "Both the predicate functions are true." crlf)) 
 
 