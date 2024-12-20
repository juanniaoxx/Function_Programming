(define (plus a b)
    (if (= a 0) 
        b 
        (inc (plus (dec a) b))))
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(trace plus)
(display (plus 4 5))
(exit)