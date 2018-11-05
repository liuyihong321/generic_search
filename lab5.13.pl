py_triple(A, B, C) :- 0 < A, A =< B, B =< C, X is A*A, Y is B*B, Z is C*C, Z is X+Y.
