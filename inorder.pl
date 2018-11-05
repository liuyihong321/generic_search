inorder(leaf(X), [X]).
inorder(tree(X, Y, Z), T) :- inorder(Y, YT), inorder(Z, ZT), append(YT, [X|ZT], T).
