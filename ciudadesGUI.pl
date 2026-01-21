:- use_module(library(pce)).

% Rutas Ciuddaes de Rumania Izquierda,Derecha
camino(oradea, zerind, 71). camino(zerind, oradea, 71).
camino(zerind, arad, 75). camino(arad, zerind, 75).
camino(arad, timisoara, 118). camino(timisoara, arad, 118).
camino(timisoara, lugoj, 111). camino(lugoj, timisoara, 111).
camino(lugoj, mehadia, 70). camino(mehadia, lugoj, 70).
camino(mehadia, dobreta, 75). camino(dobreta, mehadia, 75).
camino(dobreta, craiova, 120). camino(craiova, dobreta, 120).
camino(craiova, rimnicu_vilcea, 146). camino(rimnicu_vilcea, craiova, 146).
camino(craiova, pitesti, 138). camino(pitesti, craiova, 138).
camino(arad, sibiu, 140). camino(sibiu, arad, 140).
camino(oradea, sibiu, 151). camino(sibiu, oradea, 151).
camino(sibiu, rimnicu_vilcea, 80). camino(rimnicu_vilcea, sibiu, 80).
camino(sibiu, fagaras, 99). camino(fagaras, sibiu, 99).
camino(fagaras, bucurest, 211). camino(bucurest, fagaras, 211).
camino(rimnicu_vilcea, pitesti, 97). camino(pitesti, rimnicu_vilcea, 97).
camino(pitesti, bucurest, 101). camino(bucurest, pitesti, 101).
camino(bucurest, giurgiu, 90). camino(giurgiu, bucurest, 90).
camino(bucurest, urziceni, 85). camino(urziceni, bucurest, 85).
camino(urziceni, hirsova, 98). camino(hirsova, urziceni, 98).
camino(hirsova, eforie, 86). camino(eforie, hirsova, 86).
camino(urziceni, vaslui, 142). camino(vaslui, urziceni, 142).
camino(vaslui, iasi, 92). camino(iasi, vaslui, 92).
camino(iasi, neamt, 87). camino(neamt, iasi, 87).

% Ciudades para GUI
ciudad(oradea).
ciudad(zerind).
ciudad(arad).
ciudad(sibiu).
ciudad(timisoara).
ciudad(lugoj).
ciudad(mehadia).
ciudad(dobreta).
ciudad(craiova).
ciudad(rimnicu_vilcea).
ciudad(pitesti).
ciudad(fagaras).
ciudad(bucurest).
ciudad(giurgiu).
ciudad(urziceni).
ciudad(hirsova).
ciudad(eforie).
ciudad(vaslui).
ciudad(iasi).
ciudad(neamt).

% Ruta de ciudades
buscar_ruta(Inicio, Fin, RutaDistancias) :-
    ucs([(0, Inicio, [])], Fin, RutaDistancias).

ucs([(_, Ciudad, Distancias)|_], Ciudad, Distancias).
ucs([(Costo, Ciudad, Distancias)|Resto], Fin, Resultado) :-
    findall(
        (NuevoCosto, Siguiente, NuevaLista),
        (
            camino(Ciudad, Siguiente, D),
            \+ memberchk(D, Distancias),
            NuevoCosto is Costo + D,
            append(Distancias, [D], NuevaLista)
        ),
        Hijos
    ),
    append(Resto, Hijos, Temp),
    sort(Temp, Ordenado),
    ucs(Ordenado, Fin, Resultado).

% Gui con las ciudades
iniciar :-
    new(Dialogo, dialog('Rutas en Rumania')),
    new(Menu1, menu(origen, choice)),
    new(Menu2, menu(destino, choice)),

    forall(ciudad(C), send(Menu1, append, C)),
    forall(ciudad(C), send(Menu2, append, C)),

    send(Dialogo, append, Menu1),
    send(Dialogo, append, Menu2),

    new(Resultado, label('Seleccione origen y destino')),
    send(Dialogo, append, Resultado),

    new(Boton, button('Buscar',
            message(@prolog, mostrar_ruta, Menu1?selection, Menu2?selection, Resultado))),

    send(Dialogo, append, Boton),
    send(Dialogo, open).

mostrar_ruta(Origen, Destino, Resultado) :-
    buscar_ruta(Origen, Destino, Lista),
    atomic_list_concat(Lista, ', ', Texto),
    send(Resultado, selection, Texto).
