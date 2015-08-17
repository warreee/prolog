teaches(berbers,bs).
teaches(berbers,iw).
teaches(demoen,ab).
teaches(demoen,cc).
teaches(holvoet,bvp).
teaches(moens,bvp).
teaches(danny,ai).
teaches(maurice,ai).
teaches(dedecker,socs).

takes(tom,bs).
takes(tom,bvp).
takes(tom,socs).
takes(maarten,socs).
takes(maarten,bs).
takes(pieter,bvp).

takes_same_course(X,Y) :- 
    findall((X,Y), 
            (takes(X,C), takes(Y,C), X \== Y),
            L),
    list_to_set(L,S),
    member((X,Y),S).
    
teach_same_course(X,Y) :-
    findall((X,Y),
            (teaches(X,C), teaches(Y,C), X \== Y),
            L),
    list_to_set(L,S),
    member((X,Y),S).            
  
teaches_multiples_courses(X) :-
    findall(X,
        (teaches(X,C), teaches(X,B), C \== B),
        L),
    list_to_set(L,S),
    member(X,S). 
    
teaches_multiples_courses(X,S) :-
    findall(X,
        (teaches(X,C), teaches(X,B), C \== B),
        L),
    list_to_set(L,S).      
    
%%%%%%%%%%%%%%%%%%%FUNCTIONAL PROGRAMMING%%%%%%%%%%%%%%%%%%%

map([],_,[]).

map([H|T],P,[Y|Ys]) :-
    F =.. [P,H,Y],
    call(F),
    map(T,P,Ys).                                         
                                         
inc(X,Y) :- Y is X + 1.                                         
                                         
%%%%%%%%%%%%%%%%%%%% Stracciatella %%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                         
     
interpret((G1,G2)) :- !, 
    interpret(G1), 
    interpret(G2).
    
interpret(call(X)) :- !, 
    interpret(X).
    
interpret('=..'(X,Y)) :- !, 
    X =.. Y.
    
interpret(is(X,Y)) :- !,
    X is Y.
    
interpret(true) :- !.
interpret(Head) :- 
    clause(Head,Body), 
    interpret(Body).  
     
%%%%%%%%%%%% 
     
     
     
     
                                         
                                         
                                         
