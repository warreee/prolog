my_but_last([FL,_],FL).
my_but_last([_|T],L) :- my_but_last(T,L).
