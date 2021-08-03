# Limpiar padrones de asignaciones temporales


# Cargar dataset ---------------------------------------------------------------

padron_anexo1 <- read_xlsx(filepath(bases_crudas, "02_OSEE", "07_padron_asignaciones_temporales", "anexo-1-padron-de-instituciones-educativas-unidocentes-y-multigrado-2021.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()
padron_anexo2 <- read_xlsx(filepath(bases_crudas, "02_OSEE", "07_padron_asignaciones_temporales", "anexo-2-padron-de-ie-publicas-bilingues-de-ebr-del-nivel-inicial-escolarizado-primaria-y-secundaria-2021.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()
padron_anexo3 <- read_xlsx(filepath(bases_crudas, "02_OSEE", "07_padron_asignaciones_temporales", "anexo-3-padron-de-docentes-bilingues-acreditados-2021.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()
padron_anexo4 <- read_xlsx(filepath(bases_crudas, "02_OSEE", "07_padron_asignaciones_temporales", "anexo-4-padron-de-instituciones-educativas-rurales-y-su-grado-de-ruralidad-2021.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()
padron_anexo5 <- read_xlsx(filepath(bases_crudas, "02_OSEE", "07_padron_asignaciones_temporales", "anexo-5-padron-de-instituciones-educativas-ubicadas-en-zona-de-frontera-2021.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()
padron_anexo6 <- read_xlsx(filepath(bases_crudas, "02_OSEE", "07_padron_asignaciones_temporales", "anexo-6-padron-de-instituciones-educativas-ubicadas-en-vraem-2021.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()

# Cambiar nombres a variables ---------------------------------------------------

padron_anexo4 <- rename(padron_anexo4, cod_mod = codigo_modular_ie)
padron_anexo5 <- rename(padron_anexo5, cod_mod = codigo_modular_ie)
padron_anexo6 <- rename(padron_anexo6, cod_mod = codigo_modular_ie)

# Generar variable anexo
padron_anexo4 <- padron_anexo4 %>% 
  group_by(cod_mod) %>% 
  mutate(anexo = n()-1)

padron_anexo5 <- padron_anexo5 %>% 
  group_by(cod_mod) %>% 
  mutate(anexo = n()-1)

padron_anexo6 <- padron_anexo6 %>% 
  group_by(cod_mod) %>% 
  mutate(anexo = n()-1)

padron_anexo4$anexo <- as.character(padron_anexo4$anexo)
padron_anexo5$anexo <- as.character(padron_anexo5$anexo)
padron_anexo6$anexo <- as.character(padron_anexo6$anexo)


# Guardar bases en RDS y DTA ---------------------------------------------------

write_dta(padron_anexo1, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo1_limpio.dta"))
write_dta(padron_anexo2, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo2_limpio.dta"))
write_dta(padron_anexo3, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo3_limpio.dta"))
write_dta(padron_anexo4, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo4_limpio.dta"))
write_dta(padron_anexo5, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo5_limpio.dta"))
write_dta(padron_anexo6, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo6_limpio.dta"))

write_rds(padron_anexo1, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo1_limpio.rds"))
write_rds(padron_anexo2, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo2_limpio.rds"))
write_rds(padron_anexo3, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo3_limpio.rds"))
write_rds(padron_anexo4, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo4_limpio.rds"))
write_rds(padron_anexo5, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo5_limpio.rds"))
write_rds(padron_anexo6, path = filepath(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo6_limpio.rds"))

