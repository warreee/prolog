gerecht(groentesoep, voorgerecht, 4, []).
gerecht(carpaccio, voorgerecht, 7, [vlees,kaas]).
gerecht(vleesballetjes, voorgerecht, 6, [vlees]).
gerecht(nachos, voorgerecht, 8, [mais,kaas]).
gerecht(steak,hoofdgerecht,11,[vlees,champignons]).
gerecht(spaghetti,hoofdgerecht,10,[]).
gerecht(koninginnenhapje,hoofdgerecht,9,[vlees,melk]).
gerecht(coupe_bresilienne,nagerecht,7,[melk,noten]).
gerecht(fruitsla,nagerecht,5,[appel,peer]).

gast(gerda).
gast(joachim).
gast(jan).
gast(joris).
gast(dominique).

lust_niet(gerda,appel).
lust_niet(joachim,noten).
lust_niet(jan,vlees).
lust_niet(joris,melk).
lust_niet(dominique,champignons).

menu(Budget, Menu) :-
    menus(Menu),
    kost(Budget,Menu),  % Bereken de kost van het menu en controleer of die overeenkomt met budget.
    lustAlles(Menu).    % Controleert of iedereen alles van het menu lust.

    
menus(MenuVoorstel) :-
    findall(eet(Gast, [Voor, Hoofd, Na]),   (gast(Gast),gerecht(Voor,voorgerecht,_,_),
                                            gerecht(Hoofd,hoofdgerecht,_,_), 
                                            gerecht(Na, nagerecht,_,_)),Menu), % Vind alle mogelijke combinaties
    findall(Gast, gast(Gast), Gasten),   % Vind alle gasten
    neemVoorstel(Menu, Gasten, [], MenuVoorstel).
    
neemVoorstel(_, [], Acc, Acc).
neemVoorstel(Mog, [H|T], Acc, Voorstel) :-
    Temp = eet(H, _),
    member(Temp, Mog),
    neemVoorstel(Mog, T, [Temp|Acc], Voorstel).      
    
       
    
kost(Budget, Menu) :-
    berekenKost(Menu, 0, Kost), % Bereken de kost van het totale menu
    Kost == Budget.
    
berekenKost([], Kost, Kost).    


    
berekenKost([eet(_,PM)|PMS], Acc, Kost) :-    
    berekenKostPers(PM, 0, KostPM),     %Bereken kost van 1 persoon
    Temp is Acc + KostPM,
    berekenKost(PMS, Temp, Kost).
    
    
berekenKostPers([], Kost, Kost).
berekenKostPers([H|T], Acc, Kost) :-
        gerecht(H, _, Prijs, _),
        Temp is Acc + Prijs,
        berekenKostPers(T, Temp, Kost).
 
lustAlles([]).        
lustAlles([H|T]) :-
    persLustAlles(H),
    lustAlles(T).
    
persLustAlles(eet(Pers, Gerechten)) :-
    findall(Ingr, lust_niet(Pers, Ingr), LustNiet),
    ingred(Gerechten, [], Ingred),
    member(X,LustNiet),
    not(member(X,Ingred)). 
 
% Zoek alle ingrediënten    
ingred([], Ingred, Ingred).    
ingred([H|T], Acc, Ingred) :-
    gerecht(H, _, _, Ing),
    append(Ing, Acc, Ings),
    ingred(T, Ings, Ingred).                            
          
