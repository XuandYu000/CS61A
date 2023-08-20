(define (split-at lst n)
  'YOUR-CODE-HERE
  (define (helper head tail left)
	(if (null? tail) (cons head nil)
	(if (= left 0) (cons head tail)
		(helper (append head (list(car tail))) (cdr tail) (- left 1))
	))
  )
  (helper nil lst n)
)


(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons (eq? (eval expr) (car case)) (cdr case)))
    			cases))
)

