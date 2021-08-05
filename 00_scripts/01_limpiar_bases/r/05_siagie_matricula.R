# Limpiar data SIAGIE 2021 cortes mensuales

# Cargar dataset ---------------------------------------------------------------

siagie_2020 <- read_xlsx(file.path(bases_crudas, "02_OSEE", "01_siagie", "siagie_2017_2020.xlsx"), sheet = "2020", col_names = TRUE ) %>% clean_names()

# Cambiar nombres a variables ---------------------------------------------------



# Mutar ---------------------------------------------------



# Guardar bases en RDS y DTA ---------------------------------------------------

# SE SUBE A CARPETA CLEAN