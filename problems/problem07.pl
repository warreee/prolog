my_flatten(X,[X]) :- \+ is_list(X).
my_flatten([],[]).
my_flatten([H|T],Zs) :- my_flatten(H,X), my_flatten(T,Y), append(X,Y,Zs).
