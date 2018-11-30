male(alec).
male(brandon).
male(dean).
male(ernie).
male(eddie).
male(christian).
male(ben).

female(cristina2).
female(cristina1).
female(carolyn).
female(monette).
female(nicole).

parent(cristina2,alec).
parent(dean,alec).
parent(cristina2,brandon).
parent(dean,brandon).
parent(cristina1,cristina2).
parent(christian,cristina2).
parent(carolyn,dean).
parent(eddie,dean).
parent(cristina1,monette).
parent(christian,monette).
parent(cristina1,ernie).
parent(christian,ernie).
parent(carolyn,nicole).
parent(eddie,nicole).
parent(nicole,ben).

%Rules
mother(X,Y):-female(X),parent(X,Y).
father(X,Y):-male(X),parent(X,Y).
grandparent(X,Y):-parent(Z,Y),parent(X,Z).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
descendent(X,Y):-parent(Y,X).
descendent(X,Y):-parent(Y,Z),descendent(X,Z).
grandfather(X,Y):-parent(X,Z),parent(Z,Y),male(X).
grandmother(X,Y):-parent(X,Z),parent(Z,Y),female(X).
child(X,Y):-parent(Y,X).
siblings(X,Y):-parent(Z,Y),parent(Z,X),not(X=Y).
brother(X,Y):-siblings(X,Y),male(X).
sister(X,Y):-siblings(X,Y),female(X).
aunt(X,Y):-female(X),parent(Z,Y),siblings(X,Z).
uncle(X,Y):-male(X),parent(Z,Y),siblings(X,Z).
firstcousins(X,Y):-child(X,Z),siblings(Z,Q),child(Y,Q).

%Sample Queries
%setof(A,siblings(A,cristina2),L).
%setof(A,firstcousins(A,alec),L).
%setof(X, aunt(X, alec),A),setof(Y, uncle(Y,alec),U),append(A,U,L).
%setof(A,siblings(A,alec),L).
%setof(A,parent(cristina1,A),L).
%setof(A,ancestor(A,alec),L).
%setof(A,descendent(A,eddie),L).
