# Construir data base integrada a nivel de servicio educativo (código modular)

# Cargar dataset ---------------------------------------------------------------

padron_iiee <- read_rds(file.path(bases_limpias, "02_OSEE", "04_padron_iiee", "padron_iiee_limpia.rds"))
padron_asignacion_anexo4 <- read_rds(file.path(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo4_limpio.rds"))
padron_asignacion_anexo5 <- read_rds(file.path(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo5_limpio.rds"))
padron_asignacion_anexo6 <- read_rds(file.path(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo6_limpio.rds"))
registro_eib <- read_rds(file.path(bases_limpias, "02_OSEE", "06_registro_eib", "registro_eib_limpio.rds"))
siagie_122020_cod_mod_calif <- read_rds(file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_calificaciones", "siagie_122020_cod_mod.rds"))
siagie_072021_cod_mod_matri <- read_rds(file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_matricula", "siagie_072021_codmod.rds"))


# Construir/mantener variables de interés --------------------------------------

## Padrón IIEE

padron_iiee <- padron_iiee %>% 
  select(cod_mod, anexo, codlocal, codooii, d_dreugel, codgeo, d_dpto, d_prov, d_dist, d_region, codcp_inei, codccpp, cen_pob, dareacenso, nlat_ie, nlong_ie,  niv_mod, d_niv_mod, d_forma, d_cod_car, d_tipssexo, d_gestion, d_ges_dep, d_tipoprog, d_cod_tur, d_estado, d_fte_dato, talum_hom_censo, talum_muj_censo, talumno_censo, tdocente_censo, tseccion_censo, fecha_act)

# Registro EIB
registro_eib <- mutate(registro_eib, eib = c("EIB"))

registro_eib <- registro_eib %>%
  select(cod_mod, anexo, eib, forma_atencion_eib, lengua_originariaeib1, lengua_originariaeib2, lengua_originariaeib3)

# SIAGIE 2020 (calificaciones y total alumnos)
siagie_122020_cod_mod_calif <- siagie_122020_cod_mod_calif %>% 
  rowwise() %>% mutate(talumno_siagie2020 = sum(c(taprobado_siagie2020,tpromguiada_siagie2020, requiere_recup2020, postergacion_de_evaluacion2020, tretirado_siagie2020, sin_registro_de_evaluacion2020, fallecidos2020)),
                      totro_estado_siagie2020 = sum(c(requiere_recup2020, postergacion_de_evaluacion2020, sin_registro_de_evaluacion2020, fallecidos2020)))

siagie_122020_cod_mod_calif <- siagie_122020_cod_mod_calif %>% select(cod_mod, anexo, talumno_siagie2020, taprobado_siagie2020, tpromguiada_siagie2020, tretirado_siagie2020, totro_estado_siagie2020)

siagie_122020_cod_mod_calif$talumno_siagie2020 <- as.integer(siagie_122020_cod_mod_calif$talumno_siagie2020)
siagie_122020_cod_mod_calif$taprobado_siagie2020 <- as.integer(siagie_122020_cod_mod_calif$taprobado_siagie2020)
siagie_122020_cod_mod_calif$tpromguiada_siagie2020 <- as.integer(siagie_122020_cod_mod_calif$tpromguiada_siagie2020)
siagie_122020_cod_mod_calif$tretirado_siagie2020 <- as.integer(siagie_122020_cod_mod_calif$tretirado_siagie2020)
siagie_122020_cod_mod_calif$totro_estado_siagie2020 <- as.integer(siagie_122020_cod_mod_calif$totro_estado_siagie2020)

# SIAGIE 2021 (Matricula ultimo corte)

## Padrón de asignación temporal

# Tipo de ruralidad
padron_asignacion_anexo4 <- select(tipo_de_ruralidad, padron_asignacion_anexo4, cod_mod, anexo)

# IIEE en zona de frontera
padron_asignacion_anexo5 <- mutate(padron_asignacion_anexo5, zona_frontera = c("Si"))
padron_asignacion_anexo5 <- select(padron_asignacion_anexo5, cod_mod, anexo, zona_frontera)

# IIEE en VRAEM
padron_asignacion_anexo6 <- mutate(padron_asignacion_anexo6, vraem = c("Si"))
padron_asignacion_anexo6 <- select(padron_asignacion_anexo6, cod_mod, anexo, vraem, intervencion_vraem)

# Construir base integrada a nivel de servicio educativo (cod_mod) -------------

base_integrada_cod_mod <- padron_iiee %>%
  left_join(siagie_122020_cod_mod_calif, by = c('cod_mod', "anexo")) %>%
  left_join(siagie_072021_cod_mod_matri, by = c('cod_mod', "anexo")) %>%
  left_join(registro_eib, by = c('cod_mod', "anexo")) %>%
  left_join(padron_asignacion_anexo4, by = c('cod_mod', "anexo")) %>%
  left_join(padron_asignacion_anexo5, by = c('cod_mod', "anexo")) %>%
  left_join(padron_asignacion_anexo6, by = c('cod_mod', "anexo")) %>%
  distinct()

# Añadir labels y factores -----------------------------------------------------

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(eib = replace(eib, is.na(eib) , "No EIB"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(forma_atencion_eib = replace(forma_atencion_eib, is.na(forma_atencion_eib), "No aplica"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(lengua_originariaeib1 = replace(lengua_originariaeib1, is.na(lengua_originariaeib1) & eib != "EIB", "No aplica"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(lengua_originariaeib2 = replace(lengua_originariaeib2, is.na(lengua_originariaeib2) & eib != "EIB", "No aplica"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(lengua_originariaeib3 = replace(lengua_originariaeib3, is.na(lengua_originariaeib3) & eib != "EIB", "No aplica"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(zona_frontera = replace(zona_frontera, is.na(zona_frontera), "No"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(vraem = replace(vraem, is.na(vraem), "No"))

base_integrada_cod_mod <- base_integrada_cod_mod %>% 
  mutate(intervencion_vraem = replace(intervencion_vraem, is.na(intervencion_vraem), "No aplica"))

# Definir levels de variables---------------------------------------------------

eib_levels <- c(
  eib1 = "No EIB",
  eib2 = "EIB"
)

forma_eib_levels <- c(
  forma_eib1 = "EIB de fortalecimiento",
  forma_eib2 = "EIB de revitalización",
  forma_eib3 = "EIB en ámbitos urbanos",
  forma_eib4 = "No aplica"
)

zona_frontera_levels <- c(
  zona_frontera1 = "No",
  zona_frontera2 = "Si"
)

vraem_levels <- c(
  vraem1 = "No",
  vraem2 = "Si"
)

influencia_vraem_levels <- c(
  influencia_vraem1 = "DIRECTA",
  influencia_vraem2 = "INFLUENCIA",
  influencia_vraem3 = "NO APLICA"
)

# Añadir labels y factores -----------------------------------------------------

base_integrada_cod_mod$talumno_siagie2020 <- labelled(base_integrada_cod_mod$talumno_siagie2020, label="Total alumnos (SIAGIE Dic 2020)")
base_integrada_cod_mod$taprobado_siagie2020 <- labelled(base_integrada_cod_mod$taprobado_siagie2020, label="Total alumnos aprobados (SIAGIE Dic 2020)")
base_integrada_cod_mod$tpromguiada_siagie2020 <- labelled(base_integrada_cod_mod$tpromguiada_siagie2020, label="Total alumnos en promoción guiada (SIAGIE Dic 2020)")
base_integrada_cod_mod$tretirado_siagie2020 <- labelled(base_integrada_cod_mod$tretirado_siagie2020, label="Total alumnos retirados (SIAGIE Dic 2020)")
base_integrada_cod_mod$totro_estado_siagie2020 <- labelled(base_integrada_cod_mod$totro_estado_siagie2020, label="Total alumnos en otro estado (SIAGIE Dic 2020)")
base_integrada_cod_mod$talumno_siagie2021 <- labelled(base_integrada_cod_mod$talumno_siagie2021, label="Total alumnos (SIAGIE Jul 2021)")
base_integrada_cod_mod$lengua_originariaeib1 <- labelled(base_integrada_cod_mod$lengua_originariaeib1, label="Lengua originaria 1 (Registro EIB 2019)")
base_integrada_cod_mod$lengua_originariaeib2 <- labelled(base_integrada_cod_mod$lengua_originariaeib2, label="Lengua originaria 2 (Registro EIB 2019)")
base_integrada_cod_mod$lengua_originariaeib3 <- labelled(base_integrada_cod_mod$lengua_originariaeib3, label="Lengua originaria 3 (Registro EIB 2019)")
base_integrada_cod_mod$tipo_de_ruralidad <- labelled(base_integrada_cod_mod$tipo_de_ruralidad, label="Tipo de Ruralidad (RM 028-2021)")


base_integrada_cod_mod$eib <- labelled(base_integrada_cod_mod$eib, label="IIEE es EIB (Registro EIB 2019)", labels = eib_levels)
base_integrada_cod_mod$eib <- haven::as_factor(base_integrada_cod_mod$eib, levels = "values")

base_integrada_cod_mod$forma_atencion_eib <- labelled(base_integrada_cod_mod$forma_atencion_eib, label="Forma EIB (Registro EIB 2019)", labels = forma_eib_levels)
base_integrada_cod_mod$forma_atencion_eib <-  haven::as_factor(base_integrada_cod_mod$forma_atencion_eib, levels = "values")

base_integrada_cod_mod$zona_frontera <- labelled(base_integrada_cod_mod$zona_frontera, label="IIEE se encuentra en zona de frontera (RM 028-2021)", labels = zona_frontera_levels)
base_integrada_cod_mod$zona_frontera <-  haven::as_factor(base_integrada_cod_mod$zona_frontera, levels = "values")

base_integrada_cod_mod$vraem <- labelled(base_integrada_cod_mod$vraem, label="IIEE se encuentra en zona de influencia VRAEM (RM 028-2021)", labels = vraem_levels)
base_integrada_cod_mod$vraem <-  haven::as_factor(base_integrada_cod_mod$vraem, levels = "values")

base_integrada_cod_mod$intervencion_vraem <- labelled(base_integrada_cod_mod$intervencion_vraem, label="Tipo de intervencion IIEE Vraem (RM 028-2021)", labels = influencia_vraem_levels)
base_integrada_cod_mod$intervencion_vraem <-  haven::as_factor(base_integrada_cod_mod$intervencion_vraem, levels = "values")

# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(base_integrada_cod_mod, path = file.path(bases_construidas, "01_bases_integradas", "base_integrada_cod_mod.rds"))
write_dta(base_integrada_cod_mod, path = file.path(bases_construidas, "01_bases_integradas", "base_integrada_cod_mod.dta"))

