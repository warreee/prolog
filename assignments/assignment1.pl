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

peano_plus(zero,X,X).
peano_plus(s(X),Y,s(Z)) :- peano_plus(X,Y,Z).    
  
peano_min(X,zero,X).
peano_min(X,s(Y),Z) :- peano_min(X,Y,s(Z)).

peano_min2(X,Y,Z) :-
    peano_plus(Z,Y,X).
    
greater_than(s(_),zero).

greater_than(s(X),s(Y)) :-
    greater_than(X,Y). 
    
maximum(X,zero,X).
maximum(X,Y,Z) :-
    greater_than(X,Y),
    maximum(X,zero,Z).
maximum(X,Y,Z) :-
    greater_than(Y,X),
    peano_plus(zero,Y,Z).

peano_div(X,Y,zero,X) :- greater_than(Y,X).
peano_div(X,Y,D,R) :-
    mult(Y,D,Z1),
    greater_than(X,Z1),      
    peano_plus(Z1,R,X).

mult(X,Y,Z) :- mult(X,Y,Z,zero).

mult(zero,_,Z,Z).

mult(s(X),Y,Z,A) :-
    peano_plus(Y,A,R),
    mult(X,Y,Z,R).
    
    



