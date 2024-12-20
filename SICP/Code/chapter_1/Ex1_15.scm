(define (cube x) (* x x x)) ; x^3

(define (p x) (- (* 3 x) (* 4 (cube x)0))) ; 3x - 4x^3

(define (sin angle)
    (if (not (> angle 0.1))
        angle
        (p (sin (/ angle 3.0)))))


(trace p)
(display (sin 12.15))
(exit)