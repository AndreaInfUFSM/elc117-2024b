idade(diana, 5000).
idade(clark, 22).
paradigmer(diana).
paradigmer(clark).
nacionalidade(clark, krypton).
nacionalidade(diana, themyscira).
altura(diana, 170).
altura(clark, 180).
mae(diana, hippolyta).
planeta(krypton).
inteligente(X) :- paradigmer(X).

% ave(X) :- papagaio(X) ; coruja(X). 
papagaio(zecarioca).
coruja(archimedes).
ave(X) :- papagaio(X).
ave(X) :- coruja(X).

idoso(X) :- idade(X, I), I >= 65.
alto(X) :- altura(X,A), A > 170.
avo(X,Z) :- mae(X,Y), mae(Y,Z). 


soma(A,B,C) :- C is A + B.

raio(chafariz, 5).
raio(piscina, 3).

area(X,A) :- raio(X,R), A is pi*R^2.

