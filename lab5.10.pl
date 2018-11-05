merge([], [], []).
merge(X, [], X).
merge([], X, X).
merge([H|T], [X|Y], [A|B]) :- H < X, A = H, merge(T,[X|Y],B); A = X, merge([H|T],Y,B).

