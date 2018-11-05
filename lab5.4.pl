twice([], []).
twice([H|T], [H, H|X]) :- twice(T, X).
