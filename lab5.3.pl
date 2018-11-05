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
listtran([L1|R1], [L2|R2]) :- tran(L1,L2), listtran(R1,R2).
