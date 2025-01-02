; Conditional Expression and Predicates

; |x|
(define (abs x)
    (cond
        ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

; cond which stands for conditional

; another way 
(define (abs-else x)
    (cond ((< x 0) (- x))
    (else x)))

; another way
; a restricted type of conditional 
; when there are two cases in the case analysis
(define (abs-if x)
    (if (< x 0)
        (- x)
        x))
;test
; (abs (- 4)) ==> 4
; (abs 4) ==> 4
; (abs 0) ==> 0

;(display (abs (- 4)))
;(display (abs 4))
;(display (abs 0))
;(newline)
;(display (abs-if (- 4)))
;(display (abs-if 4))
;(display (abs-if 0))
;(newline)

; `and` `or` are special forms, `not` is an ordinary procedure
; 5 < x < 19
; (and (x > 5) (< x 19))
(define (>= x y)
    (or (> x y) (= x y)))
; or
(define (>= x y)
    (not (< x y)))
