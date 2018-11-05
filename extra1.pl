binary_number([]).
binary_number([0, b, 0]).
binary_number([0, b, 1|T]) :- binary_number(0b1, T).
binary_number(0b1, [H|T]) :- H = 0; H = 1, binary_number(0b1, T).
