/* tear rate related clauses */
normal_tear_rate(RATE) :- RATE >= 5.
low_tear_rate(RATE) :- RATE < 5.

/* age-related clauses */
young(AGE) :- AGE < 45.
old(AGE) :- AGE >= 45.

diagnosis(hard_lenses, Age, Astigmatic, Tear_Rate) :- young(Age), Astigmatic == yes, normal_tear_rate(Tear_Rate).
diagnosis(soft_lenses, Age, Astigmatic, Tear_Rate) :- young(Age), Astigmatic == no, normal_tear_rate(Tear_Rate).
diagnosis(no_lenses, Age, Astigmatic, Tear_Rate) :- old(Age), low_tear_rate(Tear_Rate).
