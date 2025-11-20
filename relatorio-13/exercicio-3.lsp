(struct item (nome tipo preco forca-magica))

(define estoque
  (list
    (item "Katana Amaldiçoada" "Arma" 1000 85)
    (item "Adaga Simples" "Arma" 200 30)
    (item "Poção de Cura" "Pocao" 50 10)
    (item "Amuleto Antigo" "Artefato" 500 90)))

(define (adiciona-imposto preco)
  (* preco 1.15))

(define (bonus-maldicao forca)
  (if (> forca 80) (* forca 1.5) forca))

(define (processa-venda catalogo)
  (let ((armas (filter (lambda (i) (string=? (item-tipo i) "Arma")) catalogo)))
    (map (lambda (i)
           (list (item-nome i)
                 (bonus-maldicao (item-forca-magica i))
                 (adiciona-imposto (item-preco i))))
         armas)))