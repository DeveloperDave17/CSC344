% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: pokemon.pro
% --- Line: Just a few facts about pokemon
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- cen(P) :: Pokemon P was "creatio ex nihilo"

cen(pikachu).
cen(bulbasaur).
cen(caterpie).
cen(charmander).
cen(vulpix).
cen(poliwag).
cen(squirtle).
cen(staryu).

%--- Additions to kb

cen(mudkip).
cen(torchic).
cen(treecko).
cen(elekid).

% -----------------------------------------------------------------------
% --- evolves(P,Q) :: Pokemon P directly evolves to pokemon Q

evolves(pikachu,raichu).
evolves(bulbasaur,ivysaur).
evolves(ivysaur,venusaur).
evolves(caterpie,metapod).
evolves(metapod,butterfree).
evolves(charmander,charmeleon).
evolves(charmeleon,charizard).
evolves(vulpix,ninetails).
evolves(poliwag,poliwhirl).
evolves(poliwhirl,poliwrath).
evolves(squirtle,wartortle).
evolves(wartortle,blastoise).
evolves(staryu,starmie).

%--- Additions to kb

evolves(mudkip,marshtomp).
evolves(marshtomp,swampert).
evolves(torchic,combusken).
evolves(combusken,blaziken).
evolves(treecko,grovyle).
evolves(grovyle,sceptile).
evolves(elekid,electabuzz).
evolves(electabuzz,electivire).

% -----------------------------------------------------------------------
% --- pokemon(name(N),T,hp(H),attach(A,D)) :: There is a pokemon with
% --- name N, type T, hit point value H, and attach named A that does
% --- damage D.

pokemon(name(pikachu), electric, hp(60), attack(gnaw, 10)).
pokemon(name(raichu), electric, hp(90), attack(thunder-shock, 90)).

pokemon(name(bulbasaur), grass, hp(40), attack(leech-seed, 20)).
pokemon(name(ivysaur), grass, hp(60), attack(vine-whip, 30)).
pokemon(name(venusaur), grass, hp(140), attack(poison-powder, 70)).

pokemon(name(caterpie), grass, hp(50), attack(gnaw, 20)).
pokemon(name(metapod), grass, hp(70), attack(stun-spore, 20)).
pokemon(name(butterfree), grass, hp(130), attack(whirlwind, 80)).

pokemon(name(charmander), fire, hp(50), attack(scratch, 10)).
pokemon(name(charmeleon), fire, hp(80), attack(slash, 50)).
pokemon(name(charizard), fire, hp(170), attack(royal-blaze, 100)).

pokemon(name(vulpix), fire, hp(60), attack(confuse-ray, 20)).
pokemon(name(ninetails), fire, hp(100), attack(fire-blast, 120)).

pokemon(name(poliwag), water, hp(60), attack(water-gun, 30)).
pokemon(name(poliwhirl), water, hp(80), attack(amnesia, 30)).
pokemon(name(poliwrath), water, hp(140), attack(dashing-punch, 50)).

pokemon(name(squirtle), water, hp(40), attack(bubble, 10)).
pokemon(name(wartortle), water, hp(80), attack(waterfall, 60)).
pokemon(name(blastoise), water, hp(140), attack(hydro-pump, 60)).

pokemon(name(staryu), water, hp(40), attack(slap, 20)).
pokemon(name(starmie), water, hp(60), attack(star-freeze, 20)).

%--- Additions to kb

pokemon(name(mudkip), water, hp(50), attack(water-gun, 30)).
pokemon(name(marshtomp), water, hp(75), attack(water-pulse, 60)).
pokemon(name(swampert), water, hp(110), attack(muddy-water, 90)).

pokemon(name(torchic), fire, hp(45), attack(scratch, 10)).
pokemon(name(combusken), fire, hp(60), attack(flame-charge, 50)).
pokemon(name(blaziken), fire, hp(90), attack(blaze-kick, 85)).

pokemon(name(treecko), grass, hp(40), attack(scratch, 10)).
pokemon(name(grovyle), grass, hp(50), attack(leafage, 40)).
pokemon(name(sceptile), grass, hp(75), attack(leaf-blade, 90)).

pokemon(name(elekid), electric, hp(45), attack(thundershock, 40)).
pokemon(name(electabuzz), electric, hp(70), attack(thunder-punch, 75)).
pokemon(name(electivire), electric, hp(120), attack(zap-cannon, 120)).

%------------------------------------------------------------------------
%--- diplay_cen :: displays all of the cen pokemon

display_cen :- cen(Name),write(Name),nl,fail.
display_cen.

%------------------------------------------------------------------------
%--- display_not_cen :: displays all of the not cent pokemon

display_not_cen :- evolves(_,Y),write(Y),nl,fail.
display_not_cen.

%------------------------------------------------------------------------
%--- generator(Name,Type) :: Name of the cen pokemon and the given type
%--- display true if a pokemon with that type exists in our kb

generator(Name,Type) :- cen(Name),pokemon(name(Name),Type,_,_).

%------------------------------------------------------------------------
%--- display_names :: Displays all of the pokemon in the kb

display_names :- pokemon(name(Name),_,_,_),write(Name),nl,fail.
display_names.

%------------------------------------------------------------------------
%--- display_attacks :: Displays all of the attacks in the kb

display_attacks :- pokemon(_,_,_,attack(Attack,_)),write(Attack),nl,fail.
display_attacks.

%------------------------------------------------------------------------
%--- display_cen_attacks :: Displays all of the attacks from cen pokemon
%--- in the kb

display_cen_attacks :- pokemon(name(Name),_,_,attack(Attack,_)),cen(Name),write(Attack),nl,fail.
display_cen_attacks.

%------------------------------------------------------------------------
%--- indicate_attack(Name) :: Displays the pokemons Name and its associated
%---                         attack

indicate_attack(Name) :- pokemon(name(Name),_,_,attack(Attack,_)),write(Name),write(' --> '),write(Attack).

%------------------------------------------------------------------------
%--- indicate_attacks :: Displays all of the pokemon with their associated
%---                     attacks

indicate_attacks :- indicate_attack(_),nl,fail.
indicate_attacks.

%-------------------------------------------------------------------------
%--- powerful(Name) :: succeeds if a pokemon has an attack with more than 55
%---                   units of damage.

powerful(Name) :- pokemon(name(Name),_,_,attack(_,Damage)), Damage > 55.

%------------------------------------------------------------------------
%--- tough(Name) :: succeeds if a pokemon can take more than 100 units of
%---                damage.

tough(Name) :- pokemon(name(Name),_,hp(HP),_), HP > 100.

%------------------------------------------------------------------------
%--- awesome(Name) :: succeeds if a pokemon is both powerful and tough

awesome(Name) :- powerful(Name),tough(Name).

%------------------------------------------------------------------------
%--- powerful_but_vulnerable(Name) :: succeeds if a pokemon is powerful 
%---                                  but not tough.

powerful_but_vulnerable(Name) :- powerful(Name), pokemon(name(Name),_,hp(HP),_), HP < 101.

%------------------------------------------------------------------------
%--- type(Name,Type) :: specifies whether a pokemon is of a specific type

type(Name,Type) :- pokemon(name(Name),Type,_,_).

%------------------------------------------------------------------------
%--- dump_kind(Kind) :: displays all of the information for a pokemon of
%---                    Kind 

dump_kind(Kind) :- pokemon(Name,Kind,Type,Attack),write('pokemon('),write(Name),write(','),
                   write(Kind),write(','),write(Type),write(','),write(Attack),write(')'),nl,fail.
dump_kind(_).

%-----------------------------------------------------------------------
%--- family(Name) :: displays the family of the cen pokemon

%family(Name) :- cen(Name),evolves(Name,Evolution), (evolves(Evolution,NextEvolution) -> 
 %               write(Name),write(' '),write(Evolution),write(' '),write(NextEvolution) ; 
  %              cen(Name),evolves(Name,Evolution),write(Name),write(' '),write(Evolution)).


family(Name) :- write(Name),write(' '),evolves(Name,Evolution),family(Evolution).
family(_).


%------------------------------------------------------------------------
%--- families :: displays all of the families.

families :- cen(Name),family(Name),nl,fail.
families.

%------------------------------------------------------------------------
%--- lineage(Name) :: displays all of the information associated with a 
%---                  pokemon and its evolutions

lineage(Name) :- pokemon(name(Name),Type,HP,Attack), write('pokemon(name('),write(Name),
                 write('),'),write(Type),write(','),write(HP),write(','),write(Attack),write(')'),
                 evolves(Name,Evolution),nl,lineage(Evolution).
lineage(_).