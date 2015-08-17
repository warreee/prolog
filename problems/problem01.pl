my_last([L],L).
my_last([|T],L) :- my_last(T,L).
