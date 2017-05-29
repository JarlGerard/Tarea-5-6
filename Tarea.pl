%functores:
%pirata(nombre, litrosDeRon).
%soldado(nombre, armada).
%criatura(nombre, cantidadDeAñosSinPisarTierra).
 
barco(perlaNegra, pirata(jackSparrow, 1000)).
barco(holandesErrante, criatura(davyJones,80)).
 
tripulante(perlaNegra, pirata(jackSparrow, 999999999)).
tripulante(perlaNegra, pirata(willTurner, 88)).
tripulante(perlaNegra, pirata(elizabethSwann, 66)).
tripulante(holandesErrante,  criatura(davyJones,80)).
tripulante(holandesErrante, soldado(jamesNorrington, marinaRealBritanica)).
tripulante(holandesErrante, pirata(barbossa, 65)).

esSoldado(soldado(_,_)).
esPirata(pirata(_,_)).
esCriatura(criatura(_,_)).

tieneMasRon(pirata(_,ronPirata),pirata(_,ronOtroPirata)) :- ronPirata > ronOtroPirata.

puedeRobar(Pirata, barco(_,Capitan)):-
	esPirata(Pirata),
	esSoldado(Capitan).
puedeRobar(Pirata, barco(_,Capitan)) :-
	esPirata(Pirata),
	esPirata(Capitan),
	Pirata\=Capitan,
	tieneMasRon(Pirata,Capitan).
