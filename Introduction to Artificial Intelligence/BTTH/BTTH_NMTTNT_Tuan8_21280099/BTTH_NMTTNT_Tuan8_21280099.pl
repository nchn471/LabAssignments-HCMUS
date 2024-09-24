/* Co so tri thuc:
- Cho 2 binh nuoc X, Y de dong Z nuoc
- Do day binh Y neu binh Y rong
- Do het nuoc cua binh X ra neu binh X day
- Neu khong thi do nuoc tu binh Y sang binh X (Y khong rong va X khong day)
- Khi mot trong hai binh co Z lit nuoc thi ket thuc (ket qua cua bai toan)
*/
:- dynamic visited_state/5.  % Create a database

min(X, Y, K) :- X > Y, K is Y.
min(X, Y, K) :- X =< Y, K is X.

start(Vx, Vy, Z) :- 
    X = 0, Y = 0,
    % Xoa tat ca menh de truoc khi bat dau
    retractall(visited_state(_,_,_,_,_)),  
    status(X, Y, Vx, Vy, Z).	

/* Z khong duoc lon hon suc chua cua ca hai binh X va Y*/ 
status(_, _, Vx, Vy, Z) :- 
    Z > Vx, Z > Vy, 
    write('Z lon hon ca X va Y, khong co loi giai!').

status(Z, _, _, _, Z) :- write('Ket qua').
status(_, Z, _, _, Z) :- write('Ket qua').

status(X, Y, Vx, Vy, Z) :- 
    Y = 0, 
    NewY is Vy, 
    not(visited_state(X, NewY, Vx, Vy, Z)), 
    assertz(visited_state(X, Y, Vx, Vy, Z)),
    format('Do ~d lit nuoc vao binh Y: (X,Y) = (~d, ~d).', [Vy, X, NewY]), 
    nl,
    status(X, NewY, Vx, Vy, Z).

status(X, Y, Vx, Vy, Z) :- 
    X = Vx, 
    NewX is 0,
    not(visited_state(NewX, Y, Vx, Vy, Z)),
    assertz(visited_state(X, Y, Vx, Vy, Z)), 
    format('Do ~d lit nuoc tu binh X ra ngoai: (X,Y) = (~d, ~d).', [Vx, NewX, Y]),
    nl,
    status(NewX, Y, Vx, Vy, Z).

status(X, Y, Vx, Vy, Z) :- 
    not(Y = 0), X < Vx, 
    min(Y, Vx - X, K), NewX is X + K, NewY is Y - K,
    not(visited_state(NewX, NewY, Vx, Vy, Z)),
    assertz(visited_state(X, Y, Vx, Vy, Z)), 
    format('Do ~d lit nuoc tu binh Y vao binh X: (X,Y) = (~d, ~d)', [K, NewX, NewY]),
    nl, 
    status(NewX, NewY, Vx, Vy, Z).

/*
De chay thuat toan thuc hien
?- start(Vx,Vy,Z). (Voi Vx la dung tich cua binh X, Vy cua binh Y, Z la so lit nuoc can dong)
============
Vi du voi Vx = 4, Vy = 3, Z = 2
?- start(4,3,2).
Do 3 lit nuoc vao binh Y: (X,Y) = (0, 3).
Do 3 lit nuoc tu binh Y vao binh X: (X,Y) = (3, 0)
Do 3 lit nuoc vao binh Y: (X,Y) = (3, 3).
Do 1 lit nuoc tu binh Y vao binh X: (X,Y) = (4, 2)
Ket qua
true 
*/
