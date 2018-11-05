addone([], []).
addone([H|T], [X|Y]) :- addone(T,Y), X is H+1.
