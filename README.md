<div align="center">

# Problema de las Ciudades con GUI

**Práctica de Inteligencia Artificial en Prolog** — rutas entre ciudades de Rumania con búsqueda de costo uniforme e interfaz gráfica PCE.

[![SWI-Prolog](https://img.shields.io/badge/SWI--Prolog-8.x-007ACC?style=flat-square)](https://www.swi-prolog.org/)
[![PCE](https://img.shields.io/badge/GUI-PCE-6f42c1?style=flat-square)](https://www.swi-prolog.org/pldoc/man?section=pce)
[![IA](https://img.shields.io/badge/IA-UCS-2ea44f?style=flat-square)]()

</div>

---

## Descripción

El clásico problema de las **rutas entre ciudades de Rumania** resuelto con **búsqueda de costo uniforme (UCS)** y presentado con una **ventana gráfica** construida con la librería **PCE** de SWI-Prolog.

Es una práctica académica de Inteligencia Artificial que demuestra la búsqueda informada por costo acumulado: el primer camino que llega al destino es siempre el más corto.

## Características

- **20 ciudades** de Rumania conectadas por carreteras con distancia en kilómetros (doble sentido).
- **Búsqueda de costo uniforme (UCS):** la lista de pendientes se mantiene ordenada por costo acumulado.
- **Interfaz gráfica (GUI)** con la librería PCE: selector de origen y destino y botón de búsqueda.
- Resultado mostrado en pantalla como lista de distancias acumuladas.

## Tecnologías utilizadas

- **Lenguaje:** Prolog
- **Intérprete:** SWI-Prolog 8.x con soporte de **PCE** (entorno gráfico)

## Requisitos previos

- SWI-Prolog con la librería `pce` instalada.
- Un entorno gráfico (Windows nativo o X11 en Linux) para abrir la ventana.

## Instalación

```bash
git clone https://github.com/Matthew-Garay/CiudadesGUI.git
cd CiudadesGUI
swipl ciudadesGUI.pl
```

## Uso

**Con interfaz gráfica:**

```prolog
?- iniciar.
```

Se abre una ventana donde eliges **origen** y **destino** y pulsas *Buscar*.

**Sin ventana (algoritmo directo):**

```prolog
?- buscar_ruta(arad, bucurest, Ruta).
```

## Estructura del proyecto

```
CiudadesGUI/
├── ciudadesGUI.pl               # Programa Prolog (rutas + UCS + GUI PCE)
├── Práctica 15. Problema de las ciudades con GUI.pdf
├── IA práctica ciudades con GUI.pdf
└── README.md
```

## Licencia

Proyecto académico y educativo; puedes usarlo libremente con fines de aprendizaje.

## Autor

**Matthew Garay** — [GitHub](https://github.com/Matthew-Garay)

