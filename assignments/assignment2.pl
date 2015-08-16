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
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Graphs%%%%%%%%%%%%%%%%%%%%%%%%%%%
node(a).
node(b).
node(c).
node(d).
node(e).

edge(a,b).
edge(b,d).
edge(b,c).
edge(c,d).

neighbor(A,B) :-
    edge(A,B);
    edge(B,A).
    
% indefinite loop:
path(S,E) :- neighbor(S,E).
path(S,E) :-
    neighbor(S,X),
    path(X,E).    


path2(S,E) :- path3(S,E,[]).

path3(S,E,V) :- 
    neighbor(S,E),
    \+ member(edge(S,E),V),
    \+ member(edge(E,S),V).

path3(S,E,V) :-
    neighbor(S,X),
    \+ member(edge(S,X),V),
    \+ member(edge(X,S),V),
    path3(X,E,[edge(S,X)|V]).

