element([X|_], 0, X).
element([_|T], New, Y) :- element(T, X, Y), New is X+1.
