%------------------------------------------------------------------------
%--- File: list_processors.pro
%------------------------------------------------------------------------

%------------------------------------------------------------------------
%--- first(List,First) :: returns the first element of a list.

first([H|_],H).

%------------------------------------------------------------------------
%--- rest(List,Remainder) :: returns the remainder of a list.

rest([_|T],T).

%------------------------------------------------------------------------
%--- last(List, Result) :: returns the last element of a list.

last([H|[]],H). %--- Requires the remainder of the list to be empty
last([_|T], Result) :- last(T, Result).

%------------------------------------------------------------------------
%--- nth(Number,List,Result) :: returns the nth element of a list.

nth(0,[H|_],H).
nth(N,[_|T], E) :- K is N - 1, nth(K,T,E).

%------------------------------------------------------------------------
%--- writelist(List) :: prints all of the contents of a list on seperate
%---                    lines.

writelist([]).
writelist([H|T]) :- write(H), nl, writelist(T).

%------------------------------------------------------------------------
%--- sum(List, Result) :: returns the sum of every element in a list.

sum([],0).
sum([Head|Tail],Sum) :-
    sum(Tail,SumOfTail),
    Sum is Head + SumOfTail.

%------------------------------------------------------------------------
%--- add_first(Element, List, Result) :: returns a new list with an
%---                                     element added to the front.

add_first(X,L,[X|L]).

%------------------------------------------------------------------------
%--- add_last(Element, List, Result) :: returns a new list with an
%---                                    element added to the end.

add_last(X,[],[X]).
add_last(X,[H|T],[H|TX]) :- add_last(X,T,TX).

%------------------------------------------------------------------------
%--- iota(N,Result)

iota(0,[]).
iota(N,IotaN) :-
    K is N - 1,
    iota(K,IotaK),
    add_last(N,IotaK,IotaN).

%------------------------------------------------------------------------
%--- pick(List,Result) :: picks an element from the list.

pick(L, Item) :-
    length(L,Length),
    random(0,Length,RN),
    nth(RN,L,Item).

%------------------------------------------------------------------------
%--- make_set(List,Result) :: transforms a list into a set 

make_set([],[]).
make_set([H|T],TS) :-
    member(H,T),
    make_set(T,TS).
make_set([H|T],[H|TS]) :-
    make_set(T,TS).

%------------------------------------------------------------------------
%--- product(List,Result) :: takes the product of a list

product([],1).
product([H|T],Result) :- product(T,ProductOfTail),
                        Result is H * ProductOfTail.

%------------------------------------------------------------------------
%--- factorial(N,Result) :: takes the factorial of N

factorial(N,Result) :- iota(N, IotaN), product(IotaN, Result).

%------------------------------------------------------------------------
%--- make_list(N, Item, Result) :: Makes a list containing an Item N times

make_list(0, _, []).
make_list(N, Item, [Item|ResultOfRec]) :- K is N - 1, make_list(K, Item, ResultOfRec).

%------------------------------------------------------------------------
%--- but_first(List,CDR) :: Produces the cdr of a list

but_first([_],[]).
but_first([_|T],T).

%------------------------------------------------------------------------
%--- but_last(List,RDC) :: Produces the rdc of a list

but_last([_],[]).
but_last(List, RDC) :- reverse(List,ReversedList),
                       but_first(ReversedList,ReversedListWithoutFirst),
                       reverse(ReversedListWithoutFirst,RDC).

%------------------------------------------------------------------------
%--- is_palindrome(List) :: Determines if a list is a palindrome

is_palindrome([]). 
is_palindrome([_]).
is_palindrome(List) :- first(List, First), last(List, Last), First = Last,
                       but_first(List,ListWithoutFirst), 
                       but_last(ListWithoutFirst, ListWithElesRemoved),
                       is_palindrome(ListWithElesRemoved).

%------------------------------------------------------------------------
%--- noun_phrase(Phrase) :: produces a noun phrase consisting of the word
%                           the followed by an Adjective then a Noun.

noun_phrase([the,Adjective,Noun]) :-
    pick([ambitious,delightful,victorius,witty,zealous,gentle], Adjective),
    pick([dog,robot,samurai,dragon,sandwich,helicopter,musician,artist], Noun).

%------------------------------------------------------------------------
%--- sentence(Sentence) :: produces a sentence consisting of a noun_phrase
%---                       followed by a past tense verb then by another
%---                       noun_phrase

sentence(Sentence) :- pick([attacked,saw,followed,loved,hated,admired,taught], Verb),
                      noun_phrase(Phrase1),
                      noun_phrase(Phrase2),
                      add_last(Verb, Phrase1, PhraseWthVerb),
                      append(PhraseWthVerb, Phrase2, Sentence).


