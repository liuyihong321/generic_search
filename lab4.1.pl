likes(bob, chocolate).
edible(crisps).
hungry(bob).
likes(bob, sushi).

likes(alice, rock).
likes(alice, jazz).
edible(pizza).
hungry(bob).

eats(Person, Thing) :- likes(Person, Thing).
eats(Person, Thing) :- hungry(Person), edible(Thing).
