remove(_, [], []).
remove(X, [X|Xs], Y) :-
    remove(X, Xs, Y).
remove(X, [T|Xs], [T|Y]) :-
    remove(X, Xs, Y).
