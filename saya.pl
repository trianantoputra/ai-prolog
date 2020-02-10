% I married a widow (let's call her W) who had a grown-up daughter (call
% her D). My father (F), who visited us quite often, fell in love with my
% step-daughter and married her. Hence, my father became my son-in-law
% and my step-daughter became my mother. Some months later, my wife gave
% birth to a son (S1), who become the brother-in-law of my father, as
% well as my uncle. This wife of my father, that is, my step-daughter,
% also had a son (S2).

% menikah(suami,istri).
menikah(i,w).
menikah(f,d).

% ortu_asli(ayah/ibu, anak).
ortu_asli(f,i).
ortu_asli(w,d).
ortu_asli(w,s1).
ortu_asli(i,s1).
ortu_asli(d,s2).
ortu_asli(f,s2).

ayah_tiri(X,Y) :-  menikah(X,Z),ortu_asli(Z,Y), \+ortu_asli(X,Y).
ibu_tiri(X,Y) :- menikah(Z,X), ortu_asli(Z,Y), \+ortu_asli(X,Y).
ortu_tiri(X,Y) :- ayah_tiri(X,Y).
ortu_tiri(X,Y) :- ibu_tiri(X,Y).

ortu(X,Y) :- ortu_tiri(X,Y).
ortu(X,Y) :- ortu_asli(X,Y).

istri(X,Y) :- menikah(Y,X).
suami(X,Y) :- menikah(X,Y).

eyang(X,Y) :-
    ortu(X,Z),
    ortu(Z,Y).

saudara(X,Y) :-
    ortu(Z,X),
    ortu(Z,Y),
    X \= Y.

menantu(f,i).
% ibu_tiri(d,i).







