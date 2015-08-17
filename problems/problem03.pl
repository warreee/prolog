element_at(X,[X|_],1).
element_at(X,[_|T],Index) :-
    Temp is Index - 1,
    Temp > 0,
    element_at(X,T,Temp).
