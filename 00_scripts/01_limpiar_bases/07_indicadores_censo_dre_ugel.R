# Limpiar data de indicadores CENSO DRE-UGEL

# Cargar dataset ---------------------------------------------------------------

# Porcentaje de ambientes de las DRE y UGEL que se encuentran en buen estado

ambientes_buen_estado <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         ambientes_buen_estado_2016 = x42370,
         ambientes_buen_estado_2017 = x42736,
         ambientes_buen_estado_2018 = x2018,
         ambientes_buen_estado_2019 = x2019,
         ambientes_buen_estado_2020 = x2020)

# Porcentaje de predios de las DRE y UGEL que cuentan con electricidad

predios_electricidad <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         predios_electricidad_2016 = x42370,
         predios_electricidad_2017 = x42736,
         predios_electricidad_2018 = x2018,
         predios_electricidad_2019 = x2019,
         predios_electricidad_2020 = x2020)

# Porcentaje de predios de las DRE y UGEL que cuentan con agua potable

predios_agua_potable <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         predios_agua_potable_2016 = x42370,
         predios_agua_potable_2017 = x42736,
         predios_agua_potable_2018 = x2018,
         predios_agua_potable_2019 = x2019,
         predios_agua_potable_2020 = x2020)

# Porcentaje de predios de las DRE y UGEL que cuentan con desagüe

predios_desague <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         predios_desague_2016 = x42370,
         predios_desague_2017 = x42736,
         predios_desague_2018 = x2018,
         predios_desague_2019 = x2019,
         predios_desague_2020 = x2020)

# Porcentaje de equipos informáticos operativos

equipos_inf_operativos <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         equipos_inf_operativos_2016 = x42370,
         equipos_inf_operativos_2017 = x42736,
         equipos_inf_operativos_2018 = x2018,
         equipos_inf_operativos_2019 = x2019,
         equipos_inf_operativos_2020 = x2020)

# Porcentaje de vehículos de las DRE y UGEL que se encuentran operativos

vehiculos_operativos <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         vehiculos_operativos_2016 = x42370,
         vehiculos_operativos_2017 = x42736,
         vehiculos_operativos_2018 = x2018,
         vehiculos_operativos_2019 = x2019,
         vehiculos_operativos_2020 = x2020)

# Reclamos registrados en las DRE y UGEL en el año anterior por cada cien mil estudiantes de Educación Básica Regular

reclamos <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         reclamos_2016 = x42370,
         reclamos_2017 = x42736,
         reclamos_2018 = x2018,
         reclamos_2019 = x2019,
         reclamos_2020 = x2020)

# Número promedio de especialistas del área de gestión pedagógica que desarrollan actualmente las acciones de supervisión y monitoreo

esp_pedag_monitores <- read_xlsx(file.path(bases_crudas, "02_OSEE", "03_censo_dreugel", "indicadores", "03_infraestructura", "DRE_y_UGEL_que_se_encuentran_en_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codoii =codigo_de_ugel,
         esp_pedag_monitores_2016 = x42370,
         esp_pedag_monitores_2017 = x42736,
         esp_pedag_monitores_2018 = x2018,
         esp_pedag_monitores_2019 = x2019,
         esp_pedag_monitores_2020 = x2020)

# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "ambientes_buen_estado.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "ambientes_buen_estado.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "predios_electricidad.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "predios_electricidad.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "predios_agua_potable.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "predios_agua_potable.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "predios_desague.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "predios_desague.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "equipos_inf_operativos.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "equipos_inf_operativos.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "vehiculos_operativos.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "vehiculos_operativos.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "reclamos.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "reclamos.dta"))

write_rds(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "esp_pedag_monitores.rds"))
write_dta(dre_ugel_data, path = file.path(bases_limpias, "02_OSEE", "03_censo_dreugel", "indicadores", "esp_pedag_monitores.dta"))