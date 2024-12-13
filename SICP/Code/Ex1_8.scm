; 用给定公式计算立方根
(define (sqrt guess)
        (cube-iter 1.0 x))

; 绝对值函数
(define (abs x)
    (if (< x 0) 
        (- x)
        x ))

; 计算二次方
(define (square x) (* x x))

; 迭代函数
(define (cube-iter guess x)
        (if (good-enough? guess x)
            guess
            (cube-iter (improve guess x) x)))

; 改进猜测值
(define (improve guess x)
        (/  (+  (* 2 guess) 
                (/ x (square guess))
            ) 3))


; 迭代终止条件
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (cube x)
        (cube-iter 1.0 x))

(display (cube 8))
(exit)