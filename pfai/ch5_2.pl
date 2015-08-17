max(X,Y,Max) :-
    X >= Y,!,Max=X
    ;
    Max = Y.
    
p(1).
p(2) :- !.
p(3).

h(X,Y) :- p(X),!,p(Y).

