split_odd_even([], [], []).
split_odd_even([A,B|T], [A|X], [B|Y]) :- split_odd_even(T,X,Y).
split_odd_even([A|T], [A|X], Y) :- split_odd_even(T,X,Y).
