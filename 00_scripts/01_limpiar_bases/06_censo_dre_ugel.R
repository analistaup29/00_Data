# Limpiar data SIAGIE 2021 cortes mensuales

# Cargar dataset ---------------------------------------------------------------

siagie_072021_codmod <- read_xlsx(file.path(bases_crudas, "02_OSEE", "01_siagie", "siagie_reporte_matricula","SIAGIE Reporte Matricula 31072021.xlsx"), sheet = "JULIO_2021", col_names = TRUE ) %>% clean_names()

# Cambiar nombres a variables y colapsar ---------------------------------------

siagie_072021_codmod <- siagie_072021_codmod %>%
  group_by(cod_mod, anexo) %>%
  summarize(talumno_siagie2021 = sum(total))

siagie_072021_codmod$talumno_siagie2021 <- as.integer(siagie_072021_codmod$talumno_siagie2021)


# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(siagie_072021_codmod, path = file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_matricula", "siagie_072021_codmod.rds"))
write_dta(siagie_072021_codmod, path = file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_matricula", "siagie_072021_codmod.dta"))
