first([First|_],First).

rest([_|Rest],Rest).

last([Last],Last).
last([_|T],Result) :- last(T,Result).

nth(0,[H|_],H).
nth(N,[_|T],Result) :- K is N - 1, nth(K,T,Result).

writelist([]).
writelist([H|T]) :- write(H), nl, writelist(T).

sum([],0).
sum([H|T], Result) :- sum(T,PrevSum), Result is PrevSum + H.

add_first(Element,List,[Element|List]).

add_last(Element,[],[Element]).
add_last(Element,[H|T],[H|Result]) :- add_last(Element,T,Result).

pick(L, Item) :-
    length(L, Length),
    random(0,Length,RN),
    nth(RN,L,Item).


but_first([_|T],T).

but_last([_],[]).
but_last([H|T],[H|Result]) :- but_last(T,Result).


is_palindrome([]).
is_palindrome([_]).
is_palindrome(List) :-
    first(List,F), last(List,L), F = L, but_first(List,ListWoF), but_last(ListWoF,ListWoFL), is_palindrome(ListWoFL).

iota(0,[]).
iota(N,[N|Result]) :- K is N - 1, iota(K, Result).

product([],1).
product([H|T],Product) :- product(T,Result), Product is Result * H.

factorial(N,Result) :- iota(N,Iota),product(Iota,Result).