my_last([L],L).
my_last([_|T],L) :- my_last(T,L).
