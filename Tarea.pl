%functores:
%pirata(nombre, litrosDeRon).
%soldado(nombre, armada).
%criatura(nombre, cantidadDeAñosSinPisarTierra).
 
barco(perlaNegra, pirata(jackSparrow, 1000)).
barco(holandesErrante, criatura(davyJones,80)).
barco(interceptor, soldado(jamesNorrington, marinaRealBritanica)).
 
tripulante(perlaNegra, pirata(jackSparrow, 999999999)).
tripulante(perlaNegra, pirata(willTurner, 88)).
tripulante(perlaNegra, pirata(elizabethSwann, 66)).
tripulante(holandesErrante,  criatura(davyJones,80)).
tripulante(holandesErrante, soldado(jamesNorrington, marinaRealBritanica)).
tripulante(holandesErrante, pirata(barbossa, 65)).

esSoldado(soldado(_,_)).
esPirata(pirata(_,_)).
esCriatura(criatura(_,_)).

tieneMasRon(pirata(_,RonPirata),pirata(_,RonOtroPirata)) :- RonPirata > RonOtroPirata.

esDavyJones(criatura(davyJones,_)).

puedeRobar(Pirata, Barco):-
	esPirata(Pirata),
	barco(Barco,Capitan),
	esSoldado(Capitan).

puedeRobar(Pirata, Barco) :-
	esPirata(Pirata),
	barco(Barco,Capitan),
	esPirata(Capitan),
	Pirata\=Capitan,
	tieneMasRon(Pirata,Capitan).

puedeRobar(Pirata,Barco):-
	esPirata(Pirata),
	barco(Barco,Capitan),
	esCriatura(Capitan),
	not(esDavyJones(Capitan)).