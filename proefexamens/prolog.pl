guest(stephen).
guest(sandra).
guest(bruno).

% Input predicate: what guests drink
%     drinks(guestID,drinkID).
drinks(stephen,tequila_sunrise).
drinks(stephen,long_island_ice_tea).
drinks(stephen,bloody_mary).

drinks(sandra,bloody_mary).
drinks(sandra,mojito).

drinks(bruno,tequila_sunrise).
drinks(bruno,long_island_ice_tea).
drinks(bruno,margarita).

% Input predicate: how much drinks each guest want (min).
%     drinks_minimum(guestID,number).
drinks_minimum(stephen,1).
drinks_minimum(sandra,1).
drinks_minimum(bruno,1).

% Input predicate: how much drinks each guest can tolerate (max).
%     drinks_maximum(guestID,number).
drinks_maximum(stephen,2).
drinks_maximum(sandra,2).
drinks_maximum(bruno,2).

ingredient(mojito,limes).
ingredient(mojito,mint).
ingredient(mojito,rum).

ingredient(tequila_sunrise,grenadine).
ingredient(tequila_sunrise,limes).
ingredient(tequila_sunrise,tequila).

ingredient(margarita,limes).
ingredient(margarita,tequila).

ingredient(bloody_mary,vodka).
ingredient(bloody_mary,tomatoes).
ingredient(bloody_mary,limes).

ingredient(long_island_ice_tea,vodka).
ingredient(long_island_ice_tea,rum).
ingredient(long_island_ice_tea,tequila).
ingredient(long_island_ice_tea,limes).


drink_order(DrinkOrder) :-
    all_guests(Guests), % zoek alle gasten
    add_drinks(DrinkOrder, [], Guests), % drankje toevoegen indien de gast het liked en min max
    carry_capacity(DrinkOrder), % ga na of het niet te zwaar is
    dislikes_order(DrinkOrder). % ga de jaloezie na
    
all_guests(Guests) :-
    findall(G, guest(G), Guests).  
    
add_drinks(DrinkOrder, DrinkOrder, []).

add_drinks(DrinkOrder, Acc, [G|Gs]) :-
    add_drink(G, [], Drinks),
    add_drinks(DrinkOrder, [order(G,Drinks)|Acc], Gs).
    
add_drink(G, Drinks, Drinks) :-
    length(Drinks, Nb),
    drinks_minimum(G, Min),
    drinks_maximum(G, Max),
    Nb >= Min,
    Nb =< Max. 
add_drink(G, Acc, Drinks) :-
    length(Acc , Nb),
    drinks_maximum(G, Max),
    Nb =< Max,
    drinks(G, Drink),
    add_drink(G, [Drink|Acc], Drinks).       
    
draag_cap(Cap, Cap, []).    
draag_cap(Cap, Acc, [G|Gs]) :-
    guest_carry_capacity(G, C),
    Temp is Acc + C,
    draag_cap(Cap, Temp, Gs).
    
all_cocktails([], Cocktails, Cocktails). 
    
all_cocktails([order(_,Cts)|Orders], Cocktails, Acc) :-
    append(Acc,Cts, L),
    list_to_set(L, S),
    all_cocktails(Orders, Cocktails, S).
    
all_ingr([], Ingr, Ingr).

all_ingr([C|Cs], Acc, Ingr) :-
    findall(I, ingredient(C, I), Is),
    append(Acc, Is, Ing),
    list_to_set(Ing, R),
    all_ingr(Cs, R, Ingr).
                        
                 
        
 
 
 
 
 
 
 
                                                                               
