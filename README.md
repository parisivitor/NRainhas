# NRainhas
O programa abaixo resolve o problema da 4-rainhas, conforme explicado em aula:

solucao(S) :-
    resolve(S, [1,2,3,4],
	        [1,2,3,4],
	        [3,2,1,0,-1,-2,-3],
	        [2,3,4,5,6,7,8]).

resolve([], [], _, _, _).
resolve([C|LC], [L|LL], CO, DS, DI) :-
    apaga(C, CO, CO1),
    NS is L - C,
    apaga(NS, DS, DS1),
    NI is L + C,
    apaga(NI, DI, DI1),
    resolve(LC, LL, CO1, DS1, DI1).
    
apaga(A, [A|B], B).
apaga(X, [Y|Z], [Y|Z1]) :-
  	apaga(X, Z, Z1).

% L = [2,4,1,3]
% . R . .
% . . . R
% R . . .
% . . R .

# Exercicio
Modifique o programa para interagir com o usuário, perguntando o número de rainhas e apresentando as soluções na forma de uma tabela onde as casas vazias são representadas com um ponto (.) e as casas com a rainha, com a letra (R) em cada linha da solução, conforme a seguinte sequência:

?- resolve.
Digite o número de rainhas: 
|: 4.

Solucao = [2,4,1,3]
. R . . 
. . . R 
R . . . 
. . R . 

Solucao = [3,1,4,2]
. . R . 
R . . . 
. . . R 
. R . . 
true.
