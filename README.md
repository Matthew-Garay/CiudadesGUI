# Problema de las Ciudades con GUI

<p align="center">
  <a href="https://github.com/Matthew-Garay/CiudadesGUI/actions/workflows/ci.yml"><img src="https://github.com/Matthew-Garay/CiudadesGUI/actions/workflows/ci.yml/badge.svg" alt="CI Status"/></a>
  <a href="https://github.com/Matthew-Garay/CiudadesGUI/security/dependabot"><img src="https://img.shields.io/badge/Dependabot-enabled-blue?style=flat-square&logo=github&labelColor=555555" alt="Dependabot"/></a>
</p>

El clasico problema de las rutas entre ciudades de Rumania resuelto con busqueda de costo uniforme (UCS) y presentado con una ventana grafica construida con la librería PCE de SWI-Prolog.

## Stack tecnologico

- **Lenguaje:** SWI-Prolog
- **Paradigma:** Programacion logica, busqueda informada, interfaz grafica
- **Entorno:** SWI-Prolog 8.x con libreria PCE

## Arquitectura

```mermaid
graph TD
    A[Ciudades de Rumania] --> B[Grafo con costos de arista]
    B --> C[Busqueda de costo uniforme UCS]
    C --> D[Ruta de costo minimo]
    D --> E[Interfaz grafica PCE]
    
    style A fill:#e1f5fe,stroke:#01579b
    style B fill:#fff3e0,stroke:#e65100
    style C fill:#e8f5e9,stroke:#1b5e20
    style D fill:#f3e5f5,stroke:#4a148c
    style E fill:#ffe0b2,stroke:#ef6c00
```

## Caracteristicas

- Rutas entre ciudades de Rumania con costos asociados
- Busqueda de costo uniforme (UCS) para camino optimo
- Interfaz grafica con la libreria PCE de SWI-Prolog
- Primera llegada al destino es siempre el camino mas corto

## Como ejecutar

### Requisitos previos

- SWI-Prolog 8.x con la libreria PCE instalada

### Ejecucion

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Matthew-Garay/CiudadesGUI.git
   cd CiudadesGUI
   ```
2. Ejecuta el archivo principal con SWI-Prolog:
   ```bash
   swipl -s ciudadesGUI.pl -g "main" -t "halt"
   ```
3. Se abre una ventana grafica mostrando las rutas entre ciudades.

## Estructura del proyecto

```
CiudadesGUI/
├── ciudadesGUI.pl           # Codigo fuente en Prolog
├── .gitignore               # Archivos excluidos del control de versiones
├── LICENSE                  # Licencia MIT
├── README.md                # Este archivo
└── docs/                    # Documentacion extendida
    ├── setup-guide.md       # Guia de instalacion
    └── architecture.md      # Diagrama de arquitectura
```

## Contacto

<p align="center">
  <a href="mailto:1911.garay.perez@gmail.com"><img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/></a>
  <a href="https://www.linkedin.com/in/matthewgarayperez/"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/></a>
</p>
