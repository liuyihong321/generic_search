new_append([], X, X).
new_append([H|T], L, [X|Y]) :-H=X, new_append(T, L, Y).
