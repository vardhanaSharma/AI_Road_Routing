:- dynamic saved/3.
:- dynamic vals/1.

readcsvfile1(CSV) :-
        ( nonvar(CSV) ; CSV = 'C:/Users/user/AI/Assignment2/heurestic.csv'), forall(readvalue(CSV, R), savevaluebfs(R)).
bfs(S, P):-
     bfsutil(S,[[9999,x]],[S],Pt), reverse(Pt,P).
bfsutil(S,Tf,P,P) :- goal(S).
bfsutil(S,Tf,End,P) :-
     goal(G), findall([Y,X],((allvalues(S,X,_); allvalues(X,S,_)),saved(X,G,Y), not(member(X, End))),Z), append(Z,T1,FinalAns),
     sort(1,@<,FinalAns,[H|T]), nth1(2,H, H1), bfsutil(H1,T,[H1|End],P).

savevaluebfs(R) :-
    vals(Col), R =.. [_|Cols], Cols = [R|All], findall(X, vals(X),Z), savecol(R, Z, All).
savevaluebfs(R):-
    R =.. [_|C], remain(C,Co), factsbfs(C).
savecol(_,[],[]).
savecol(R, [C|Tail], [All|T]) :-
    assert(saved(R, Col, All)),savecol(R,Tail, T).
factsbfs([]).
factsbfs([H|T]):-
    assert(vals(H)),factsbfs(T).



