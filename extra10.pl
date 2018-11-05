cartesian_product([], _, []).
cartesian_product(_, [], []).
cartesian_product([X|Tx], Y, Z) :- helper(X, Y, L1), cartesian_product(Tx, Y, L2), append(L1, L2, Z).

helper([], _, []).
helper(_, [], []).
helper(X, [H|T], [(X,H)|L]) :- helper(X, T, L).
