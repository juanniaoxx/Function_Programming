(define (new-if predicate then-clause else-clause)
        (cond   (predicate then-clause)
                (else else-clause)))

(if #t (display "good") (display "bad"))
(newline)
(new-if #t (display "good") (display "bad"))
(exit)