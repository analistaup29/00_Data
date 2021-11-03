# Construir data base integrada a nivel de servicio educativo (código modular)

# Cargar datasets --------------------------------------------------------------

# Padron Web Escale
padron_iiee <- read_rds(file.path(bases_limpias, "02_OSEE", "04_padron_iiee", "padron_iiee_limpia.rds"))

# Padrones de Instituciones educativas públicas - RM 028-2021-MINEDU Anexo 4
padron_asignacion_anexo4 <- read_rds(file.path(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo4_limpio.rds"))

# Padrones de Instituciones educativas públicas - RM 028-2021-MINEDU Anexo 5
padron_asignacion_anexo5 <- read_rds(file.path(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo5_limpio.rds"))

# Padrones de Instituciones educativas públicas - RM 028-2021-MINEDU Anexo 6
padron_asignacion_anexo6 <- read_rds(file.path(bases_limpias, "02_OSEE", "07_padron_asignaciones_temporales", "padron_anexo6_limpio.rds"))

# Registro EIB RVM 185-2019-MINEDU
registro_eib <- read_rds(file.path(bases_limpias, "02_OSEE", "06_registro_eib", "registro_eib_limpio.rds"))

# SIAGIE DIC 2020
siagie_122020_cod_mod_calif <- read_rds(file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_calificaciones", "siagie_122020_cod_mod.rds"))

# SIAGIE JUL 2021
siagie_072021_cod_mod_matri <- read_rds(file.path(bases_limpias, "02_OSEE", "01_siagie", "siagie_reporte_matricula", "siagie_072021_codmod.rds"))

# ECE 2 SECUNDARIA
ece_2sec <- read_rds(file.path(bases_limpias, "01_UMC","01_ece", "ece_2sec_cod_mod.rds"))

# Mantenemos variables que se incorporan a la base integrada -------------------

## Padrón IIEE ----

padron_iiee <- padron_iiee %>% 
  select(cod_mod, 
         anexo, 
         cen_edu, 
         codlocal, 
         codooii, 
         d_dreugel, 
         codgeo, 
         d_dpto, 
         d_prov, 
         d_dist, 
         d_region, 
         codcp_inei, 
         codccpp, 
         cen_pob, 
         dareacenso, 
         nlat_ie, 
         nlong_ie,  
         niv_mod, 
         d_niv_mod, 
         d_forma, 
         d_cod_car,
         d_tipssexo, 
         d_gestion, 
         d_ges_dep, 
         d_tipoprog, 
         d_cod_tur, 
         d_estado,
         d_fte_dato, 
         talum_hom_censo, 
         talum_muj_censo, 
         talumno_censo, 
         tdocente_censo, 
         tseccion_censo, 
         fecha_act)

## Registro EIB  ----

registro_eib <- registro_eib %>%
  select(cod_mod, 
         anexo, 
         eib, 
         forma_atencion_eib)

## SIAGIE 2020 (calificaciones y total alumnos)  ----

siagie_122020_cod_mod_calif <- siagie_122020_cod_mod_calif %>% 
  select(cod_mod, 
         anexo, 
         talumno_siagie2020, 
         taprobado_siagie2020, 
         tpromguiada_siagie2020, 
         tretirado_siagie2020, 
         totro_estado_siagie2020)


# SIAGIE 2021 (Matricula ultimo corte) ----

## Padrones de Instituciones educativas públicas - RM 028-2021-MINEDU ----

# Anexo 4 - Tipo de ruralidad
padron_asignacion_anexo4 <- padron_asignacion_anexo4 %>% 
  select(tipo_de_ruralidad, 
         cod_mod, 
         anexo)

# Anexo 5 - IIEE en zona de frontera
padron_asignacion_anexo5 <- padron_asignacion_anexo5 %>%
  select(cod_mod,
         anexo, 
         zona_frontera)

# Anexo 6 - IIEE en VRAEM
padron_asignacion_anexo6 <- padron_asignacion_anexo6 %>%
  select(cod_mod, 
         anexo, 
         vraem, 
         intervencion_vraem)


## Evaluaciones censales y muestrales 2do secundaria ----

ece_2sec <- ece_2sec %>%
  select(cod_mod,
         anexo,
         lec_porcent_prev_18,
         lec_porcent_inic_18,
         lec_porcent_proc_18,
         lec_porcent_sati_18,
         mat_porcent_prev_18,
         mat_porcent_inic_18,
         mat_porcent_proc_18,
         mat_porcent_sati_18,
         cte_porcent_prev_18,
         cte_porcent_inic_18,
         cte_porcent_proc_18,
         cte_porcent_sati_18,
         lec_porcent_prev_19,
         lec_porcent_inic_19,
         lec_porcent_proc_19,
         lec_porcent_sati_19,
         mat_porcent_prev_19,
         mat_porcent_inic_19,
         mat_porcent_proc_19,
         mat_porcent_sati_19,
         cte_porcent_prev_19,
         cte_porcent_inic_19,
         cte_porcent_proc_19,
         cte_porcent_sati_19
         )



# Unimos bases de datos --------------------------------------------------------

base_integrada_cod_mod <- padron_iiee %>%
  left_join(siagie_122020_cod_mod_calif, by = c('cod_mod', "anexo")) %>%
  left_join(siagie_072021_cod_mod_matri, by = c('cod_mod', "anexo")) %>%
  left_join(registro_eib, by = c('cod_mod', "anexo")) %>%
  left_join(padron_asignacion_anexo4, by = c('cod_mod', "anexo")) %>%
  left_join(padron_asignacion_anexo5, by = c('cod_mod', "anexo")) %>%
  left_join(padron_asignacion_anexo6, by = c('cod_mod', "anexo")) %>%
  left_join(ece_2sec, by = c('cod_mod', "anexo"))
  distinct()

# AÃ±adir labels y factores -----------------------------------------------------

# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(eib = replace(eib, is.na(eib) , "No EIB"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(forma_atencion_eib = replace(forma_atencion_eib, is.na(forma_atencion_eib), "No aplica"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(lengua_originariaeib1 = replace(lengua_originariaeib1, is.na(lengua_originariaeib1) & eib != "EIB", "No aplica"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(lengua_originariaeib2 = replace(lengua_originariaeib2, is.na(lengua_originariaeib2) & eib != "EIB", "No aplica"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(lengua_originariaeib3 = replace(lengua_originariaeib3, is.na(lengua_originariaeib3) & eib != "EIB", "No aplica"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(zona_frontera = replace(zona_frontera, is.na(zona_frontera), "No"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(vraem = replace(vraem, is.na(vraem), "No"))
# 
# base_integrada_cod_mod <- base_integrada_cod_mod %>% 
#   mutate(intervencion_vraem = replace(intervencion_vraem, is.na(intervencion_vraem), "No aplica"))

# Definir levels de variables---------------------------------------------------

# eib_levels <- c(
#   eib1 = "No EIB",
#   eib2 = "EIB"
# )
# 
# forma_eib_levels <- c(
#   forma_eib1 = "EIB de fortalecimiento",
#   forma_eib2 = "EIB de revitalización",
#   forma_eib3 = "EIB en ámbitos urbanos",
#   forma_eib4 = "No aplica"
# )
# 
# zona_frontera_levels <- c(
#   zona_frontera1 = "No",
#   zona_frontera2 = "Si"
# )
# 
# vraem_levels <- c(
#   vraem1 = "No",
#   vraem2 = "Si"
# )
# 
# influencia_vraem_levels <- c(
#   influencia_vraem1 = "DIRECTA",
#   influencia_vraem2 = "INFLUENCIA",
#   influencia_vraem3 = "NO APLICA"
# )

# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(base_integrada_cod_mod, path = file.path(bases_construidas, "01_bases_integradas", "base_integrada_cod_mod.rds"))
write_dta(base_integrada_cod_mod, path = file.path(bases_construidas, "01_bases_integradas", "base_integrada_cod_mod.dta"))

