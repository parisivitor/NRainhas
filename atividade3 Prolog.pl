%Tabuleiro criado por Vitor Risso Parisi
resolve:-
    nrainhas(N),write('Numero de Rainhas: '), write(N),nl,
    solucao(N,Y),
    escreve(Y).

nrainhas(X):- 
    write('Digite o numero de rainhas desejado: '),
	read(X).


solucao(N,S) :-
    findall(X, between(1,N,X),L),
    N1 is -(N - 1),
    N2 is (N - 1),
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


escreve(Y):- 
    write('Soluçao= '),
    write(Y),nl,
    conta(Y,X),
    X1 is X+1,
    tabuleiro(X1,Y,1).
	%write('. R . .'),nl,
    %write('. . . R'),nl,
    %write('R . . .'),nl,
    %write('. . R .'),nl.


%tamanho+1, lista, inicio
%tabuleiro(5,[2,1,4,3],1).
tabuleiro(_,[],_):- !.
tabuleiro(T,[_|B],I):- I = T,nl, I1 is I - T+1, tabuleiro(T,B,I1), !.
tabuleiro(T,[A|B],I):- I = A, write(' R '), I1 is I + 1 , tabuleiro(T,[A|B],I1).
tabuleiro(T,[A|B],I):- I \= A, write(' . '), I1 is I + 1 , tabuleiro(T,[A|B],I1).

%tabuleiro([1,2,3,4]).
tabuleiro1([]).
tabuleiro1([A|B]):- A==1, write('R...'),nl, tabuleiro1(B).
tabuleiro1([A|B]):- A==2, write('.R..'),nl, tabuleiro1(B).
tabuleiro1([A|B]):- A==3, write('..R.'),nl, tabuleiro1(B).
tabuleiro1([A|B]):- A==4, write('...R'),nl, tabuleiro1(B).

%passa dois valores, tamanho e posicao
crialista1(0,[]).
crialista1(T,[_|B]):-  T = 0,nl, T1 is T +5, crialista1(T1,B).
crialista1(T,[A|B]):- A \= T, write(' . '), T1 is T - 1 , crialista1(T1,[A|B]).
crialista1(T,[A|B]):- A = T, write(' R '), T1 is T - 1 , crialista1(T1,[A|B]).

%Tamanho +1 , Posicao, inicial
%desList(6,2,1).
desList(T,_,T):- !.
desList(T,P,I):-I = P, write(' R '),I1 is I + 1, desList(T,P,I1).
desList(T,P,I):-I \= P, write(' . '),I1 is I + 1, desList(T,P,I1).    

%desenha(4).
desenha(0):- !.
desenha(T):-T1 is T -1, write(' . '), desenha(T1). 


%conta([1,2,3,4],X).
conta([],0).
conta([_|B],X):-conta(B,X1), X is X1 + 1.

%n_esimo(X,3,[2,3,1,4]).
n_esimo(1,A, [A|_]).
n_esimo(N,A,[_|B]):- n_esimo(M,A,B), N is M + 1.






