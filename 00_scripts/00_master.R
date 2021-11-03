
# Correr master script

# Seleccionar acciones ---------------------------------------------------------

# Limpieza de datos
limpiar_r             <- 0  # Corre script de limpieza de datos en R
limpiar_stata         <- 0  # Corre script de limpieza de datos en Stata
limpiar_python        <- 0  # Corre script de limpieza de datos en Python

# Construccion de datos
construir_bases_integradas   <- 0  # Genera datos construidos

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

# Correr codigo ----------------------------------------------------------------

# Limpiar datos
if (limpiar_r) source(file.path(scripts, "01_limpiar_bases", "00_run_r.R"))
# INPUTS
# OUTPUTS

# Construir bases
if (construir_bases_integradas) source(file.path(scripts, "02_construir_bases", "00_run.R"))
# INPUTS 
# OUTPUTS


