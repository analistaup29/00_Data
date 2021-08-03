# Limpiar data SIAGIE 2020

# Cargar dataset ---------------------------------------------------------------

siagie_2020 <- read_xlsx(file.path(bases_crudas, "02_OSEE", "01_siagie", "siagie_2017_2020.xlsx"), sheet = "2020", col_names = TRUE ) %>% clean_names()

# Cambiar nombres a variables ---------------------------------------------------

siagie_2020 <- rename(siagie_2020, cod_mod = codigo_modular, 
                      tpromocion_guiada_siagie = promocion_guiado, 
                      taprobado_siagie = aprobado,
                      tretirado_siagie = retirado,
                      requiere_recup = requiere_recuperacion_pedagogica)

# Mutar ---------------------------------------------------

siagie_2020 <- siagie_2020 %>% 
  mutate_at(c(10:16), as.numeric)

siagie_cod_mod <- siagie_2020 %>%
  group_by(cod_mod, anexo) %>%
  summarize(taprobado_siagie = sum(taprobado_siagie),
            tpromocion_guiada_siagie = sum(tpromocion_guiada_siagie),
            requiere_recup = sum(requiere_recup),
            postergacion_de_evaluacion = sum(postergacion_de_evaluacion),
            tretirado_siagie = sum(tretirado_siagie),
            sin_registro_de_evaluacion = sum(sin_registro_de_evaluacion),
            fallecidos = sum(fallecidos),
            gradiente = first(gradiente)
            )

# Guardar bases en RDS y DTA ---------------------------------------------------

write_dta(siagie_cod_mod, path = file.path(bases_crudas, "02_OSEE", "01_siagie", "siagie_cod_mod.dta"))
write_rds(siagie_cod_mod, path = file.path(bases_crudas, "02_OSEE", "01_siagie", "siagie_cod_mod.rds"))