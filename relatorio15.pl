% =================================================================================
% FATOS (BASE DE DADOS)
% =================================================================================

% Disciplinas (nome, créditos, area)
disciplina(programacao1, 6, fundamental).
disciplina(calculo1, 8, matematica).
disciplina(estrutura_dados, 6, computacao).
disciplina(algoritmos, 4, computacao).
disciplina(banco_dados, 6, aplicacoes).
disciplina(redes, 4, aplicacoes).
disciplina(inteligencia_artificial, 8, computacao).
disciplina(compiladores, 6, computacao).
disciplina(teoria_grafos, 4, matematica).
disciplina(estatistica, 6, matematica).
disciplina(sistemas_operacionais, 6, computacao).
disciplina(projeto_integrador, 10, aplicacoes).

% Pré-Requisitos (disciplina_principal, pre_requisito)
% Leitura: Para fazer 'disciplina_principal', preciso ter feito 'pre_requisito'
prerequisito(estrutura_dados, programacao1).
prerequisito(algoritmos, estrutura_dados).
prerequisito(banco_dados, programacao1).
prerequisito(inteligencia_artificial, algoritmos).
prerequisito(inteligencia_artificial, calculo1).
prerequisito(compiladores, algoritmos).
prerequisito(compiladores, estrutura_dados).
prerequisito(sistemas_operacionais, estrutura_dados).
prerequisito(teoria_grafos, calculo1).
prerequisito(estatistica, calculo1).
prerequisito(projeto_integrador, banco_dados).
prerequisito(projeto_integrador, sistemas_operacionais).

% Conhecimento de Alunos (aluno, disciplina_concluida)
concluiu(maria, programacao1).
concluiu(maria, calculo1).
concluiu(joao, programacao1).
concluiu(joao, estrutura_dados).
concluiu(joao, calculo1).
concluiu(ana, programacao1).
concluiu(ana, redes).
concluiu(ana, teoria_grafos).
concluiu(pedro, calculo1).
concluiu(pedro, estatistica).
concluiu(pedro, teoria_grafos).
concluiu(lucas, estrutura_dados).
concluiu(lucas, algoritmos).
concluiu(lucas, redes). 
concluiu(lucas, banco_dados).

% =================================================================================
% EXERCÍCIO 1: Disciplinas de Alto Valor
% =================================================================================

% Regra: Disciplina tem mais de 5 créditos E é pré-requisito para pelo menos 2 outras.
alto_impacto(D) :-
    disciplina(D, Creditos, _),
    Creditos > 5,
    prerequisito(A, D),
    prerequisito(B, D),
    A \= B.

% Query solicitada no exercício 1 (para rodar no console):
% Encontrar disciplina de matematica, com 4 creditos e que não é pré-requisito de ninguém.
% ?- disciplina(D, 4, matematica), \+ prerequisito(_, D).


% =================================================================================
% EXERCÍCIO 2: Aluno Apto
% =================================================================================

% Regra Auxiliar: Verdadeira se a Disciplina é pré-requisito de algo e o aluno não fez.
falta_concluir(Aluno, Disciplina) :-
    prerequisito(_, Disciplina),
    \+ concluiu(Aluno, Disciplina).

% Regra Principal: Apto se não é 'fundamental' E concluiu TODOS os pré-requisitos.
% A lógica "concluiu todos" é feita com dupla negação: 
% "Não existe nenhum pré-requisito P de D tal que o aluno NÃO tenha concluído P".
aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, _, Area),
    Area \= fundamental,
    \+ concluiu(Aluno, Disciplina), % (Opcional: verifica se ele já não fez a matéria)
    \+ (prerequisito(Disciplina, P), \+ concluiu(Aluno, P)).

% Querys solicitadas no exercício 2:
% ?- aluno_apto(joao, D).
% ?- aluno_apto(maria, inteligencia_artificial).


% =================================================================================
% EXERCÍCIO 3: Especialização vs. Dependência
% =================================================================================

% Regra: Concluiu pelo menos duas disciplinas de 'computacao'.
especialista_comp(Aluno) :-
    concluiu(Aluno, D1),
    disciplina(D1, _, computacao),
    concluiu(Aluno, D2),
    disciplina(D2, _, computacao),
    D1 \= D2.

% Regra: Não concluiu nenhuma disciplina de 'matematica'.
% Verifica se o aluno existe primeiro, depois nega que exista uma matéria de mat que ele fez.
deficiencia_mat(Aluno) :-
    concluiu(Aluno, _), % Garante que Aluno é alguém válido no banco
    \+ (concluiu(Aluno, D), disciplina(D, _, matematica)).

% Query solicitada no exercício 3:
% ?- especialista_comp(Aluno), deficiencia_mat(Aluno).


% =================================================================================
% EXERCÍCIO 4: Disciplina Raiz e Folha
% =================================================================================

% Regra: Não tem nenhum pré-requisito (pode cursar direto).
% Ou seja, não existe P tal que prerequisito(D, P).
disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ prerequisito(D, _).

% Regra: Não é pré-requisito para nenhuma outra.
% Ou seja, não existe Outra tal que prerequisito(Outra, D).
disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

% Query solicitada no exercício 4:
% ?- disciplina_raiz(D), disciplina(D, _, Area), Area \= aplicacoes.
