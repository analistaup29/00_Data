# Limpiar data CENSO DRE-UGEL

# Cargar dataset ---------------------------------------------------------------
dre_ugel_data <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "2020", "00. Modulo 0", "CARATULA_1.xlsx")) %>% clean_names()

# Cambiar nombres a variables --------------------------------------------------

dre_ugel_data <- dre_ugel_data %>% 
  rename(codooii = cod_id,
         nombre_dre_ugel = m0_p02,
         es_ejecutora = m0_p04,
         nombre_dependencia = m0_p05,
         codooii_dependencia = m0_p06,
         d_dpto = m0_p07,
         d_prov = m0_p08,
         d_dis = m0_p09,
         nombre_ccpp = m0_p10,
         n_long_dreugel = m0_p13_1,
         n_lat_dreugel = m0_p13_2,
         precision_coordenadas = m0_p14)

# Seleccionar variables de interés ---------------------------------------------

dre_ugel_data <- dre_ugel_data %>% 
  select(codooii, nombre_dre_ugel, es_ejecutora, nombre_dependencia, codooii_dependencia, d_dpto, d_prov, d_dis, nombre_ccpp, n_long_dreugel, n_lat_dreugel, precision_coordenadas)

# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "2020", "dre_ugel_caratula.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "2020", "dre_ugel_caratula.dta"))