:- dynamic val/1.

readcsvfile(CSV) :-
    ( nonvar(CSV) ; CSV = 'C:/Users/user/AI/Assignment2/roaddistance.csv'),forall(readvalue(CSV, R), savevalue(R)).
readvalue(CSV, R) :-
    csv_read_file_row(CSV, R,[]).

dfs(SO, P):-
        dfsutil(SO,[SO],PS), reverse(PS,P).
dfsutil(S,P1,P1) :- goal(S).
dfsutil(S,End,P) :- (allvalues(S,S1,_); allvalues(S1,S,_)),not(member(S1,End)), dfsutil(S1,[S1|End], P).
savevalue(R) :-
    val(Col), R =.. [_|C], C = [K|Val], findall(X, val(X),Z), savecol(K, Z, Val).
savevalue(R):-
    R =.. [_|C], remain(C,Cs), facts(Cs).
savecol(_,[],[]).
savecol(R, [Cc|TT], [Val|T]) :- assert(allvalues(R, Cc, Val)),savecol(R,TT, T).
facts([]).
facts([H|T]):- assert(val(H)),facts(T).
remain([_], []).
remain([X|Xs], [X|Remain]) :-
    remain(Xs,Remain).

