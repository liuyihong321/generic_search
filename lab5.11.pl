split_odd_even([], [], []).
split_odd_even([A,B|T], [A|X], [B|Y]) :- split_odd_even(T,X,Y).
split_odd_even([A|T], [A|X], Y) :- split_odd_even(T,X,Y).

merge([], [], []).
merge(X, [], X).
merge([], X, X).
merge([H|T], [X|Y], [A|B]) :- H < X, A = H, merge(T,[X|Y],B); A = X, merge([H|T],Y,B).

merge_sort([], []).
merge_sort([H|T], [X|Y]) :- 
