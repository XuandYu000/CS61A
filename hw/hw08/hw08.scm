(define (helper cur num s)
    (if (and (not (null? s)) (= (car s) cur)) (helper cur (+ num 1) (cdr-stream s))
        (list cur num))
)

(define (next s cur)
    (if (null? s) nil
        (if (= (car s) cur) (next (cdr-stream s) cur) s)
    )
)

(define (rle s)
  'YOUR-CODE-HERE
  (if (null? s) nil
    (cons-stream (helper (car s) 0 s) (rle (next s (car s))))
  )
)

(define (helper2 num s res)
    (if (and (not (null? s)) (<= num (car s))) (helper2 (car s) (cdr-stream s) (append res (list (car s))))
        res)
)

(define (next2 s cur)
    (if(null? s) nil
        (if (>= (car s) cur) (next2 (cdr-stream s) (car s)) s)
    )
)

(define (group-by-nondecreasing s)
    (if (null? s) nil
        (cons-stream (helper2 (car s) (cdr-stream s) (list (car s))) (group-by-nondecreasing (next2 s (car s))))
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

