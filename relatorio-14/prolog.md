# Relatório: Lógica (Prolog)

## Código Fonte (Base de Dados + Regras)

```prolog
% -----------------------------------------------------------------------
% FATOS ORIGINAIS
% -----------------------------------------------------------------------

% Fatos: Progenitores (pai_ou_mae, filho)
progenitor(urano, cronos).
progenitor(gaia, cronos).
progenitor(urano, oceano).
progenitor(gaia, oceano).
progenitor(cronos, zeus).
progenitor(reia, zeus).
progenitor(cronos, poseidon).
progenitor(reia, poseidon).
progenitor(zeus, atena).
progenitor(zeus, apolo).
progenitor(hera, apolo).
progenitor(zeus, artemis).
progenitor(letó, artemis).
progenitor(zeus, ares).
progenitor(hera, ares).
progenitor(zeus, hefesto).
progenitor(hera, hefesto).
progenitor(poseidon, tritao).
progenitor(zeus, perseu).
progenitor(dânae, perseu).
progenitor(atena, erictônio).

% Fatos: Poderes e Domínios
dominio(zeus, ceu).
dominio(zeus, trovão).
dominio(poseidon, mar).
dominio(poseidon, terremoto).
dominio(hades, submundo).
dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).
dominio(ares, guerra_brutal).
dominio(apolo, sol).
dominio(apolo, musica).
dominio(artemis, caça).
dominio(artemis, lua).
dominio(hefesto, fogo).
dominio(hefesto, forja).
dominio(afrodite, beleza).
dominio(afrodite, amor).
dominio(cronos, tempo).

% Fatos: Armas e Artefatos (deus, arma)
arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

% Fatos: Características e Títulos (deus, caracteristica)
caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

% Fatos: Relações de Aliança
aliado(zeus, poseidon).
aliado(poseidon, zeus).
aliado(atena, apolo).
aliado(apolo, atena).
aliado(ares, hades).
aliado(hades, ares).
aliado(hefesto, atena).
aliado(atena, hefesto).

% Fatos: Localização ou Assinatura
local_principal(zeus, olimpo).
local_principal(poseidon, atlântida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).

% -----------------------------------------------------------------------
% EXERCÍCIO 1: DIVINDADE OLÍMPICA
% -----------------------------------------------------------------------
% 1. Inclusão dos fatos sobre Hades (filho de Cronos e Reia)
progenitor(cronos, hades).
progenitor(reia, hades).

% 2. Regra divindade_olimpica(Deus)
% Verdadeira SE:
% - O Deus for filho de Cronos E
% - Tiver domínio 'ceu' OU 'mar' OU 'submundo'.
divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),
    (dominio(Deus, ceu); dominio(Deus, mar); dominio(Deus, submundo)).

% -----------------------------------------------------------------------
% EXERCÍCIO 2: DEUS MAIOR
% -----------------------------------------------------------------------
% Regra deus_maior(Deus)
% Verdadeira SE:
% - O Deus tiver pelo menos dois domínios (D1 e D2 diferentes) E
% - Habitar o 'olimpo'.
deus_maior(Deus) :-
    local_principal(Deus, olimpo),
    dominio(Deus, D1),
    dominio(Deus, D2),
    D1 \= D2.

% -----------------------------------------------------------------------
% EXERCÍCIO 3: IRMÃOS DE SANGUE
% -----------------------------------------------------------------------
% Regra irmaos_germanos(A, B)
% Verdadeira SE:
% - A e B tiverem o mesmo pai E a mesma mãe.
% - A \= B garante que ninguém seja irmão de si mesmo.
irmaos_germanos(A, B) :-
    progenitor(Pai, A), progenitor(Pai, B),
    progenitor(Mae, A), progenitor(Mae, B),
    Pai \= Mae,      % Garante que pai e mãe são entidades diferentes
    A \= B.          % Garante que A não é B

% -----------------------------------------------------------------------
% EXERCÍCIO 4: ANCESTRALIDADE
% -----------------------------------------------------------------------
% Regra Recursiva ancestral(A, D)
% Define a cadeia de descendência.

% Caso Base: A é ancestral de D se A for progenitor direto de D.
ancestral(A, D) :-
    progenitor(A, D).

% Passo Recursivo: A é ancestral de D se A for progenitor de Z
% e Z for ancestral de D.
ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).