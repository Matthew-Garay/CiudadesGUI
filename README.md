# Problema de las ciudades con GUI

Práctica de Inteligencia Artificial en Prolog. Resuelve el problema de las
ciudades de Rumanía y lo presenta en una ventana gráfica.

El problema es el clásico de las rutas entre ciudades: se elige una ciudad de
origen y una de destino, y hay que devolver el camino de menor distancia total.

## El grafo

Cada `camino/3` declara una carretera en los dos sentidos, con su distancia en
kilómetros:

```prolog
camino(oradea, zerind, 71). camino(zerind, oradea, 71).
camino(zerind, arad, 75).   camino(arad, zerind, 75).
...
```

Son 19 ciudades: oradea, zerind, arad, sibiu, timisoara, lugoj, mehadia,
dobreta, craiova, rimnicu_vilcea, pitesti, fagaras, bucurest, giurgiu,
urziceni, hirsova, eforie, vaslui, iasi y neamt.

## El algoritmo

`buscar_ruta/3` implementa una **búsqueda de coste uniforme**. En vez de una
cola con prioridad, mantiene la lista de nodos pendientes ordenada por el coste
acumulado:

```prolog
buscar_ruta(Inicio, Fin, RutaDistancias) :-
    ucs([(0, Inicio, [])], Fin, RutaDistancias).
```

En cada paso:

- `findall/3` genera los vecinos cuyo coste no está ya en el camino recorrido
- `append/3` los añade al resto de la cola
- `sort/2` reordena la cola por coste

Como la lista está siempre ordenada y se expande el primero, el primer camino que
llega al destino es el de menor distancia total. Se usa `memberchk/2` para no
volver a pasar por una carretera ya recorrida.

## La ventana

`iniciar/0` construye la interfaz con la biblioteca **PCE** (Prolog Constraint
Engine):

- dos menús desplegables, origen y destino, rellenos con `forall/2` sobre `ciudad/1`
- un botón que dispara `mostrar_ruta/4`
- una etiqueta donde se imprime el resultado, con `atomic_list_concat/3` para
  juntar las distancias

## Cómo ejecutarlo

Hace falta [SWI-Prolog](https://www.swi-prolog.org/) **con soporte de PCE**, que
viene incluido en la instalación estándar pero necesita un entorno gráfico para
poder abrir la ventana.

```bash
swipl ciudadesGUI.pl
```

```prolog
?- iniciar.
```

Para probar el algoritmo sin abrir la ventana:

```prolog
?- buscar_ruta(arad, bucurest, Ruta).
?- buscar_ruta(urziceni, neamt, Ruta).
```

Este archivo ya estaba en UTF-8 y no necesitó correcciones.
