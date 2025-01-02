; Compound Procedures
; multiply it by itself 

; using lambda 
(lambda(x) (* x x))

; giving the procedure a name
(define square(lambda(x)(* x x)))
; ==> undef
; test 
; (square 2) ==> 4
; (square 4) ==> 16
;(display "lambda:")
;(display (square 2))
;(newline)
;(display "lambda:")
;(display (square 4))
;(newline)
; using Syntactic Sugar
(define (square x) (* x x))
; <==> (define square(lambda(x)(* x x)))
; ==> undef
;(display "define:")
;(display (square 2))
;(newline)
;(display "define:")
;(display (square 4))
;(newline)

; using square as a building block in defining other procedures
(define (sum-of-square x y)
    (+ (square x) (square y)))

; test (sum-fo square 2 4)
; ==> 2^2 + 4^2 = 20
;(display "sum-fo-square:")
;(display (sum-of-square 2 4))
;(newline)

