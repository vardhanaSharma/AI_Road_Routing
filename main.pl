:- [library(csv)].
:- dynamic allvalues/3.

start:-
    reconsult('C:/Users/user/Downloads/Road-route-from-one-city-to-another-in-prolog-main/Road-route-from-one-city-to-another-in-prolog-main/dfs.pl'),nl,
    reconsult('C:/Users/user/Downloads/Road-route-from-one-city-to-another-in-prolog-main/Road-route-from-one-city-to-another-in-prolog-main/bfs.pl'),nl,retractall(goal(_)), retractall(val(_)),retractall(vals(_)), retractall(saved(_,_,_)), retractall(allvalues(_,_,_)), main(T).

main(T):-
        write('Welcome To Route System'),nl,
    write('Select search you want to use to find the route from one city to another city?'),nl,
    write('1. Depth First Search'),tab(4),
    write('2. Best First Search'),nl,
    read(T),
     readcsvfile(CSV),
    algo(T).


algo(Type):-
        Type = 2, readcsvfile1(CSV), !, input(S), bfs(S, P), path(P).

algo(Type):-
        Type = 1, !,input(S), dfs(S, P), path(P).

input(S):-
        write('Enter Source: '),
	read(S), nl,
	write('Enter Destination: '),
	read(G), nl,
	assert(goal(G)).
path([]).
path([H|T]):- writeln(H), path(T).


