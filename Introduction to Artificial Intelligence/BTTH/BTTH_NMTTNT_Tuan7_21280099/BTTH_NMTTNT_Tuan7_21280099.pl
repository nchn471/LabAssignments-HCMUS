/*Bieu dien cac phat bieu sau du dung logic vi tu

====
herbivore: dv an co
carnivore: dv an thit
ferocious_animal: dv hung du
consume: tieu thu
drink, eat: uong, an
goat: de
wolf: cho soi
=====

a. De la dong vat an co.
herbivore(goat) 
b. Cho soi la dong vat hung du.
ferocious_animal(wolf)
c. Dong vat hung du la dong vat an thit.
ferocious_animal(wolf) -> carnivore(x)
d. Dong vat an thit thi an thit.
∀ carnivore(x) -> eat(x, meat)
e. Dong vat an co thi an co.
∀ herbivore(goat) -> eat(x,grass)
f. Dong vat an thit thi an cac dong vat an co.
∀ carnivore(x) and herbivore(y) -> eat(x,y)
g. Dong vat an thit va dong vat an co deu uong nuoc.
∀ carnivore(x) -> drink(x, water)
∀ herbivore(y) -> drink(y, water)
h. Mot dong vat tieu thu cai ma no uong hoac cai ma no an.
∀ consume(x,water) -> drink(x, water)
∀ consume(x,y) -> eat(x,y)
*/
/*Chuyen cac logic vi tu trong bai 1 sang prolog: */

% Su kien
herbivore(goat).
carnivore(wolf).

% Luat
ferocious_animal(X) :- carnivore(X).
eat(X,meat) :- carnivore(X).
eat(Y,grass) :- herbivore(Y).
eat(X,Y) :- carnivore(X),herbivore(Y).
drink(X,water) :- carnivore(X).
drink(X,water) :- herbivore(X).
consume(X,water) :- drink(X,water).
consume(X,Y) :- eat(X,Y).


/*
Co dong vat hung du khong ? va neu co thi no tieu thu gi?
Thuc hien truy van:

?- ferocious_animal(X).
X = wolf.
===
?- ferocious_animal(X), consume(X,Y).
X = wolf,
Y = water ;
X = wolf,
Y = meat ;
X = wolf,
Y = goat.
===

Vay co dong vat hung du wolf va no tieu thu water, meat, goat.
*/

