; 递归版本
(define (f-rec n)
    (if (< n 3) 
        n
        (+  (f-rec (- n 1)) 
            (* 2 (f-rec (- n 2)))
            (* 3 (f-rec (- n 3))))))


; 迭代版本 需要传入f(0),f(1),f(2)
(define (f-iter n) (f 0 1 2 n))

(define (f a b c count)
        (if (= count 0) 
            a
            (f  b
                c
                (+ (* a 3) (* b 2) c)
                (- count 1))))

                
(display (f-rec 11))
(newline)
(display (f-iter 11))
(exit)