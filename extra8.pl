fib2(2, [1, 0]).
fib2(N,V) :- N > 2, N1 is N -1, fib2(N1,[A, B|T]), X is A + B, V = [X, A, B|T].

fib(N, V) :- fib2(N, W), reverse(W, V).


