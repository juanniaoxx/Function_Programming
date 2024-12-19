(define x 5)

(display x)
(newline)
(display (+ (let ((x 3))
                (+ x (* x 10)))))
(newline)
(display x)
(exit)
