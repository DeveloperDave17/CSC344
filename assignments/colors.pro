% ------------------------------------------------------------------------------
% File: colors.pro
% Line: Six color facts, structured into primaries and secondaries

% ------------------------------------------------------------------------------
% primary(P) :: P is a primary color

primary(blue).
primary(red).
primary(yellow).

% ------------------------------------------------------------------------------
% secondary(S) :: S is a secondary color

secondary(green).
secondary(orange).
secondary(purple).

% ------------------------------------------------------------------------------
% color(C) :: C is a color

color(C) :- primary(C).
color(C) :- secondary(C).

