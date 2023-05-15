% ---------------------------------------------
% File: mapcoloring.pro
% Info: This program is used to color a custom
%       map with 4 colors, namely, red, blue,
%       magenta, and yellow.
% ---------------------------------------------

% ---------------------------------------------
% different(X,Y) :: X is not equal to Y

different(red,blue).
different(red,magenta).
different(red,yellow).
different(blue,red).
different(blue,magenta).
different(blue,yellow).
different(magenta,red).
different(magenta,blue).
different(magenta,yellow).
different(yellow,red).
different(yellow,blue).
different(yellow,magenta).

% ---------------------------------------------
% coloring(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,AB)

coloring(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,AB) :-
    different(A,B),
    different(A,C),
    different(A,D),
    different(A,E),
    different(A,F),
    different(A,G),
    different(B,C),
    different(B,H),
    different(B,M),
    different(B,X),
    different(B,AB),
    different(C,D),
    different(C,I),
    different(C,H),
    different(D,I),
    different(D,J),
    different(D,E),
    different(E,J),
    different(E,K),
    different(E,F),
    different(F,K),
    different(F,L),
    different(F,G),
    different(G,L),
    different(G,R),
    different(G,AA),
    different(G,AB),
    different(H,I),
    different(H,M),
    different(H,N),
    different(I,N),
    different(I,O),
    different(I,J),
    different(J,O),
    different(J,P),
    different(J,K),
    different(K,P),
    different(K,Q),
    different(K,L),
    different(L,Q),
    different(L,R),
    different(M,N),
    different(M,U),
    different(M,X),
    different(N,U),
    different(N,S),
    different(N,O),
    different(O,P),
    different(O,S),
    different(P,T),
    different(P,Q),
    different(Q,T),
    different(Q,W),
    different(Q,R),
    different(R,W),
    different(R,AA),
    different(S,U),
    different(S,V),
    different(S,T),
    different(T,V),
    different(T,W),
    different(U,X),
    different(U,Y),
    different(U,V),
    different(V,Y),
    different(V,Z),
    different(V,W),
    different(W,Z),
    different(W,AA),
    different(X,AB),
    different(X,Y),
    different(Y,AB),
    different(Y,Z),
    different(Z,AB),
    different(Z,AA),
    different(AA,AB).

