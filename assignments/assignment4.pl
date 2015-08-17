%%%%%%%%%%%%%%%%%%%%% N-queens %%%%%%%%%%%%%%%%%%%%%%%%

queens(N,L) :-
    numlist(1,N,NL),
    permutation(L,NL),
    diagonal(L).

diagonal([]).    
    
diagonal([H|T]) :-
    diagonal2(H,T,1),
    diagonal(T).
    
diagonal2(_,[],_).

diagonal2(H,[H2|T],V):-
    Tmp is V + 1,
    Verschil is abs(H-H2),
    V \== Verschil,
    diagonal2(H,T,Tmp).     
