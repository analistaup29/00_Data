# Correr master script

# Seleccionar acciones ---------------------------------------------------------

# Limpieza de datos
limpiar_padron_iiee         <- 0 # Limpia padron de IIEE
limpiar_padrones_asig_temp  <- 0 # Limpia padrones de asignaciones temporales
limpiar_registro_eib        <- 0 # Limpia registro EIB 2019
limpiar_siagie_notas        <- 0 # Limpia padron SIAGIE 2020 notas
limpiar_siagie_matricula    <- 0 # Limpia padron SIAGIE 2021 matriculas

# Limpieza de datos
construir_base_cod_mod      <- 0 # Construye base a nivel de servicio educativo

# Rutas de Usuario -------------------------------------------------------------

# PC Analista UP 18
if (Sys.getenv("USERNAME") == "analistaup18") {
  data        <- file.path("B:/OneDrive - Ministerio de Educación/unidad_B/00_Data",
                           fsep = .Platform$file.sep)
  github      <- file.path("C:/Users/ANALISTAUP18/Documents/GitHub/00_Data",
                           fsep = .Platform$file.sep)
}

# PC Analista UP 15
if (Sys.getenv("USERNAME") == "analistaup15") {
  data        <- file.path("B:/OneDrive - Ministerio de Educación/unidad_B/00_Data",
                           fsep = .Platform$file.sep)
  github      <- file.path("C:/Users/ANALISTAUP15/Documents/GitHub/00_Data",
                           fsep = .Platform$file.sep)
}

# PC Analista UP 29
if (Sys.getenv("USERNAME") == "ANALISTAUP29") {
  data        <- file.path("B:/OneDrive - Ministerio de Educación/unidad_B/00_Data",
                           fsep = .Platform$file.sep)
  github      <- file.path("C:/Users/ANALISTAUP29/Documents/GitHub/00_Data",
                           fsep = .Platform$file.sep)
}

# PC Brandon
if (Sys.getenv("USER") == "bran") {
  data        <- file.path("/Users/bran/OneDrive - Ministerio de Educación/temp_data/00_Data",
                           fsep = .Platform$file.sep)
  github      <- file.path("/Users/bran/Documents/GitHub/00_Data",
                           fsep = .Platform$file.sep)
}
# Paquetes utilizados ---------------------------------------------------------------------

packages <- c("tidyverse",
              "haven",
              "readxl",
              "janitor",
              "lubridate",
              "RStata",
              "reticulate",
              "foreign",
              "Miniconda")

# Instalar paquetes 

sapply(packages, function(x){
  if(!(x %in% installed.packages())){
    install.packages(x, dependencies = TRUE)
  }
})

# Cargar paquetes
invisible(sapply(packages, require, character.only = TRUE))

# Globales ---------------------------------------------------------------------

scripts               <- file.path(github, "00_scripts")
bases_crudas          <- file.path(data, "01_bases_crudas")
bases_limpias         <- file.path(data, "02_bases_limpias")
bases_construidas     <- file.path(data, "03_bases_construidas")

# Correr codigo (limpieza) -----------------------------------------------------

# Limpia padron de IIEE
if (limpiar_padron_iiee) source(file.path(scripts, "01_limpiar_bases", "01_padron_iiee.R"))

# Limpia padrones de asignaciones temporales
if (limpiar_padrones_asig_temp) source(file.path(scripts, "01_limpiar_bases", "02_padron_asignaciones_temporales.R"))

# Limpia registro EIB 2019
if (limpiar_registro_eib) source(file.path(scripts, "01_limpiar_bases", "03_registro_eib.R"))

# Limpia padron SIAGIE 2020
if (limpiar_siagie_notas) source(file.path(scripts, "01_limpiar_bases", "04_siagie_notas.R"))

# Limpia padron SIAGIE 2020
if (limpiar_siagie_matricula) source(file.path(scripts, "01_limpiar_bases", "05_siagie_matricula.R"))


# Correr código (basas integradas) ---------------------------------------------

# Construir base a nivel de servicio educativo
if (construir_base_cod_mod) source(file.path(scripts, "02_construir_bases", "01_base_integrada_cod_mod.R"))

