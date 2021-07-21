
# Correr master script

# Seleccionar acciones ---------------------------------------------------------------------

# Limpieza de datos
limpiar_r             <- 1  # Corre script de limpieza de datos en R
limpiar_stata         <- 1  # Corre script de limpieza de datos en Stata
limpiar_python        <- 1  # Corre script de limpieza de datos en Python

# Construccion de datos
construir_bases_integradas   <- 0  # Genera data construida

# Rutas de Usuario ---------------------------------------------------------------------

# PC Minedu Santiago
if (Sys.getenv("USERNAME") == "analistaup18") {
  data        <- file.path("B:/OneDrive - Ministerio de Educación/unidad_B/0. Data",
                           fsep = .Platform$file.sep)
  ruta_stata  <- file.path("D:/Stata15/StataSE-64",
                           fsep = .Platform$file.sep)
}

# PC Brandon casa
if (Sys.getenv("USER") == "bran") {
  github    <- file.path("/Users/bran/Documents/GitHub/data_upp",
                         fsep = .Platform$file.sep)
  onedrive  <- file.path("B:/OneDrive - Ministerio de Educación/unidad_B/0. Data")
}


# Paquetes utilizados ---------------------------------------------------------------------

packages <- c("tidyverse",
              "haven",
              "readxl",
              "janitor",
              "lubridate",
              "RStata",
              "reticulate",
              "Miniconda")

# Instalar paquetes 

sapply(packages, function(x){
  if(!(x %in% installed.packages())){
    install.packages(x, dependencies = TRUE)
  }
})

# Cargar paquetes
invisible(sapply(packages, require, character.only = TRUE))

# Especificar versión de Stata
options("RStata.StataPath" = ruta_stata)
options("RStata.StataVersion"  = 15)


# Globales ---------------------------------------------------------------------

scripts               <- file.path(data, "00_scripts")
bases_crudas          <- file.path(data, "01_bases_crudas")
bases_limpias         <- file.path(data, "02_bases_limpias")
bases_integradas      <- file.path(data, "03_bases_integradas")

# Correr codigo ------------------------------------------------------------------

# Limpiar datos de codigo R
if (limpiar_r) source(file.path(scripts, "01_limpiar_bases", "00_run_r.R"))
# INPUTS
#  file.path(data_source1, "raw","") 
# OUTPUTS
#  file.path(data_source1, "clean", "")

# Limpiar datos de codigo en Stata
if (limpiar_stata) stata(file.path(scripts, "01_limpiar_bases", "00_run_stata.do"))
# INPUTS
#  file.path(data_source2, "raw","") #
# OUTPUTS 
#  file.path(data_source2, "clean", "") #

# Limpiar datos de codigo en Python
if (limpiar_python) py_run_file(file.path(scripts, "01_limpiar_bases", "00_run_python.py"))
# INPUTS
#  file.path(data_source3, "raw","") 
# OUTPUTS 
#  file.path(data_source3, "clean", "") 

# Construct variables and analysis dataset
if (construir_bases_integradas) source(file.path(scripts, "02_construir_bases", "01_construir_baseintegrada.R"))
# INPUTS 
#  file.path(data_source1, "clean", "") 
# OUTPUTS
#  file.path(data_construct, "data_constructed.rds") 


