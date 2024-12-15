; 递归写法
(define (fib-rec n)
    (cond   ((= n 0) 0)
            ((= n 1) 1)
            (else  (+   (fib-rec (- n 1))
                        (fib-rec (- n 2))))))

; 迭代写法
(define (fib n)
    (fib-iter 1 0 n))
(define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))

(display (fib-rec 5))
(newline)
(display (fib 5))
(newline)
(exit)