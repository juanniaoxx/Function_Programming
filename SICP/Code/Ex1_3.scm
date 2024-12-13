; 返回三个数中较大两个数的平方和
(define (square x) (* x x)) ; 平方和
; version 1 简单的决策树模型
(define (sum_of_three x y z) 
        (if (> x y)
            (if (> y z) 
                (+ (square x) (square y)) ; x,y较大
                (+ (square x) (square z)) ; x,z较大
            )
            (if (> x z)
                (+ (square x) (square y)) ; y,x较大
                (+ (square y) (square z)) ; y,z较大
            )
        ))

; version 封装过程
(define (bigger x y)
    (if (> x y)
        x
        y))

(define (smaller x y)
    (if (< x y)
        x
        y))

(define (bigger-sum-of-squares x y z)
    (sum-of-squares (bigger x y)                    ; bigger
                    (bigger (smaller x y) z)))      ; another bigger

(exit)