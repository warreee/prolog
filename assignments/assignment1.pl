father(anton,bart).
father(anton,daan).
father(anton,elisa).
father(fabian,anton).
mother(celine,bart).
mother(celine,daan).
mother(celine,gerda).
mother(gerda,hendrik).

sibling(X,Y) :-
    X \== Y,
    father(F,X),
    father(F,Y),
    mother(M,X),
    mother(M,Y).
    
ancestor(X,Y) :- father(X,Y).  

ancestor(X,Y) :-
    father(Z,Y),
    ancestor(X,Z).
    
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%PEANO%%%%%%%%%%%%%%%%%%%%%%%%%%

    
  
