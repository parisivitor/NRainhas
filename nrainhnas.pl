%Tabuleiro criado por Vitor Risso Parisi
resolve:-
    nrainhas(N),write('Numero de Rainhas: '), write(N),nl,
    solucao(N,Y),%retorna a lista em Y com as posicoes da rainha em cada linha do tabuleiro
    escreve(Y). %chama a funcao que monta o tabuleiro

nrainhas(X):- 
    write('Digite o numero de rainhas desejado: '),
	read(X).


solucao(N,S) :-
    findall(X, between(1,N,X),L),
    N1 is -(N - 1),
    N2 is (N - 1),1
    findall(Y,between(N1,N2,Y),DS),
    N3 is 2 * N,
    findall(Z, between(2,N3,Z),DI),
    resolve(S, L, L, DS, DI).

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


escreve(Y):-  %recebe a lista em Y com as posicoes da rainha em cada linha do tabuleiro
    write('Soluçao= '),
    write(Y),nl, %printa a lista de solicao na tela
    conta(Y,X),%Conta a quantida de elementos que tem dentro da lista resultante do resolve(Y) e retorna o valor no X
    X1 is X+1,% somo o tamanho da lista com 1 um para corrigir a recursao para escrever a ultima posicao de cada linha
    tabuleiro(X1,Y,1). % tomanhdo da lista+1, lista , inicio(posicao da linha)
	%write('. R . .'),nl,
    %write('. . . R'),nl,
    %write('R . . .'),nl,
    %write('. . R .'),nl.


%conta([1,2,3,4],X). 
conta([],0).  
conta([_|B],X):-conta(B,X1), X is X1 + 1.


%tamanho+1, lista, inicio(posicao de cada elemento da linha)
%tabuleiro(5,[1, 3, 5, 2, 4],1).
tabuleiro(_,[],_):- !.%quando todas as linhas foram preenchida, finaliza o print.
tabuleiro(T,[_|B],T):- nl, I1 is 1, tabuleiro(T,B,I1),!. %finalisa a linha quando o I(posicao de cada elemento da linha) chegar ao tamanho de T,Pula uma linha no print,seta I para 1, Passo para a recursividade, o Tamanhdo da lista, a calda da lista, inicio 
tabuleiro(T,[A|B],A):- write(' R '), I1 is A + 1 , tabuleiro(T,[A|B],I1).%compara I com a cabeça da lista(A) se for verdadeiro, coloca a Rinha na posicao,I+1 para mudar a posicao da linha passa para a recursividade tudo(tamanho, lista inteira, e posicao da linha)
tabuleiro(T,[A|B],I):- I \= A, write(' . '), I1 is I + 1 , tabuleiro(T,[A|B],I1).%compara a cabeca da lista(A) o contatdor I, se for falso, preenche com (.), pois a posicao da rainhao nao é na primeira posica e soma 1 no contador I. passa para a recursividade tudo(tamanho, lista inteira, e posicao da linha(+1)










