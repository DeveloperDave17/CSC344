% -----------------------------------------------------
% File: foods.pro
% Info: This program contains 6 food facts that are
%       seperated into fruit and vegetable
% -----------------------------------------------------

% -----------------------------------------------------
% fruit(F) :: F is a fruit

fruit(grapefruit).
fruit(avocado).
fruit(date).

% -----------------------------------------------------
% vegetable(V) :: V is a vegetable

vegetable(asperagus).
vegetable(broccoli).
vegetable(carrot).

% -----------------------------------------------------
% food(F) :: F is a food

food(F) :- fruit(F).
food(F) :- vegetable(F).



