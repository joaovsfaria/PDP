(define (calcula-dosagem peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (else 50)))

(define (ajusta-preco preco-base nome-da-erva)
  (cond
    ((string=? nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string=? nome-da-erva "Lótus") (* preco-base 1.5))
    (else preco-base)))

(define preco-final
  (ajusta-preco 10 "Lótus"))