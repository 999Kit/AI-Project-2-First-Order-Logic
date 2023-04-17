/* FACTS */
male(prince_phillip).
male(prince_charles).
male(caption_mark_phillips).
male(timothy_laurence).
male(prince_andrew).
male(prince_edward).
male(prince_william).

female(queen_elizabeth_ii).
female(princess_diana).
female(princess_anne).
female(camilla_parker_bowles).
female(sarah_ferguson).
female(sophie_rhys-jones).

married(prince_phillip, queen_elizabeth_ii).
married(prince_charles, camilla_parker_bowles).

divored(princess_diana, prince_charles).

parent(prince_phillip, prince_charles).
parent(queen_elizabeth_ii, prince_charles).

parent(prince_phillip, princess_anne).
parent(queen_elizabeth_ii, princess_anne).

parent(prince_charles, prince_william).
parent(princess_diana, prince_william).

/* RULES */
husband(X, Y) :- male(X), married(X, Y).
wife(X, Y) :- female(X), married(X, Y).
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
child(X, Y) :- parent(Y, X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandchild(X, Y) :- grandparent(Y, X).