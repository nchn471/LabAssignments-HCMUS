parent(marry ,bill).
parent(tom ,bill).
parent(tom, liz).
parent(bill, ann).
parent(bill, sue).
parent(sue, jim).

woman(marry).
man(tom).
man(bill).
woman(liz).
woman(sue).
woman(ann).
man(jim).

child(Y,X) :- parent(X,Y).

mother(X,Y) :- parent(X,Y),woman(X).

grandparent(X,Z):- parent(X, Y), parent(Y, Z).

sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    woman(X).

/* NOI DUNG THUC HANH
Cau 1 :Cho quan he parent nhu trong phan II, cho biet ket qua cua cac
cau hoi sau:
a) ?-parent(jim, X).
Ket qua: false.
Giai thich: jim khong co con, nen jim khong phai la cha me cua ai het

b) ?- parent(X, jim).
Ket qua: X = sue.
Giai thich: cha me cua jim la sue

c) ?- parent(marry, X), parent(X, part).
Ket qua: false.
Giai thich:
X la con cua marry va part la con cua X
Tra ve false vi thieu du lieu cua part

d) ?- parent(marry, X), parent(X, Y), parent(Y, jim).
Ket qua:
X = bill,
Y = sue.
Giai thich:
Marry la cha me cua X => X = bill
X la cha me cua Y => Y = sue
Y la cha me cua jim => sue cha me cua jim => dung

Cau 2: Viet cac menh de Prolog dien ta cac cau hoi lien quan den quan he parent:
a) Ai la cha me cua Bill?
Truy van:
?- parent(X, bill).
Ket qua:
X = marry ;
X = tom.

b) Marry co con khong?
Truy van:
?- child(X, marry).
Ket qua:
X = bill.

d. Ai la ong ba (grandparent) cua Sue?
Truy van:
?- granparent(X, sue).
Ket qua:
X = marry ;
X = tom .

*/

