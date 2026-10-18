# Guia de Instalacion - Problema de las Ciudades con GUI

Esta guia te ayuda a ejecutar el proyecto en tu entorno local.

## Requisitos previos

- SWI-Prolog 8.x con la libreria PCE instalada

## Instalacion

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Matthew-Garay/CiudadesGUI.git
   cd CiudadesGUI
   ```
2. Ejecuta el programa:
   ```bash
   swipl -s ciudadesGUI.pl -g "main" -t "halt"
   ```

## Verificacion

El programa muestra una interfaz grafica PCE con las rutas entre ciudades de Rumania usando busqueda de costo uniforme (UCS).
