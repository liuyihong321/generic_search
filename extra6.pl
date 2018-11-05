preorder(leaf(X), [X]).
preorder(tree(X, Y, Z), T) :- T = [X|N], preorder(Y, YT), preorder(Z, ZT), append(YT, ZT, N).
