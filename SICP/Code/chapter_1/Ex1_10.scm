; Ackermann's function
(define (A x y)
    (cond   ((= y 0) 0)
            ((= x 0) (* 2 y))
            ((= y 1) 2)
            (else   (A  (- x 1) 
                        (A x (- y 1))))))

; (trace A)
; (display (A 1 10))
; (newline)
; (trace A)
; (display (A 2 4))
; (newline)
; (trace A)
; (display (A 3 3))
; (newline)

(define (h n) (A 2 n))
(display (h 1))
(newline)
(display (h 2))
(newline)
(display (h 3))
(newline)
(display (h 6))

(exit)