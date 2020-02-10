sah(menikah(X,Y)) :- keponakan(X,Y),menikah(X,Y),!,fail.
menikah(wati,andi).
anak_kandung(wati,budi).
saudara_kembar(budi,andi).
saudara_kandung(X,Y) :- saudara_kembar(X,Y).
keponakan(X,Z) :- anak_kandung(X,Y),saudara_kandung(Y,Z).
