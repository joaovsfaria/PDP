(struct ocorrencia (nome ritual nivel-medo agentes-enviados))

(define lista-ocorrencias
  (list
    (ocorrencia "Caso da Escola" "Invocação" 80 4)
    (ocorrencia "Sussurros no Beco" "Pacto" 30 2)
    (ocorrencia "O Hospital" "Necromancia" 90 5)
    (ocorrencia "Gato Desaparecido" "Nenhum" 10 1)))

(define (soma-medo-recursiva lista)
  (if (null? lista)
      0
      (+ (ocorrencia-nivel-medo (car lista)) 
         (soma-medo-recursiva (cdr lista)))))

(define (analise-final lista)
  (let* ((total-medo (soma-medo-recursiva lista))
         (media (/ total-medo (length lista))))
    (map ocorrencia-nome
         (filter (lambda (o)
                   (and (> (ocorrencia-agentes-enviados o) 3)
                        (> (ocorrencia-nivel-medo o) media)))
                 lista))))