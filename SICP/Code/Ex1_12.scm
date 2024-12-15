(define (sum x y)
    (cond   
        ((= y 0) 1) ; 左边恒定为1
        ((= x y) 1) ; 右边恒定为1
        ((or (< x y) (< x 0)) 0) ; 不存在三角形内的数
        (else (+ (sum (- x 1) (- y 1))
                (sum (- x 1) y)))))

(display (sum 10 5))
(exit)
