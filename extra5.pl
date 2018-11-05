reversed(L1,L2) :- reversed(L1,L2,[]).

reversed([],L2,L2).
reversed([X|Xs],L2,Acc) :- reversed(Xs,L2,[X|Acc]).

