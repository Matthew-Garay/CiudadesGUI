:- use_module(library(pce)).
:- use_module(library(lists)).

% ============================================================================
% Problema de las Ciudades con GUI - Busqueda de Costo Uniforme (UCS) en Prolog
% Refactorizado: punto de entrada main/0, lista de ciudades visitadas,
% visualizacion del camino de ciudades y validacion de seleccion.
% ============================================================================

% ----------------------------------------------------------------------------
% Punto de entrada principal: inicia la interfaz grafica.
% ----------------------------------------------------------------------------
main :-
    iniciar.

% ----------------------------------------------------------------------------
% Definicion del grafo de Rumania: ciudad, ciudad_adjacente, costo.
% ----------------------------------------------------------------------------
camino(oradea, zerind, 71).   camino(zerind, oradea, 71).
camino(zerind, arad, 75).     camino(arad, zerind, 75).
camino(arad, timisoara, 118). camino(timisoara, arad, 118).
camino(timisoara, lugoj, 111). camino(lugoj, timisoara, 111).
camino(lugoj, mehadia, 70).   camino(mehadia, lugoj, 70).
camino(mehadia, dobreta, 75). camino(dobreta, mehadia, 75).
camino(dobreta, craiova, 120). camino(craiova, dobreta, 120).
camino(craiova, rimnicu_vilcea, 146). camino(rimnicu_vilcea, craiova, 146).
camino(craiova, pitesti, 138). camino(pitesti, craiova, 138).
camino(arad, sibiu, 140).     camino(sibiu, arad, 140).
camino(oradea, sibiu, 151).   camino(sibiu, oradea, 151).
camino(sibiu, rimnicu_vilcea, 80). camino(rimnicu_vilcea, sibiu, 80).
camino(sibiu, fagaras, 99).   camino(fagaras, sibiu, 99).
camino(fagaras, bucurest, 211). camino(bucurest, fagaras, 211).
camino(rimnicu_vilcea, pitesti, 97). camino(pitesti, rimnicu_vilcea, 97).
camino(pitesti, bucurest, 101). camino(bucurest, pitesti, 101).
camino(bucurest, giurgiu, 90). camino(giurgiu, bucurest, 90).
camino(bucurest, urziceni, 85). camino(urziceni, bucurest, 85).
camino(urziceni, hirsova, 98). camino(hirsova, urziceni, 98).
camino(hirsova, eforie, 86).   camino(eforie, hirsova, 86).
camino(urziceni, vaslui, 142). camino(vaslui, urziceni, 142).
camino(vaslui, iasi, 92).     camino(iasi, vaslui, 92).
camino(iasi, neamt, 87).      camino(neamt, iasi, 87).

% ----------------------------------------------------------------------------
% Lista de ciudades disponibles para la interfaz grafica.
% ----------------------------------------------------------------------------
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

% ----------------------------------------------------------------------------
% Busca la ruta de costo minimo entre Inicio y Fin usando UCS.
% Devuelve una lista de ciudades que conforman el camino.
% ----------------------------------------------------------------------------
buscar_ruta(Inicio, Fin, Ruta) :-
    buscar_ruta_ucs([(0, Inicio, [Inicio])], Fin, _, RutaInversa),
    reverse(RutaInversa, Ruta).

buscar_ruta_ucs([(_, Ciudad, Camino)|_], Ciudad, _, Camino).
buscar_ruta_ucs([(Costo, Ciudad, Camino)|Resto], Fin, Visitados, Resultado) :-
    \+ memberchk(Ciudad, Visitados),
    findall(
        (NuevoCosto, Siguiente, [Siguiente | Camino]),
        (
            camino(Ciudad, Siguiente, D),
            \+ memberchk(Siguiente, Camino),
            NuevoCosto is Costo + D
        ),
        Hijos
    ),
    append(Resto, Hijos, Temp),
    keysort(Temp, Ordenado),
    buscar_ruta_ucs(Ordenado, Fin, [Ciudad | Visitados], Resultado).

% ----------------------------------------------------------------------------
% Interfaz grafica con PCE de SWI-Prolog.
% ----------------------------------------------------------------------------
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

% ----------------------------------------------------------------------------
% Manejador del boton Buscar: valida seleccion, ejecuta UCS y muestra resultado.
% ----------------------------------------------------------------------------
mostrar_ruta(Origen, Destino, Resultado) :-
    (   Origen = '', Destino = '' ->
        send(Resultado, selection, 'Seleccione ciudad de origen y destino.')
    ;   Origen = '' ->
        send(Resultado, selection, 'Seleccione ciudad de origen.')
    ;   Destino = '' ->
        send(Resultado, selection, 'Seleccione ciudad de destino.')
    ;   buscar_ruta(Origen, Destino, Lista),
        atomic_list_concat(Lista, ' -> ', Texto),
        send(Resultado, selection, Texto)
    ).