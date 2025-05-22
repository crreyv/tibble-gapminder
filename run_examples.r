# ========================
# Introducción a los Tibbles y análisis del conjunto de datos Gapminder
# ========================

# Instalamos y cargamos los paquetes necesarios
install.packages("tibble")
install.packages("dplyr")
install.packages("gapminder")
install.packages("ggplot2")


library(tibble)
library(dplyr)
library(gapminder)
library(ggplot2)

# 🟢 1. Crear un tibble desde cero
mi_tibble <- tibble(
  Nombre = c("Ana", "Carlos", "Beatriz"),
  Edad = c(25, 30, 22),
  Puntaje = c(88.5, 92.3, 79.6)
)

# Mostrar el tibble
print(mi_tibble)
mi_tibble[1,] # Mostrar la primera fila
mi_tibble[1, 2] # Mostrar la primera fila y segunda columna
mi_tibble[1, 2:3] # Mostrar la primera fila y columnas 2 a 3
mi_tibble$Nombre # Mostrar la columna "Nombre"
mi_tibble$Edad # Mostrar la columna "Edad"
mi_tibble$Puntaje # Mostrar la columna "Puntaje"
mean(mi_tibble$Puntaje) # Calcular la media de la columna "Puntaje"
# Comparar con un data.frame clásico
mi_dataframe <- data.frame(
  Nombre = c("Ana", "Carlos", "Beatriz"),
  Edad = c(25, 30, 22),
  Puntaje = c(88.5, 92.3, 79.6)
)

# Mostrar el data.framega
print(mi_dataframe)

# 2. Conversión entre tibble y data.frame

# De tibble a data.frame
df <- as.data.frame(mi_tibble)
print(df)

# De data.frame a tibble
tb <- as_tibble(mi_dataframe)
print(tb)

# Verificar clases
class(df)  # "data.frame"
class(tb)  # "tbl_df" "tbl" "data.frame"
class(mi_tibble)  # "tbl_df" "tbl" "data.frame"
class(mi_dataframe)  # "data.frame"
# ========================
# Gapminder: análisis estadístico y visualización
# ========================

# Ver los primeros registros del conjunto de datos
print(gapminder)

# Ver estructura con glimpse (dplyr)
glimpse(gapminder)

# 3. Estadísticas resumidas por continente (año más reciente: 2007)
resumen <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(
    esperanza_vida_promedio = mean(lifeExp),
    pib_percapita_promedio = mean(gdpPercap),
    poblacion_total = sum(pop)
  )

print(resumen)

#Cuantos paises hay por continente
resumen2 <- gapminder %>%
  group_by(continent) %>%
  summarise(
    paises = n_distinct(country)
  )
  print(resumen2)
# Cuantos paises hay por continente y año
resumen3 <- gapminder %>%
  group_by(continent, year) %>%
  summarise(
    paises = n_distinct(country)
  )
  print(resumen3)


# ========================
# 4. Visualización con ggplot2
# ========================

# Diagrama de dispersión PIB per cápita vs esperanza de vida (2007)
gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) +
  geom_point(alpha = 0.7) +
  scale_x_log10() +  # Escala logarítmica para PIB per cápita
  theme_minimal() +
  labs(
    title = "Esperanza de vida vs PIB per cápita (2007)",
    x = "PIB per cápita (escala logarítmica)",
    y = "Esperanza de vida"
  )

# ========================
# 5. Esperanza de vida a lo largo del tiempo (países seleccionados)
# ========================

# Selección de países
paises <- c("Colombia", "Brasil", "United States", "China")

gapminder %>%
  filter(country %in% paises) %>%
  ggplot(aes(x = year, y = lifeExp, color = country)) +
  geom_line(size = 1) +
  theme_minimal() +
  labs(
    title = "Evolución de la esperanza de vida",
    x = "Año",
    y = "Esperanza de vida"
  )


# 6. Guardar el tibble en un archivo CSV
write.csv(gapminder, "gapminder.csv", row.names = FALSE)

# 7. Leer el archivo CSV de nuevo
gapminder_leido <- read.csv("gapminder.csv")

# 8. Verificar el tipo de datos en de gapminder_leido. Convertir a tibble
# ...
# Ingresa tu código aquí
gapminder_leido <- as_tibble(gapminder_leido)
print(gapminder_leido)

# Resumen de estadísticas por continente y año
resumen1<- gapminder %>%
  group_by(continent) %>%
  summarise(
    esperanza_vida_promedio = mean(lifeExp),
    pib_percapita_promedio = mean(gdpPercap),
    poblacion_total = sum(pop)
  )
print(resumen1) 
unique((gapminder$continent)) # Ver los continentes únicos
length(unique(gapminder$continent)) # Contar los continentes únicos
# Ver los países únicos
unique(gapminder$country) # Ver los países únicos
length(unique(gapminder$country)) # Contar los países únicos
# Cuántos países hay por continente
gapminder %>% group_by(continent) %>%
summarise(
  paises = length(unique(country))
)