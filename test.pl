directlyIn(irina,natasha).
directlyIn(natasha,olga).
directlyIn(olga,katarina).

contains(X, Y) :- directlyIn(Y, X).
contains(X, Y) :- directlyIn(Y, Z), contains(X, Z).


mirror(leaf(X), leaf(X)).
mirror(tree(L1, R1), tree(L2, R2)) :- mirror(L1, R2), mirror(L2, R1).


second([_,X|_], X).

swap12([X, Y|T], [Y,X|T]).

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([], []).
listtran([H|T], [X|Y]) :- tran(H,X), listtran(T, Y).

twice([], []).
twice([H|T], [H, H|Y]) :- twice(T,Y).

swap_ends([], []).
swap_ends(L1, L2) :- append([First|Mid], [Last], L1), append([Last|Mid], [First], L2).

addone([], []).
addone([H|T], [X|Y]) :- X is H+1, addone(T,Y).

element([X|_], 0, X).
element([_|T], New, L) :- element(T, X, L), New is X+1.

remove(_, [], []).
remove(X, [X|Xs], Y) :-
    remove(X, Xs, Y).
remove(X, [T|Xs], [T|Y]) :-
    remove(X, Xs, Y).

split_odd_even([], [], []).
split_odd_even([A,B|T], [A|X], [B|Y]) :- split_odd_even(T,X,Y).
split_odd_even([A|T], [A|X], Y) :- split_odd_even(T,X,Y).

merge([],[],[]).
merge(X,[],X).
merge([],X,X).
merge([H|T],[X|Y],[A|B]) :- H<X, A = H, merge(T,[X|Y],B); A = X, merge([H|T],Y,B).

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(L1, L2) :- split_odd_even(L1,X,Y), merge_sort(X, A), merge_sort(Y, B), merge(A, B, L2).

inside(Min, Max, X) :- Min =< Max, X = Min.
inside(Min, Max, X) :- Min < Max, Y is Min+1, inside(Y, Max, X).

py_triple(A, B, C) :- 0 < A, A =< B, B =< C, X is A*A, Y is B*B, Z is C*C, Z is X+Y.

