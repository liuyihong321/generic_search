swap_ends([], []).
swap_ends(L1, L2) :- append([First|Mid], [Last], L1),
                    append([Last|Mid], [First], L2).
