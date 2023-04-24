parent(tryndamere, lux).
parent(tryndamere, jayce).
parent(tryndamere, tristana).
parent(tryndamere, xayah).
parent(ashe, lux).
parent(ashe, jayce).
parent(ashe, tristana).
parent(ashe, xayah).
parent(ezreal, garen).
parent(lux, garen).
parent(jayce, ekko).
parent(sivir, ekko).
parent(tristana, teemo).
parent(tristana, lulu).
parent(rumble, teemo).
parent(rumble, lulu).
parent(xayah, neeko).
parent(xayah, nidalee).
parent(rakan, neeko).
parent(rakan, nidalee).
parent(garen, vi).
parent(katarina, vi).
parent(ekko, zoe).
parent(jinx, zoe).

male(tryndamere).
male(ezreal).
male(sylas).
male(jayce).
male(rumble).
male(rakan).
male(garen).
male(ekko).
male(teemo).
male(darius).

female(ashe).
female(lux).
female(sivir).
female(tristana).
female(xayah).
female(katarina).
female(jinx).
female(lulu).
female(neeko).
female(nidalee).
female(vi).
female(zoe).

married(tryndamere, ashe).
married(ashe, tryndamere).
married(ezreal, lux).
married(lux, ezreal).
married(jayce, sivir).
married(sivir, jayce).
married(tristana, rumble).
married(rumble, tristana).
married(xayah, rakan).
married(rakan, xayah).
married(garen, katarina).
married(katarina, garen).
married(ekko, jinx).
married(jinx, ekko).
married(darius, vi).
married(vi, darius).

divorced(lux, sylas).
divorced(sylas, lux).

employed(tryndamere).
employed(ezreal).
employed(lux).
employed(jayce).
employed(sivir).
employed(xayah).
employed(garen).
employed(ekko).
employed(jinx).
employed(vi).
employed(zoe).

retired(ashe).
retired(sylas).
retired(rakan).
retired(darius).

tall(tryndamere).
tall(jayce).
tall(garen).

short(tristana).
short(rumble).
short(teemo).
short(lulu).

introvert(ashe).
introvert(jayce).
introvert(sivir).
introvert(teemo).
introvert(vi).

extrovert(tryndamere).
extrovert(ezreal).
extrovert(lux).
extrovert(tristana).
extrovert(xayah).
extrovert(rakan).
extrovert(ekko).
extrovert(neeko).
extrovert(zoe).

smart(lux).
smart(sylas).
smart(jayce).
smart(ekko).

religious(ashe).
religious(lux).
religious(garen).
religious(lulu).

kind(ashe).
kind(ezreal).
kind(lux).
kind(jayce).
kind(garen).
kind(vi).

evil(sylas).
evil(darius).

admires(lux, sylas).
admires(ekko, jayce).
admires(jinx, ekko).
admires(vi, ezreal).
admires(zoe, jayce).

dislikes(sylas, lux).
dislikes(sylas, ezreal).
dislikes(ekko, darius).
dislikes(jinx, tristana).

lazy(ezreal).
lazy(ekko).
lazy(jinx).
lazy(lulu).
lazy(neeko).
lazy(darius).
lazy(zoe).

hardworking(tryndamere).
hardworking(lux).
hardworking(sylas).
hardworking(jayce).
hardworking(rumble).
hardworking(garen).
hardworking(katarina).
hardworking(teemo).
hardworking(vi).

rich(tryndamere).
rich(ezreal).
rich(jayce).
rich(tristana).
rich(rakan).
rich(garen).
rich(vi).

poor(sylas).
poor(ekko).
poor(neeko).
poor(nidalee).

popular(ezreal).
popular(jayce).
popular(xayah).
popular(rakan).
popular(garen).
popular(ekko).
popular(vi).

generous(tryndamere).
generous(ashe).
generous(lux).
generous(jayce).
generous(sivir).
generous(rakan).
generous(garen).
generous(neeko).
generous(zoe).

selfish(sylas).
selfish(xayah).
selfish(katarina).
selfish(darius).

husband(X, Y) :- male(X), female(Y), married(X, Y).
wife(X, Y) :- female(X), male(Y), married(X, Y).
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
child(X, Y) :- parent(Y, X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).
grandfather(X, Y) :- father(X, Z), parent(Z, Y).
grandchild(X, Y) :- grandparent(Y, X).
grandson(X, Y) :- grandparent(Y, X), male(X).
granddaughter(X, Y) :- grandparent(Y, X), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).
cousin(X, Y) :- parent(Z, X), parent(T, Y), sibling(Z, T).
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).
niece(X, Y) :- daughter(X, Z), sibling(Y, Z).
nephew(X, Y) :- son(X, Z), sibling(Y, Z).
respected(X) :- kind(X), generous(X), smart(X).
independent(X) :- employed(X), smart(X), hardworking(X).
hated(X) :- selfish(X), evil(X), lazy(X).
successful(X) :- rich(X), employed(X), smart(X), popular(X).
carefree(X) :- poor(X), lazy(X).