postorder(leaf(X), [X]).
postorder(tree(X, Y, Z), T) :- postorder(Z, ZT), postorder(Y, YT), append(YT, ZT, N), append(N, [X], T).
