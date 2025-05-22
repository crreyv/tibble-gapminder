# Análisis de Datos con Tibbles y Gapminder

Este repositorio contiene un script de R que demuestra el uso de tibbles y el análisis del conjunto de datos Gapminder, incluyendo visualizaciones y manipulación de datos.

## 📋 Contenido

El script `run_examples.r` incluye los siguientes ejemplos:

1. **Creación y manipulación de Tibbles**
   - Creación de un tibble desde cero
   - Comparación con data.frames tradicionales
   - Conversión entre tibbles y data.frames

2. **Análisis del conjunto de datos Gapminder**
   - Exploración inicial de los datos
   - Estadísticas resumidas por continente
   - Visualizaciones con ggplot2

3. **Visualizaciones**
   - Diagrama de dispersión: PIB per cápita vs Esperanza de vida
   - Gráfico de líneas: Evolución de la esperanza de vida por país

4. **Manejo de archivos**
   - Exportación de datos a CSV
   - Importación de datos desde CSV

## 🚀 Requisitos

Para ejecutar este script, necesitas tener instalado R y los siguientes paquetes:

```r
install.packages(c("tibble", "dplyr", "gapminder", "ggplot2"))
```

## 📦 Paquetes utilizados

- `tibble`: Para manejo de datos en formato tibble
- `dplyr`: Para manipulación de datos
- `gapminder`: Conjunto de datos de ejemplo
- `ggplot2`: Para visualizaciones

## 💻 Cómo usar

1. Clona este repositorio
2. Abre R o RStudio
3. Ejecuta el script `run_examples.r`


## 🔍 Estructura de los datos

El conjunto de datos Gapminder incluye las siguientes variables:
- `country`: Nombre del país
- `continent`: Continente
- `year`: Año
- `lifeExp`: Esperanza de vida
- `pop`: Población
- `gdpPercap`: PIB per cápita

## 📚 Recursos adicionales

- [Documentación de tibble](https://tibble.tidyverse.org/)
- [Documentación de dplyr](https://dplyr.tidyverse.org/)
- [Documentación de ggplot2](https://ggplot2.tidyverse.org/)