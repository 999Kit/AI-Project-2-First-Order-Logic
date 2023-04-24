%/* FACTS */
male(prince_phillip).
male(prince_charles).
male(caption_mark_phillips).
male(timothy_laurence).
male(prince_andrew).
male(prince_edward).
male(prince_william).
male(prince_harry).
male(peter_phillips).
male(mike_tindall).
male(james_viscount_severn).
male(prince_george).

female(queen_elizabeth_ii).
female(princess_diana).
female(princess_anne).
female(camilla_parker_bowles).
female(sarah_ferguson).
female(sophie_rhys_jones).
female(kate_middleton).
female(autumn_kelly).
female(zara_phillips).
female(princess_beatrice).
female(princess_eugenie).
female(lady_louise_mountbattern_windsor).
female(savannah_phillips).
female(isla_phillips).
female(mia_grace_tindall).

mar1(prince_phillip, queen_elizabeth_ii).
mar1(prince_charles, camilla_parker_bowles).
mar1(sophie_rhys_jones, prince_edward).
mar1(prince_william, kate_middleton).
mar1(autumn_kelly, peter_phillips).
mar1(zara_phillips, mike_tindall).

mar2(X, Y) :- mar1(X, Y).
married(X, Y) :- marhelper(X, Y, [X]) ; marhelper(Y, X, [Y]).

marhelper(X, Y, Flag) :- mar2(X, Y), \+ member(Y, Flag).
marhelper(X, Y, Flag) :- mar2(X, Z), \+ member(Z, Flag), marhelper(Z, Y, [Z | Flag]).


div1(princess_diana, prince_charles).
div1(caption_mark_phillips, princess_anne).
div1(sarah_ferguson, prince_andrew).

div2(X, Y) :- div1(X, Y).
divorced(X, Y) :- divhelper(X, Y, [X]) ; divhelper(Y, X, [Y]).

divhelper(X, Y, Flag) :- div2(X, Y), \+ member(Y, Flag).
divhelper(X, Y, Flag) :- div2(X, Z), \+ member(Z, Flag), divhelper(Z, Y, [Z | Flag]).

parent(prince_phillip, prince_charles).
parent(queen_elizabeth_ii, prince_charles).
parent(prince_phillip, princess_anne).
parent(queen_elizabeth_ii, princess_anne).
parent(prince_phillip, prince_andrew).
parent(queen_elizabeth_ii, prince_andrew).
parent(prince_phillip, prince_edward).
parent(queen_elizabeth_ii, prince_edward).

parent(prince_charles, prince_william).
parent(princess_diana, prince_william).
parent(prince_charles, prince_harry).
parent(princess_diana, prince_harry).

parent(captain_mark_phillips, peter_phillips).
parent(princess_anne, peter_phillips).
parent(captain_mark_phillips, zara_phillips).
parent(princess_anne, zara_phillips).

parent(prince_andrew, princess_beatrice).
parent(sarah_ferguson, princess_beatrice).
parent(prince_andrew, princess_eugenie).
parent(sarah_ferguson, princess_eugenie).

parent(sophie_rhys_jones, james_viscount_severn).
parent(prince_edward, james_viscount_severn).
parent(sophie_rhys_jones, lady_louise_mountbattern_windsor-windsor).
parent(prince_edward, lady_louise_mountbattern_windsor-windsor).

parent(prince_william, prince_george).
parent(prince_william, princess_charlotte).
parent(kate_middleton, prince_george).
parent(kate_middleton, princess_charlotte).

parent(autumn_kelly, savannah_phillips).
parent(peter_phillips, savannah_phillips).
parent(autumn_kelly, isla_phillips).
parent(peter_phillips, isla_phillips).

parent(zara_phillips, mia_grace_tindall).
parent(mike_tindall, mia_grace_tindall).


%/* RULES */
husband(X, Y) :- male(X), female(Y), married(X, Y). 
wife(X, Y) :- female(X), male(Y), married(X, Y).
father(X, Y) :- male(X), parent(X, Y). 
mother(X, Y) :- female(X), parent(X, Y). 
child(X, Y) :- parent(Y,X).
son(X, Y) :-  male(X), parent(Y, X). 
daughter(X, Y) :- female(X), parent(Y, X). 

grandparent(X, Y) :- parent(X, T), parent(T, Y). 
grandmother(X, Y) :- grandparent(X, Y), female(X). 
grandfather(X, Y) :- grandparent(X, Y), male(X). 
grandchild(X, Y) :- grandparent(Y, X).
grandson(X, Y) :- grandchild(X, Y), male(X).
granddaughter(X, Y) :- grandchild(X, Y), female(X).

sibling(X, Y) :- parent(T, X), parent(T, Y), \+(X = Y).
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).
aunt(X, Y) :- sister(X, T), parent(T, Y).
uncle(X, Y) :- brother(X, T), parent(T, Y).
niece(X, Y) :- daughter(X, T), sibling(Y, T).
nephew(X, Y) :- son(X, T), sibling(Y, T).