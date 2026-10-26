# Problema de las Ciudades con GUI

## A. Titulo del Proyecto y Resumen Ejecutivo

Problema de las Ciudades con GUI es una implementacion del clasico problema de las rutas entre ciudades de Rumania, resuelto con el algoritmo de busqueda de costo uniforme (UCS) y presentado mediante una interfaz grafica construida con la libreria PCE de SWI-Prolog. El sistema encuentra la ruta de costo minimo entre dos ciudades dentro de un grafo ponderado que representa el mapa de Rumania. Su alcance tecnologico se limita a la ejecucion local en SWI-Prolog con interfaz grafica, sin componentes de red ni persistencia de datos.

## B. Arquitectura del Sistema

El programa sigue una arquitectura de capas logicas basada en programacion logica con interfaz grafica. El flujo de datos comienza con la definicion del grafo de ciudades de Rumania y los costos de arista entre nodos. El algoritmo de busqueda de costo uniforme explora el espacio de estados expandiendo primero el nodo con menor costo acumulado, garantizando que la primera llegada al destino es el camino de costo minimo. Finalmente, la libreria PCE renderiza la ruta encontrada en una ventana grafica para el usuario. No existe comunicacion cliente-servidor ni capas de persistencia.

## C. Caracteristicas Tecnicas Clave

- Representacion del mapa de Rumania como grafo ponderado con nodos (ciudades) y aristas (rutas con costos).
- Algoritmo de busqueda de costo uniforme (UCS) para encontrar el camino de costo minimo entre dos ciudades.
- Interfaz grafica construida con la libreria PCE de SWI-Prolog que muestra las rutas y el resultado de la busqueda.
- Garantia de optimalidad: la primera llegada al nodo destino corresponde al camino de costo minimo.
- Persistencia limitada a la ejecucion en memoria; no se utiliza base de datos ni almacenamiento en disco.
- Ausencia de mecanismos de concurrencia, procesamiento en tiempo real o protocolos de red.
- Seguridad limitada al ambito de ejecucion local; no maneja datos sensibles ni autenticacion.

## D. Especificacion del Stack Tecnologico

| Categoria | Tecnologia / Librería |
|-----------|----------------------|
| Lenguaje | SWI-Prolog 8.x |
| Paradigma | Programacion logica, busqueda informada, interfaz grafica |
| Libreria GUI | PCE (SWI-Prolog) |
| Entorno | SWI-Prolog 8.x con libreria PCE |

## E. Guia de Instalacion, Configuracion y Despliegue

### Requisitos previos del sistema

- SWI-Prolog 8.x instalado con la libreria PCE.
- Acceso a terminal o consola de comandos.
- Sistema operativo con soporte para ventanas graficas (X11, Windows o macOS).

### Secuencia de comandos para clonacion e instalacion

```bash
git clone https://github.com/Matthew-Garay/CiudadesGUI.git
cd CiudadesGUI
```

### Configuracion de variables de entorno

Este proyecto no requiere archivo .env ni variables de entorno.

### Comandos para ejecucion en entorno de Desarrollo

```bash
swipl -s ciudadesGUI.pl -g "main" -t "halt"
```

### Comandos para ejecucion en entorno de Produccion

No aplica entorno de produccion separado; el programa se ejecuta localmente con el mismo comando de desarrollo.

## F. Creditos de Autoría

Desarrollado por: Matthew Ilveneff Garay Pérez
Correo Electronico: 1911.garay.perez@gmail.com
