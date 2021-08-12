# Limpiar data de indicadores CENSO DRE-UGEL

# Cargar dataset ---------------------------------------------------------------

# Paridad de género de las autoridades de las DRE y UGEL
paridad_genero <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "01_funcionario_dre_ugel", "Censo_DRE_UGEL-Paridad_de_genero.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         paridad_genero_2016 = x42370,
         paridad_genero_2017 = x42736,
         paridad_genero_2018 = x2018,
         paridad_genero_2019 = x2019,
         paridad_genero_2020 = x2020)

# Porcentaje de ambientes de las DRE y UGEL que se encuentran en buen estado

buen_estado <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names()

DRE_y_UGEL_que_se_encuentran_en_buen_estado


# Porcentaje de predios de las DRE y UGEL que cuentan con los tres servicios básicos
# 
# Porcentaje de predios de las DRE y UGEL que cuentan con electricidad
# 
# Porcentaje de predios de las DRE y UGEL que cuentan con agua potable
# 
# Porcentaje de predios de las DRE y UGEL que cuentan con desagüe
# 
# Porcentaje de equipos informáticos operativos
# 
# Porcentaje de DRE y UGEL conectadas a Internet
# 
# Porcentaje de vehículos de las DRE y UGEL que se encuentran operativos
# 
# Reclamos registrados en las DRE y UGEL en el año anterior por cada cien mil estudiantes de Educación Básica Regular
# 
# Número promedio de especialistas del área de gestión pedagógica que desarrollan actualmente las acciones de supervisión y monitoreo



dre_ugel_data <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "2020", "indicadores", "", "")) %>% clean_names()

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