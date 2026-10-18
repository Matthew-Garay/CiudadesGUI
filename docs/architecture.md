# Arquitectura - Problema de las Ciudades con GUI

## Visión general

Problema de las rutas entre ciudades de Rumania resuelto con búsqueda de costo uniforme (UCS) e interfaz gráfica PCE en SWI-Prolog.

## Decisiones de arquitectura

### ADR-001: Búsqueda de costo uniforme con GUI

**Estado:** Aceptado  
**Contexto:** Se requiere encontrar la ruta de menor costo entre ciudades y mostrarla visualmente.  
**Decisión:** Usar UCS para garantizar el camino de costo mínimo, y la librería PCE de SWI-Prolog para la interfaz gráfica.  
**Consecuencias:** Camino óptimo garantizado, depende de la librería PCE para la interfaz.

## Tecnologías

- SWI-Prolog 8.x
- Librería PCE (interfaz gráfica)
