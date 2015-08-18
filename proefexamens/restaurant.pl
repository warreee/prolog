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

menu(Budget,Menu) :-
    kost(Budget,Menu),  % Bereken de kost van het menu en controleer of die overeenkomt met budget.
    lustAlles(Menu),    % Controleert of iedereen alles van het menu lust.
    voorNa(Menu).       % Controleer of iedereen een voor- en nagerecht heeft.
    
kost(Budget, Menu) :-
       
