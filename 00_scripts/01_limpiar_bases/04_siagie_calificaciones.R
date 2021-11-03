# Limpiar data SIAGIE 2020

# Cargar dataset ---------------------------------------------------------------

siagie_2020_calificaciones <- read_xlsx(file.path(bases_crudas, "02_OSEE", "01_siagie","siagie_reporte_calificaciones","siagie_2017_2020.xlsx"), sheet = "2020", col_names = TRUE ) %>% clean_names()

# Cambiar nombres a variables ---------------------------------------------------

siagie_2020_calificaciones <- siagie_2020_calificaciones %>% 
  rename(cod_mod = codigo_modular, 
         tpromguiada_siagie2020 = promocion_guiado, 
         taprobado_siagie2020 = aprobado,
         tretirado_siagie2020 = retirado,
         requiere_recup2020 = requiere_recuperacion_pedagogica,
         sin_registro_de_evaluacion2020 = sin_registro_de_evaluacion,
         fallecidos2020 = fallecidos,
         postergacion_de_evaluacion2020 = postergacion_de_evaluacion)

# Transformamos variables ------------------------------------------------------

# Convertimos a numérico
siagie_2020_calificaciones <- siagie_2020_calificaciones %>% 
  mutate_at(c(10:16), as.numeric)

# Agrupamos a nivel de cod_mod y anexo
siagie_122020_cod_mod <- siagie_2020_calificaciones %>%
  group_by(cod_mod, anexo) %>%
  summarize(taprobado_siagie2020 = sum(taprobado_siagie2020),
            tpromguiada_siagie2020 = sum(tpromguiada_siagie2020),
            requiere_recup2020 = sum(requiere_recup2020),
            postergacion_de_evaluacion2020 = sum(postergacion_de_evaluacion2020),
            tretirado_siagie2020 = sum(tretirado_siagie2020),
            sin_registro_de_evaluacion2020 = sum(sin_registro_de_evaluacion2020),
            fallecidos2020 = sum(fallecidos2020)
            )

# Generamos totales
siagie_122020_cod_mod <- siagie_122020_cod_mod %>% 
  rowwise() %>% mutate(talumno_siagie2020 = sum(c(taprobado_siagie2020,tpromguiada_siagie2020, requiere_recup2020, postergacion_de_evaluacion2020, tretirado_siagie2020, sin_registro_de_evaluacion2020, fallecidos2020)),
                       totro_estado_siagie2020 = sum(c(requiere_recup2020, postergacion_de_evaluacion2020, sin_registro_de_evaluacion2020, fallecidos2020)))

# Convertimos a numérico
siagie_122020_cod_mod$talumno_siagie2020 <- as.integer(siagie_122020_cod_mod$talumno_siagie2020)
siagie_122020_cod_mod$taprobado_siagie2020 <- as.integer(siagie_122020_cod_mod$taprobado_siagie2020)
siagie_122020_cod_mod$tpromguiada_siagie2020 <- as.integer(siagie_122020_cod_mod$tpromguiada_siagie2020)
siagie_122020_cod_mod$tretirado_siagie2020 <- as.integer(siagie_122020_cod_mod$tretirado_siagie2020)
siagie_122020_cod_mod$totro_estado_siagie2020 <- as.integer(siagie_122020_cod_mod$totro_estado_siagie2020)


# Labels
siagie_122020_cod_mod$talumno_siagie2020 <- labelled(siagie_122020_cod_mod$talumno_siagie2020, label="Total alumnos (SIAGIE Dic 2020)")
siagie_122020_cod_mod$taprobado_siagie2020 <- labelled(siagie_122020_cod_mod$taprobado_siagie2020, label="Total alumnos aprobados (SIAGIE Dic 2020)")
siagie_122020_cod_mod$tpromguiada_siagie2020 <- labelled(siagie_122020_cod_mod$tpromguiada_siagie2020, label="Total alumnos en promoción guiada (SIAGIE Dic 2020)")
siagie_122020_cod_mod$tretirado_siagie2020 <- labelled(siagie_122020_cod_mod$tretirado_siagie2020, label="Total alumnos retirados (SIAGIE Dic 2020)")
siagie_122020_cod_mod$totro_estado_siagie2020 <- labelled(siagie_122020_cod_mod$totro_estado_siagie2020, label="Total alumnos en otro estado (SIAGIE Dic 2020)")

# Guardar bases en RDS y DTA ---------------------------------------------------

write_dta(siagie_122020_cod_mod, path = file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_calificaciones", "siagie_122020_cod_mod.dta"))
write_rds(siagie_122020_cod_mod, path = file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_calificaciones", "siagie_122020_cod_mod.rds"))
