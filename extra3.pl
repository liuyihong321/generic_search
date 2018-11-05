pairs([c],[g]).
pairs([g],[c]).
pairs([a],[t]).
pairs([t],[a]).

dna([], []).
dna([H|T], [X|Y]) :- pairs([H], [X]), dna(T, Y).
