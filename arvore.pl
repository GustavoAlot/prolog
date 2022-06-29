pai(renato,gustavo).
pai(alvino,renato).
pai(alvino,richardo).
pai(catalino,flavia).
pai(catalino,arturo).
pai(catalino,leonardo).
pai(richardo,thamires).
pai(richardo,thaissa).
pai(arturo,isabela).
pai(arturo,nicolas).
pai(vido,alvino).
pai(luiz,ivete).
pai(joao,alice).
pai(julio,catalino).


mae(flavia,gustavo).
mae(alice,flavia).
mae(alice,arturo).
mae(alice,leonardo).
mae(ivete,renato).
mae(ivete,richardo).
mae(ivanessa,nicolas).
mae(ivanessa,isabela).
mae(geralda,alice).
mae(consuela,catalino).
mae(lucia,alvino).
mae(enalva,ivete).


antecessor(X,Y) :- pai(X,Y).
antecessor(X,Y) :- mae(X,Y).
antecessor(X,Y) :- mae(X,Z), antecessor(Z,Y).
antecessor(X,Y) :- pai(X,Z), antecessor(Z,Y).


avo_paterno(X,Y) :- pai(X,Z),pai(Z,Y).
avo_materno(X,Y) :- pai(X,Z),mae(Z,Y).

avó_paterno(X,Y) :- mae(X,Z),pai(Z,Y).
avó_materna(X,Y) :- mae(X,Z),mae(Z,Y).


irmao(X,Y) :- pai(Z,X),pai(Z,Y), X \= Y.

       
primo(X,Y) :- pai(Z,X), pai(W,Y), irmao(Z,W).
primo(X,Y) :- mae(Z,X), mae(W,Y), irmao(Z,W).
primo(X,Y) :- pai(Z,X), mae(W,Y), irmao(Z,W).
primo(X,Y) :- mae(Z,X), pai(W,Y), irmao(Z,W).


neto(X,Y) :- pai(Y,Z), pai(Z,X).
neto(X,Y) :- pai(Y,Z), mae(Z,X).
neto(X,Y) :- mae(Y,Z), mae(Z,X).
neto(X,Y) :- mae(Y,Z), pai(Z,X).


tio(X,Y) :- irmao(X,Z), pai(Z,Y).
tio(X,Y) :- irmao(X,Z), mae(Z,Y).
