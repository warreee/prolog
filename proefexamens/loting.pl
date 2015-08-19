land(polen,pot1,23.806).
land(nederland,pot1,40.860).
land(spanje,pot1,43.116).
land(oekraine,pot1,28.029).
land(duitsland,pot2,40.446).
land(italie,pot2,34.357).
land(engeland,pot2,33.563).
land(rusland,pot2,33.212).
land(kroatie,pot3,33.003).
land(griekenland,pot3,32.455).
land(portugal,pot3,31.717).
land(zweden,pot3,31.675).
land(denemarken,pot4,31.205).
land(frankrijk,pot4,30.508).
land(tsjechie,pot4,29.602).
land(ierland,pot4,28.576).

loting(Loting) :-
    zet_in_groepen(Loting).
    
% zoekt alle mogelijke indeling in groepen rekening houdend met het volgende:
% Polen in A, Nederland in B, Spanje in C, Oekraïne in D
zet_in_groepen(Groepen) :-
    findall([polen, X, Y, Z], (land(X, pot2, _), land(Y, pot3, _), land(Z, pot4, _)), Groep1),
    findall([nederland, X, Y, Z], ( land(X, pot2, _), 
                                    land(Y, pot3, _), 
                                    land(Z, pot4, _) 
                                    ), Groep2),
    findall([spanje, X, Y, Z], (land(X, pot2, _), land(Y, pot3, _), land(Z, pot4, _)), Groep3),
    findall([oekraine, X, Y, Z], (land(X, pot2, _), land(Y, pot3, _), land(Z, pot4, _)), Groep4),
    member(G1, Groep1),
    member(G2, Groep2),
    nt_andere_groep(G1, G2),
    member(G3, Groep3),
    nt_andere_groep(G3, G2),
    member(G4, Groep4),  
    nt_andere_groep(G3, G4),
    nt_andere_groep(G4, G1),
    nt_andere_groep(G1, G3),
    nt_andere_groep(G4, G2),           
    Groepen = [G1, G2, G3, G4].
        
nt_andere_groep([_,A,B,C], [_,X, Y, Z]) :-
    A \= X,
    B \= Y,
    C \= Z.  
    
span_groepen([], SpGrn, SpGrn).
    
span_groepen([X|Xs],Acc, SpGrn):-
    span_groep(X, SpGr),
    Temp is Acc + SpGr,
    span_groepen(Xs, Temp, SpGrn).
    
span_groep([W,X,Y,Z], SpGr) :-
    land(W,_,A),land(X,_,B),land(Y,_,C),land(Z,_,D),
    Temp1 = abs(A - B),
    Temp2 = abs(A - C), 
    Temp3 = abs(A - D),
    Temp4 = abs(B - C),
    Temp5 = abs(B - D),
    Temp6 = abs(D - C), 
    SpGr is Temp1 + Temp2 + Temp3 + Temp4 + Temp5 + Temp6. 
    
spannendste_loting(Loting, Spannendheid) :-
    findall(Lot, loting(Lot), Lot2),
    min_span2(Lot2, Loting, Spannendheid). 

min_span2([H|T], Loting, Spannendheid) :-
    span_groepen(H,0,StartMin),
    min_span(T, StartMin, H, Loting, Spannendheid).
    
min_span([], Min, MinLoting, MinLoting, Min).
min_span([X|Xs], Min, MinLoting, Loting, Spannendheid) :-
    span_groepen(X,0,NewMin),
    (
     NewMin =< Min 
     ->
     min_span(Xs,NewMin, X, Loting, Spannendheid) 
     ;
     min_span(Xs,Min, MinLoting, Loting,Spannendheid)).           
