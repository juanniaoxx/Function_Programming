(define (factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))

(define (factorial_iter n)
    (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter  (* counter product)
                    (+ counter 1)
                    max-count)))


(display (factorial 5))
(newline)
(display (factorial_iter 5))
(exit)