rle([],[]).
rle([X|Y], [H|T]) :- helper(X, Y, Ty, 1, H), rle(Ty, T).

helper(X, [], [], N, (X, N)).
helper(X, [X|Tx], Ty, N, Z) :- K is N + 1, helper(X, Tx, Ty, K, Z).
helper(X, [Y|Ty], [Y|Ty], N, (X, N)) :- X \= Y.
