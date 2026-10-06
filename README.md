# Problema de las ciudades con GUI

Practica de IA en Prolog. El clasico de las rutas entre ciudades de Rumania resuelto con busqueda de costo uniforme, y con ventana grafica hecha con la libreria PCE.

Cada `camino/3` declara una carretera en ambos sentidos con su distancia en kilometros. El algoritmo mantiene la lista de pendientes ordenada por costo acumulado, asi que el primer camino que llega al destino es el mas corto.

## Requisitos

SWI-Prolog con soporte de PCE y un entorno grafico para abrir la ventana.

## Uso

```bash
swipl ciudadesGUI.pl
```

```prolog
?- iniciar.
```

Sin la ventana tambien se puede probar el algoritmo directo:

```prolog
?- buscar_ruta(arad, bucurest, Ruta).
```
