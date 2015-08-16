%%%%%% ex 1

listlength([],0).
listlength([_|Rest],Length) :-
    listlength(Rest,LengthRest),
    Length is LengthRest + 1.
     
listlength2([],L,L).

listlength2([_|Rest],Length,Acc) :-
    Temp is Acc + 1,
    listlength2(Rest,Length,Temp).
    
last([L],L).    
last([_|Rest],L) :- last(Rest,L).

next_to([A,B|_],A,B).
next_to([_|Rest],A,B) :- next_to(Rest,A,B).

vector_sum([],[],[]).

vector_sum([Head|Tail],[Head2|Tail2],[H|T]) :-
    H is Head + Head2,
    vector_sum(Tail,Tail2,T).

look_up([pair(K,V)|_],K,V).
    
look_up([_|T],Key,Value) :-
    look_up(T,Key,Value).
    


