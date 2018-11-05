product([], 1).
product([H|T], X) :- product(T, X1), X is H*X1.
