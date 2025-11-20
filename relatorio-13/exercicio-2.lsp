(struct criatura (nome ambiente periculosidade vida-media))

(define catalogo
  (list
    (criatura "Peeper" "Safe Shallows" "Baixa" 5)
    (criatura "Reaper Leviathan" "Dunes" "Alta" 100)
    (criatura "Crabsquid" "Deep" "Media" 20)
    (criatura "Ghost Leviathan" "Deep" "Alta" 200)))

(define (filtra-por-perigo lista)
  (filter (lambda (c) (not (string=? (criatura-periculosidade c) "Baixa"))) lista))

(define (relatorio-profundidade lista)
  (map (lambda (c) 
         (string-append "[" (criatura-nome c) "]: Vive em [" (criatura-ambiente c) "]"))
       (filter (lambda (c) (string=? (criatura-ambiente c) "Deep")) lista)))