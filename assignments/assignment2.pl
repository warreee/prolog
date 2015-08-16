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

%%%%%%%%%%%%%%%%%%%%%%%%%%%Fibonacci%%%%%%%%%%%%%%%%%%%%%%%

fib(1,0).
fib(2,1).
fib(N,R) :-
    N > 0,
    N1 is N-1,
    N2 is N-2,
    fib(N1,R1),
    fib(N2,R2),
    R is R1 + R2.
    
fib2(1,0).
fib2(2,1).
fib2(N,F) :-
    N > 2,
    fib2(N,2,1,0,F).    
    
fib2(N,I,F2,F1,F) :-
    In is I + 1,
    Fn is F2 + F1,
    ( 
        N = In
    ->
        F = Fn
    ;
        fib2(N,In,Fn,F2,F)
    ).    

%%%%%%%%%%%%%%%%%%% Balanced Trees %%%%%%%%%%%%%%%%

depth(empty,0).

depth(node(L,_,R),D) :- depth(node(L,_,R),D,0).

depth(empty,D,D).

depth(node(L,_,R),D,Acc) :-
    
    depth(L, DL, Acc),
    depth(R, DR, Acc),
    D1 is max(DL, DR),
    D is D1 + 1.  
    
    
balanced(empty).
balanced(node(L,_,R)) :-
    depth(L,DL),
    depth(R,DR),
    abs(DL - DR) =< 1.
    
add_to(empty,X,X).
add_to(node(L,_,R),Node,Tree) :-
    add_to(L,Node,Tree);
    add_to(R,Node,Tree),
    balanced(Tree).
    
   
%%%%%%%%%%%%%%%%%%%%%%% Expressive %%%%%%%%%%%%%%%%%%%%%%%
    
       
