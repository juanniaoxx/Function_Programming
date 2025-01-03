; Square_Roots by Ne Newton's Method
; for square
(load "./square.scm")
; for abs
(load "./Conditional_Expression.scm")
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                    x)))

; new_guess = (old_guess + old_guess/x)/2
(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; test
; (sqrt 4) ==> 2
(display (sqrt 4))
(newline)
;(exit)