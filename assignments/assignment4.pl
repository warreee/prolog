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
    
%%%%%%%%%%%%%%%% Holiday Lights %%%%%%%%%%%%%%%%%%%%%

highway(1,2,yellow).
highway(2,3,blue).
highway(1,3,yellow).

allcities(L) :-
    findall(X, (highway(X, _,_);highway(_,X,_)), NL),
    list_to_set(NL, L).
    
countcity(X) :-
    findall(X, (highway(X, _,_);highway(_,X,_)), NL),
    length(NL,Length),
    Length mod 2 =:= 0.
    
checkall([]).    
checkall([H|T]) :-
    countcity(H),
    colorsOf(H),
    checkall(T).   
    
check :-
    allcities(L),
    checkall(L).     
    
colorsOf(X) :-
    findall(Col, (highway(X,_,Col); highway(_,X,Col)),Colors),
    list_to_set(Colors, Colors2),
    length(Colors,M),
    length(Colors2,N),
    M == N;
    M - N > M//2.
    
    
