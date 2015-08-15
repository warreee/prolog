member(X,[X|Tail]).

member(X,[Head|Tail]) :-
    member(X,Tail).
    
member1(X, L) :-
    conc(_,[X|_],L).
    
conc([],L,L).
    
conc([X|L1],L2,[X|L3]) :-
    conc(L1,L2,L3).
