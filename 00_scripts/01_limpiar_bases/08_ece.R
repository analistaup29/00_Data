# Limpiar data ECE 

library("tidyverse")
library("janitor")
library("readxl")
library("RStata")
library("haven")

# Cargar dataset ---------------------------------------------------------------

# Notas ECE Segundo de secundaria
ece_2sec_2015 <- read_xlsx(file.path("C/Doc/excel.xlsx"), sheet = "IE 2S ECE 15", col_names = TRUE, skip = 2 ) %>% 
  clean_names()
ece_2sec_2016 <- read_xlsx(file.path(bases_crudas, "01_UMC", "01_ece", "IE 2S ECE 15-19.xlsx"), sheet = "IE 2S ECE 16", col_names = TRUE, skip = 2 ) %>% 
  clean_names()
ece_2sec_2018 <- read_xlsx(file.path(bases_crudas, "01_UMC", "01_ece", "IE 2S ECE 15-19.xlsx"), sheet = "IE 2S ECE 18", col_names = TRUE, skip = 2 ) %>% 
  clean_names()
ece_2sec_2019 <- read_xlsx(file.path(bases_crudas, "01_UMC", "01_ece", "IE 2S ECE 15-19.xlsx"), sheet = "IE 2S ECE 19", col_names = TRUE, skip = 2 ) %>% 
  clean_names()

# Notas ECE Cuarto de primaria
ece_4prim_2016 <- read_xlsx(file.path(bases_crudas, "01_UMC", "01_ece", "IE 4P ECE 16-18.xlsx"), sheet = "IE 4P ECE 16", col_names = TRUE, skip = 2  ) %>% 
  clean_names()
ece_4prim_2018 <- read_xlsx(file.path(bases_crudas, "01_UMC", "01_ece", "IE 4P ECE 16-18.xlsx"), sheet = "IE 4P ECE 18", col_names = TRUE, skip = 2  ) %>% 
  clean_names()

# Notas ECE Segundo de primaria

  ##Completar

# Notas ECE Cuarto de primaria EIB

  ##Completar

# Cambiar nombres a variables --------------------------------------------------

## Segundo de secundaria

ece_2sec_2015 <- ece_2sec_2015 %>%
  rename(
   lec_alumnos_prog_15 = cantidad_de_alumnos_programados,
   lec_total_ev_15 = cantidad_de_alumnos_evaluados_17,
   lec_cobertura_percent_15 = cobertura_percent_18,
   lec_total_prev_15  = previo_al_inicio_19,
   lec_total_inic_15 = en_inicio_20,
   lec_total_proc_15 = en_proceso_21,
   lec_total_sati_15 = satisfactorio_22,
   lec_porcent_prev_15 = previo_al_inicio_23,
   lec_porcent_inic_15 = en_inicio,
   lec_porcent_proc_15 = en_proceso,
   lec_porcent_sati_15 = satisfactorio_26,
   lec_medida_prom_15 = medida_promedio_de_la_ie_media_500_d_e_100_27,
   mat_total_ev_15 = cantidad_de_alumnos_evaluados_28,
   mat_cobertura_percent_15 = cobertura_percent_29,
   mat_total_prev_15 = previo_al_inicio_30,
   mat_total_inic_15 = en_inicio_31,
   mat_total_proc_15 = en_proceso_32,
   mat_total_sati_15 = satisfactorio_33,
   mat_porcent_prev_15 = previo_al_inicio_34,
   mat_porcent_inic_15 = en_inicio_35,
   mat_porcent_proc_15 = en_proceso_36,
   mat_porcent_sati_15  = satisfactorio_37,
   mat_medida_prom_15 = medida_promedio_de_la_ie_media_500_d_e_100_38,
   lec_anomalias_15 = x39,
   mat_anumalias_15 = x40
  )

ece_2sec_2016 <- ece_2sec_2016 %>%
  rename(
    lec_alumnos_prog_16 = cantidad_de_alumnos_programados,
    lec_total_ev_16 = cantidad_de_alumnos_evaluados_17,
    lec_cobertura_percent_16 = cobertura_percent_18,
    lec_total_prev_16  = previo_al_inicio_19,
    lec_total_inic_16 = en_inicio_20,
    lec_total_proc_16 = en_proceso_21,
    lec_total_sati_16 = satisfactorio_22,
    lec_porcent_prev_16 = previo_al_inicio_23,
    lec_porcent_inic_16 = en_inicio,
    lec_porcent_proc_16 = en_proceso,
    lec_porcent_sati_16 = satisfactorio_26,
    lec_medida_prom_16 = medida_promedio_de_la_ie_media_500_d_e_100_27,
    mat_total_ev_16 = cantidad_de_alumnos_evaluados_28,
    mat_cobertura_percent_16 = cobertura_percent_29,
    mat_total_prev_16 = previo_al_inicio_30,
    mat_total_inic_16 = en_inicio_31,
    mat_total_proc_16 = en_proceso_32,
    mat_total_sati_16 = satisfactorio_33,
    mat_porcent_prev_16 = previo_al_inicio_34,
    mat_porcent_inic_16 = en_inicio_35,
    mat_porcent_proc_16 = en_proceso_36,
    mat_porcent_sati_16  = satisfactorio_37,
    mat_medida_prom_16 = medida_promedio_de_la_ie_media_500_d_e_100_38,
    cso_total_ev_16 = cantidad_de_alumnos_evaluados_39,
    cso_cobertura_percent_16 = cobertura_percent_40,
    cso_total_prev_16 = previo_al_inicio_41,
    cso_total_inic_16 = en_inicio_42,
    cso_total_proc_16 = en_proceso_43,
    cso_total_sati_16 = satisfactorio_44,
    cso_porcent_prev_16 = previo_al_inicio_45,
    cso_porcent_inic_16 = en_inicio_46,
    cso_porcent_proc_16 = en_proceso_47,
    cso_porcent_sati_16 = satisfactorio_48,
    cso_medida_prom_16 = medida_promedio_de_la_ie_media_500_d_e_100_49,
    lec_anomalias_16 = x50,
    mat_anomalias_16 = x51,
    cso_anomalias_16 = x52,
    lec_anomalias_15_16 = x53,
    mat_anomalias_15_16 = x54,
  )

ece_2sec_2018 <- ece_2sec_2018 %>%
  rename(
    lec_alumnos_prog_18 = cantidad_de_alumnos_programados,
    lec_total_ev_18 = cantidad_de_alumnos_evaluados_17,
    lec_cobertura_percent_18 = cobertura_percent_18,
    lec_total_prev_18  = previo_al_inicio_19,
    lec_total_inic_18 = en_inicio_20,
    lec_total_proc_18 = en_proceso_21,
    lec_total_sati_18 = satisfactorio_22,
    lec_porcent_prev_18 = previo_al_inicio_23,
    lec_porcent_inic_18 = en_inicio,
    lec_porcent_proc_18 = en_proceso,
    lec_porcent_sati_18 = satisfactorio_26,
    lec_medida_prom_18 = medida_promedio_de_la_ie_media_500_d_e_100_27,
    mat_total_ev_18 = cantidad_de_alumnos_evaluados_28,
    mat_cobertura_percent_18 = cobertura_percent_29,
    mat_total_prev_18 = previo_al_inicio_30,
    mat_total_inic_18 = en_inicio_31,
    mat_total_proc_18 = en_proceso_32,
    mat_total_sati_18 = satisfactorio_33,
    mat_porcent_prev_18 = previo_al_inicio_34,
    mat_porcent_inic_18 = en_inicio_35,
    mat_porcent_proc_18 = en_proceso_36,
    mat_porcent_sati_18  = satisfactorio_37,
    mat_medida_prom_18 = medida_promedio_de_la_ie_media_500_d_e_100_38,
    cso_total_ev_18 = cantidad_de_alumnos_evaluados_39,
    cso_cobertura_percent_18 = cobertura_percent_40,
    cso_total_prev_18 = previo_al_inicio_41,
    cso_total_inic_18 = en_inicio_42,
    cso_total_proc_18 = en_proceso_43,
    cso_total_sati_18 = satisfactorio_44,
    cso_porcent_prev_18 = previo_al_inicio_45,
    cso_porcent_inic_18 = en_inicio_46,
    cso_porcent_proc_18 = en_proceso_47,
    cso_porcent_sati_18 = satisfactorio_48,
    cso_medida_prom_18 = medida_promedio_de_la_ie_media_500_d_e_100_49,
    cte_total_ev_18 = cantidad_de_alumnos_evaluados_50,
    cte_cobertura_percent_18 = cobertura_percent_51,
    cte_total_prev_18 = previo_al_inicio_52,
    cte_total_inic_18 = en_inicio_53,
    cte_total_proc_18 = en_proceso_54,
    cte_total_sati_18 = satisfactorio_55,
    cte_porcent_prev_18 = previo_al_inicio_56,
    cte_porcent_inic_18 = en_inicio_57,
    cte_porcent_proc_18 = en_proceso_58,
    cte_porcent_sati_18 = satisfactorio_59,
    cte_medida_prom_18 = medida_promedio_de_la_ie_media_500_d_e_100_60,
    lec_anomalias_18 = obs1_l,
    mat_anomalias_18 = obs1_m,
    cso_anomalias_18 = obs1_h,
    cte_anomalias_18 = obs1_c,
    lec_anomalias_16_18 = x65,
    mat_anomalias_16_18 = x66,
    cso_anomalias_16_18 = x67,
  )

ece_2sec_2019 <- ece_2sec_2019 %>%
  rename(
    lec_alumnos_prog_19 = cantidad_de_alumnos_programados,
    lec_total_ev_19 = cantidad_de_alumnos_evaluados_17,
    lec_cobertura_percent_19 = cobertura_percent_18,
    lec_total_prev_19  = previo_al_inicio_19,
    lec_total_inic_19 = en_inicio_20,
    lec_total_proc_19 = en_proceso_21,
    lec_total_sati_19 = satisfactorio_22,
    lec_porcent_prev_19 = previo_al_inicio_23,
    lec_porcent_inic_19 = en_inicio,
    lec_porcent_proc_19 = en_proceso,
    lec_porcent_sati_19 = satisfactorio_26,
    lec_medida_prom_19 = medida_promedio_de_la_ie_media_500_d_e_100_27,
    mat_total_ev_19 = cantidad_de_alumnos_evaluados_28,
    mat_cobertura_percent_19 = cobertura_percent_29,
    mat_total_prev_19 = previo_al_inicio_30,
    mat_total_inic_19 = en_inicio_31,
    mat_total_proc_19 = en_proceso_32,
    mat_total_sati_19 = satisfactorio_33,
    mat_porcent_prev_19 = previo_al_inicio_34,
    mat_porcent_inic_19 = en_inicio_35,
    mat_porcent_proc_19 = en_proceso_36,
    mat_porcent_sati_19  = satisfactorio_37,
    mat_medida_prom_19 = medida_promedio_de_la_ie_media_500_d_e_100_38,
    cte_total_ev_19 = cantidad_de_alumnos_evaluados_39,
    cte_cobertura_percent_19 = cobertura_percent_40,
    cte_total_prev_19 = previo_al_inicio_41,
    cte_total_inic_19 = en_inicio_42,
    cte_total_proc_19 = en_proceso_43,
    cte_total_sati_19 = satisfactorio_44,
    cte_porcent_prev_19 = previo_al_inicio_45,
    cte_porcent_inic_19 = en_inicio_46,
    cte_porcent_proc_19 = en_proceso_47,
    cte_porcent_sati_19 = satisfactorio_48,
    cte_medida_prom_19 = medida_promedio_de_la_ie_media_500_d_e_100_49,
    lec_anomalias_19 = obs1_l,
    mat_anomalias_19 = obs1_m,
    cte_anomalias_19 = obs1_c,
    lec_anomalias_18_19 = x53,
    mat_anomalias_18_19 = x54,
    cso_anomalias_18_19 = x55,
  )

## Cuarto primaria





## Segundo primaria





## Cuarto primaria EIB





# Merge bases de datos ---------------------------------------------------------

# Merge base 2do secundaria
ece_2sec <- ece_2sec_2015 %>%
  left_join(ece_2sec_2016, by = c('cod_mod', "anexo")) %>%
  left_join(ece_2sec_2018, by = c('cod_mod', "anexo")) %>%
  left_join(ece_2sec_2019, by = c('cod_mod', "anexo")) %>%
  distinct()

# Guardar bases de datos limpias -----------------------------------------------

write_rds(ece_2sec, "C:/XX")
write_dta(ece_2sec, location)




