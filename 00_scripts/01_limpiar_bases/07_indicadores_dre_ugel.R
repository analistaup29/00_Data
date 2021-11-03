# Limpiar data de indicadores CENSO DRE-UGEL

# Cargar datasets --------------------------------------------------------------

# 01_funcionario_dre_ugel ----

#Porcentaje de autoridades de DRE y UGEL  con un año o más  de permanencia en sus actuales cargos
porcent_autor_1ano <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "DRE_y_UGEL_autoridades_actuales_cargos.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

#Porcentaje de autoridades de DRE y UGEL  con un grado de magíster o doctor 1/
porcent_autor_posgrado <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "DRE_y_UGEL_autoridades_posgrado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

#Paridad de género de las autoridades de las DRE y UGEL
paridad_genero_autor <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "DRE_y_UGEL_paridad_de_genero.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# 03_infraestructura ----

# Porcentaje de predios de las DRE y UGEL que cuentan con agua potable
porcent_predios_agua <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_agua_potable.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de oficinas de las DRE y UGEL que se encuentran en buen estado
porcent_ofi_buen_estado <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_buen_estado.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de las DRE y UGEL que cuentan con desague
porcent_predios_desagu <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_desague.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de las DRE y UGEL que cuentan con electricidad 1/
porcent_predios_elect <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_electricidad.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de las DRE y UGEL cuyas paredes están construidas con ladrillos o bloques de cemento
porcent_predios_ladrillo <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_paredes_ladrillos.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de las DRE y UGEL que son de su propiedad
porcent_predios_propiedad <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_predios_propiedad.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de la DRE y UGEL que cuentan con telefonía fija propia
porcent_predios_telefija <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_telefonía_fija_propia.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de la DRE y UGEL que cuentan con telefonía móvil propia
porcent_predios_telemovil <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_telefonía_móvil_propia.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de predios de las DRE y UGEL que cuentan con los tres servicios básicos
porcent_predios_ssbb <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "DRE_y_UGEL_tres_servicios_básicos.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# 04_potencial humano ----

# Trabajadores de DRE y UGEL por cada mil estudiantes 1/
trabaj_dreugel_1000est <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "04_potencial_humano", "DRE_y_UGEL_trabajadores_x_mil_alumnos.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# 05_parque informático ----

# Porcentaje de equipos informáticos operativos
porcent_equinf_oper <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "05_parque_informatico", "DRE_UGEL-equipos_informáticos_operativos.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de vehículos operativos de las DRE y UGEL que tienen una antigüedad mayor a cinco años
porcent_vehi_oper_5anos <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "DRE_y_UGEL_vehiculos_antiguedad_mayor_a_cinco.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Porcentaje de vehículos de las DRE y UGEL que se encuentran operativos
porcent_vehi_oper <- read_xlsx(file.path(bases_crudas, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "DRE_y_UGEL_vehiculos_operativos.xlsx"), sheet = "UGEL", skip = 3) %>% 
  clean_names() 

# Limpiamos datasets -----------------------------------------------------------

porcent_autor_1ano <- porcent_autor_1ano %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_autor_1ano_2016 = x42370,
         porcent_autor_1ano_2017 = x42736,
         porcent_autor_1ano_2018 = x2018,
         porcent_autor_1ano_2019 = x2019,
         porcent_autor_1ano_2020 = x2020)

porcent_autor_posgrado <- porcent_autor_posgrado %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_autor_posgrado_2016 = x42370,
         porcent_autor_posgrado_2017 = x42736,
         porcent_autor_posgrado_2018 = x2018,
         porcent_autor_posgrado_2019 = x2019,
         porcent_autor_posgrado_2020 = x2020)
  
paridad_genero_autor  <- paridad_genero_autor  %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         paridad_genero_autor_2016 = x42370,
         paridad_genero_autor_2017 = x42736,
         paridad_genero_autor_2018 = x2018,
         paridad_genero_autor_2019 = x2019,
         paridad_genero_autor_2020 = x2020)

porcent_predios_agua <- porcent_predios_agua %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_agua_2016 = x42370,
         porcent_predios_agua_2017 = x42736,
         porcent_predios_agua_2018 = x2018,
         porcent_predios_agua_2019 = x2019,
         porcent_predios_agua_2020 = x2020)

porcent_ofi_buen_estado <- porcent_ofi_buen_estado  %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_ofi_buen_estado_2016 = x42370,
         porcent_ofi_buen_estado_2017 = x42736,
         porcent_ofi_buen_estado_2018 = x2018,
         porcent_ofi_buen_estado_2019 = x2019,
         porcent_ofi_buen_estado_2020 = x2020)

porcent_predios_desagu <- porcent_predios_desagu %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_desagu_2016 = x42370,
         porcent_predios_desagu_2017 = x42736,
         porcent_predios_desagu_2018 = x2018,
         porcent_predios_desagu_2019 = x2019,
         porcent_predios_desagu_2020 = x2020)

porcent_predios_elect <- porcent_predios_elect %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_elect_2016 = x42370,
         porcent_predios_elect_2017 = x42736,
         porcent_predios_elect_2018 = x2018,
         porcent_predios_elect_2019 = x2019,
         porcent_predios_elect_2020 = x2020)

porcent_predios_ladrillo <- porcent_predios_ladrillo %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_ladrillo_2016 = x42370,
         porcent_predios_ladrillo_2017 = x42736,
         porcent_predios_ladrillo_2018 = x2018,
         porcent_predios_ladrillo_2019 = x2019,
         porcent_predios_ladrillo_2020 = x2020)

porcent_predios_propiedad <- porcent_predios_propiedad %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_propiedad_2016 = x42370,
         porcent_predios_propiedad_2017 = x42736,
         porcent_predios_propiedad_2018 = x2018,
         porcent_predios_propiedad_2019 = x2019,
         porcent_predios_propiedad_2020 = x2020)

porcent_predios_telefija <- porcent_predios_telefija %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_telefija_2016 = x2016,
         porcent_predios_telefija_2017 = x2017,
         porcent_predios_telefija_2018 = x2018,
         porcent_predios_telefija_2019 = x2019,
         porcent_predios_telefija_2020 = x2020)

porcent_predios_telemovil <- porcent_predios_telemovil %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_telemovil_2016 = x2016,
         porcent_predios_telemovil_2017 = x2017,
         porcent_predios_telemovil_2018 = x2018,
         porcent_predios_telemovil_2019 = x2019,
         porcent_predios_telemovil_2020 = x2020)

porcent_predios_ssbb <- porcent_predios_ssbb %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_predios_ssbb_2016 = x42370,
         porcent_predios_ssbb_2017 = x42736,
         porcent_predios_ssbb_2018 = x2018,
         porcent_predios_ssbb_2019 = x2019,
         porcent_predios_ssbb_2020 = x2020)

trabaj_dreugel_1000est <- trabaj_dreugel_1000est %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         trabaj_dreugel_1000est_2017 = x2017,
         trabaj_dreugel_1000est_2018 = x2018,
         trabaj_dreugel_1000est_2019 = x2019,
         trabaj_dreugel_1000est_2020 = x2020)

porcent_equinf_oper <- porcent_equinf_oper %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_equinf_oper_2017 = x42736,
         porcent_equinf_oper_2018 = x2018,
         porcent_equinf_oper_2019 = x2019,
         porcent_equinf_oper_2020 = x2020)

porcent_vehi_oper_5anos <- porcent_vehi_oper_5anos %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_vehi_oper_5anos_2017 = x2017,
         porcent_vehi_oper_5anos_2018 = x2018,
         porcent_vehi_oper_5anos_2019 = x2019,
         porcent_vehi_oper_5anos_2020 = x2020)

porcent_vehi_oper <- porcent_vehi_oper %>%
  filter(nombre_de_la_ugel != "") %>%
  rename(codooii =codigo_de_ugel,
         nombre_dre = nombre_de_dre,
         nombre_ugel = nombre_de_la_ugel,
         porcent_vehi_oper_2016 = x2016,
         porcent_vehi_oper_2017 = x2017,
         porcent_vehi_oper_2018 = x2018,
         porcent_vehi_oper_2019 = x2019,
         porcent_vehi_oper_2020 = x2020)

# Label variables --------------------------------------------------------------

porcent_autor_1ano$codooii <- labelled(porcent_autor_1ano$codooii, label =  "Código de DRE o UGEL" )
porcent_autor_1ano$nombre_dre <- labelled(porcent_autor_1ano$nombre_dre, label =  "Nombre de la DRE" )
porcent_autor_1ano$nombre_ugel <- labelled(porcent_autor_1ano$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_autor_1ano$porcent_autor_1ano_2016 <- labelled(porcent_autor_1ano$porcent_autor_1ano_2016, label =  "Porcentaje autoridades DREUGEL con 1+ año permanencia_2016" )
porcent_autor_1ano$porcent_autor_1ano_2017 <- labelled(porcent_autor_1ano$porcent_autor_1ano_2017, label =  "Porcentaje autoridades DREUGEL con 1+ año permanencia_2017" )
porcent_autor_1ano$porcent_autor_1ano_2018 <- labelled(porcent_autor_1ano$porcent_autor_1ano_2018, label =  "Porcentaje autoridades DREUGEL con 1+ año permanencia_2018" )
porcent_autor_1ano$porcent_autor_1ano_2019 <- labelled(porcent_autor_1ano$porcent_autor_1ano_2019, label =  "Porcentaje autoridades DREUGEL con 1+ año permanencia_2019" )
porcent_autor_1ano$porcent_autor_1ano_2020 <- labelled(porcent_autor_1ano$porcent_autor_1ano_2020, label =  "Porcentaje autoridades DREUGEL con 1+ año permanencia_2020" )

porcent_autor_posgrado$codooii <- labelled(porcent_autor_posgrado$codooii, label =  "Código de DRE o UGEL" )
porcent_autor_posgrado$nombre_dre <- labelled(porcent_autor_posgrado$nombre_dre, label =  "Nombre de la DRE" )
porcent_autor_posgrado$nombre_ugel <- labelled(porcent_autor_posgrado$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_autor_posgrado$porcent_autor_posgrado_2016 <- labelled(porcent_autor_posgrado$porcent_autor_posgrado_2016, label =  "Porcentaje autoridades de DREUGEL con grado de magíster o doctor_2016" )
porcent_autor_posgrado$porcent_autor_posgrado_2017 <- labelled(porcent_autor_posgrado$porcent_autor_posgrado_2017, label =  "Porcentaje autoridades de DREUGEL con grado de magíster o doctor_2017" )
porcent_autor_posgrado$porcent_autor_posgrado_2018 <- labelled(porcent_autor_posgrado$porcent_autor_posgrado_2018, label =  "Porcentaje autoridades de DREUGEL con grado de magíster o doctor_2018" )
porcent_autor_posgrado$porcent_autor_posgrado_2019 <- labelled(porcent_autor_posgrado$porcent_autor_posgrado_2019, label =  "Porcentaje autoridades de DREUGEL con grado de magíster o doctor_2019" )
porcent_autor_posgrado$porcent_autor_posgrado_2020 <- labelled(porcent_autor_posgrado$porcent_autor_posgrado_2020, label =  "Porcentaje autoridades de DREUGEL con grado de magíster o doctor_2020" )


paridad_genero_autor$codooii <- labelled(paridad_genero_autor$codooii, label =  "Código de DRE o UGEL" )
paridad_genero_autor$nombre_dre <- labelled(paridad_genero_autor$nombre_dre, label =  "Nombre de la DRE" )
paridad_genero_autor$nombre_ugel <- labelled(paridad_genero_autor$nombre_ugel, label =  "Nombre de la UGEL" )
paridad_genero_autor$paridad_genero_autor_2016 <- labelled(paridad_genero_autor$paridad_genero_autor_2016, label =  "Paridad de género de las autoridades de las DRE y UGEL_2016" )
paridad_genero_autor$paridad_genero_autor_2017 <- labelled(paridad_genero_autor$paridad_genero_autor_2017, label =  "Paridad de género de las autoridades de las DRE y UGEL_2017" )
paridad_genero_autor$paridad_genero_autor_2018 <- labelled(paridad_genero_autor$paridad_genero_autor_2018, label =  "Paridad de género de las autoridades de las DRE y UGEL_2018" )
paridad_genero_autor$paridad_genero_autor_2019 <- labelled(paridad_genero_autor$paridad_genero_autor_2019, label =  "Paridad de género de las autoridades de las DRE y UGEL_2019" )
paridad_genero_autor$paridad_genero_autor_2020 <- labelled(paridad_genero_autor$paridad_genero_autor_2020, label =  "Paridad de género de las autoridades de las DRE y UGEL_2020" )


porcent_predios_agua$codooii <- labelled(porcent_predios_agua$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_agua$nombre_dre <- labelled(porcent_predios_agua$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_agua$nombre_ugel <- labelled(porcent_predios_agua$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_agua$porcent_predios_agua_2016 <- labelled(porcent_predios_agua$porcent_predios_agua_2016, label =  "Porcentaje de predios de las DREUGEL con agua potable_2016" )
porcent_predios_agua$porcent_predios_agua_2017 <- labelled(porcent_predios_agua$porcent_predios_agua_2017, label =  "Porcentaje de predios de las DREUGEL con agua potable_2017" )
porcent_predios_agua$porcent_predios_agua_2018 <- labelled(porcent_predios_agua$porcent_predios_agua_2018, label =  "Porcentaje de predios de las DREUGEL con agua potable_2018" )
porcent_predios_agua$porcent_predios_agua_2019 <- labelled(porcent_predios_agua$porcent_predios_agua_2019, label =  "Porcentaje de predios de las DREUGEL con agua potable_2019" )
porcent_predios_agua$porcent_predios_agua_2020 <- labelled(porcent_predios_agua$porcent_predios_agua_2020, label =  "Porcentaje de predios de las DREUGEL con agua potable_2020" )


porcent_ofi_buen_estado$codooii <- labelled(porcent_ofi_buen_estado$codooii, label =  "Código de DRE o UGEL" )
porcent_ofi_buen_estado$nombre_dre <- labelled(porcent_ofi_buen_estado$nombre_dre, label =  "Nombre de la DRE" )
porcent_ofi_buen_estado$nombre_ugel <- labelled(porcent_ofi_buen_estado$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_ofi_buen_estado$porcent_ofi_buen_estado_2016 <- labelled(porcent_ofi_buen_estado$porcent_ofi_buen_estado_2016, label =  "Porcentaje de oficinas de las DREUGEL en buen estado_2016" )
porcent_ofi_buen_estado$porcent_ofi_buen_estado_2017 <- labelled(porcent_ofi_buen_estado$porcent_ofi_buen_estado_2017, label =  "Porcentaje de oficinas de las DREUGEL en buen estado_2017" )
porcent_ofi_buen_estado$porcent_ofi_buen_estado_2018 <- labelled(porcent_ofi_buen_estado$porcent_ofi_buen_estado_2018, label =  "Porcentaje de oficinas de las DREUGEL en buen estado_2018" )
porcent_ofi_buen_estado$porcent_ofi_buen_estado_2019 <- labelled(porcent_ofi_buen_estado$porcent_ofi_buen_estado_2019, label =  "Porcentaje de oficinas de las DREUGEL en buen estado_2019" )
porcent_ofi_buen_estado$porcent_ofi_buen_estado_2020 <- labelled(porcent_ofi_buen_estado$porcent_ofi_buen_estado_2020, label =  "Porcentaje de oficinas de las DREUGEL en buen estado_2020" )


porcent_predios_desagu$codooii <- labelled(porcent_predios_desagu$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_desagu$nombre_dre <- labelled(porcent_predios_desagu$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_desagu$nombre_ugel <- labelled(porcent_predios_desagu$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_desagu$porcent_predios_desagu_2016 <- labelled(porcent_predios_desagu$porcent_predios_desagu_2016, label =  "Porcentaje de predios de las DREUGEL con desague_2016" )
porcent_predios_desagu$porcent_predios_desagu_2017 <- labelled(porcent_predios_desagu$porcent_predios_desagu_2017, label =  "Porcentaje de predios de las DREUGEL con desague_2017" )
porcent_predios_desagu$porcent_predios_desagu_2018 <- labelled(porcent_predios_desagu$porcent_predios_desagu_2018, label =  "Porcentaje de predios de las DREUGEL con desague_2018" )
porcent_predios_desagu$porcent_predios_desagu_2019 <- labelled(porcent_predios_desagu$porcent_predios_desagu_2019, label =  "Porcentaje de predios de las DREUGEL con desague_2019" )
porcent_predios_desagu$porcent_predios_desagu_2020 <- labelled(porcent_predios_desagu$porcent_predios_desagu_2020, label =  "Porcentaje de predios de las DREUGEL con desague_2020" )


porcent_predios_elect$codooii <- labelled(porcent_predios_elect$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_elect$nombre_dre <- labelled(porcent_predios_elect$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_elect$nombre_ugel <- labelled(porcent_predios_elect$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_elect$porcent_predios_elect_2016 <- labelled(porcent_predios_elect$porcent_predios_elect_2016, label =  "Porcentaje de predios de las DREUGEL con electricidad_2016" )
porcent_predios_elect$porcent_predios_elect_2017 <- labelled(porcent_predios_elect$porcent_predios_elect_2017, label =  "Porcentaje de predios de las DREUGEL con electricidad_2017" )
porcent_predios_elect$porcent_predios_elect_2018 <- labelled(porcent_predios_elect$porcent_predios_elect_2018, label =  "Porcentaje de predios de las DREUGEL con electricidad_2018" )
porcent_predios_elect$porcent_predios_elect_2019 <- labelled(porcent_predios_elect$porcent_predios_elect_2019, label =  "Porcentaje de predios de las DREUGEL con electricidad_2019" )
porcent_predios_elect$porcent_predios_elect_2020 <- labelled(porcent_predios_elect$porcent_predios_elect_2020, label =  "Porcentaje de predios de las DREUGEL con electricidad_2020" )


porcent_predios_ladrillo$codooii <- labelled(porcent_predios_ladrillo$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_ladrillo$nombre_dre <- labelled(porcent_predios_ladrillo$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_ladrillo$nombre_ugel <- labelled(porcent_predios_ladrillo$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_ladrillo$porcent_predios_ladrillo_2016 <- labelled(porcent_predios_ladrillo$porcent_predios_ladrillo_2016, label =  "Porcentaje de predios DREUGEL con paredes de ladrillos o cemento_2016" )
porcent_predios_ladrillo$porcent_predios_ladrillo_2017 <- labelled(porcent_predios_ladrillo$porcent_predios_ladrillo_2017, label =  "Porcentaje de predios DREUGEL con paredes de ladrillos o cemento_2017" )
porcent_predios_ladrillo$porcent_predios_ladrillo_2018 <- labelled(porcent_predios_ladrillo$porcent_predios_ladrillo_2018, label =  "Porcentaje de predios DREUGEL con paredes de ladrillos o cemento_2018" )
porcent_predios_ladrillo$porcent_predios_ladrillo_2019 <- labelled(porcent_predios_ladrillo$porcent_predios_ladrillo_2019, label =  "Porcentaje de predios DREUGEL con paredes de ladrillos o cemento_2019" )
porcent_predios_ladrillo$porcent_predios_ladrillo_2020 <- labelled(porcent_predios_ladrillo$porcent_predios_ladrillo_2020, label =  "Porcentaje de predios DREUGEL con paredes de ladrillos o cemento_2020" )


porcent_predios_propiedad$codooii <- labelled(porcent_predios_propiedad$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_propiedad$nombre_dre <- labelled(porcent_predios_propiedad$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_propiedad$nombre_ugel <- labelled(porcent_predios_propiedad$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_propiedad$porcent_predios_propiedad_2016 <- labelled(porcent_predios_propiedad$porcent_predios_propiedad_2016, label =  "Porcentaje de predios de las DREUGEL de su propiedad_2016" )
porcent_predios_propiedad$porcent_predios_propiedad_2017 <- labelled(porcent_predios_propiedad$porcent_predios_propiedad_2017, label =  "Porcentaje de predios de las DREUGEL de su propiedad_2017" )
porcent_predios_propiedad$porcent_predios_propiedad_2018 <- labelled(porcent_predios_propiedad$porcent_predios_propiedad_2018, label =  "Porcentaje de predios de las DREUGEL de su propiedad_2018" )
porcent_predios_propiedad$porcent_predios_propiedad_2019 <- labelled(porcent_predios_propiedad$porcent_predios_propiedad_2019, label =  "Porcentaje de predios de las DREUGEL de su propiedad_2019" )
porcent_predios_propiedad$porcent_predios_propiedad_2020 <- labelled(porcent_predios_propiedad$porcent_predios_propiedad_2020, label =  "Porcentaje de predios de las DREUGEL de su propiedad_2020" )


porcent_predios_telefija$codooii <- labelled(porcent_predios_telefija$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_telefija$nombre_dre <- labelled(porcent_predios_telefija$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_telefija$nombre_ugel <- labelled(porcent_predios_telefija$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_telefija$porcent_predios_telefija_2016 <- labelled(porcent_predios_telefija$porcent_predios_telefija_2016, label =  "Porcentaje de predios de la DREUGEL con telefonía fija propia_2016" )
porcent_predios_telefija$porcent_predios_telefija_2017 <- labelled(porcent_predios_telefija$porcent_predios_telefija_2017, label =  "Porcentaje de predios de la DREUGEL con telefonía fija propia_2017" )
porcent_predios_telefija$porcent_predios_telefija_2018 <- labelled(porcent_predios_telefija$porcent_predios_telefija_2018, label =  "Porcentaje de predios de la DREUGEL con telefonía fija propia_2018" )
porcent_predios_telefija$porcent_predios_telefija_2019 <- labelled(porcent_predios_telefija$porcent_predios_telefija_2019, label =  "Porcentaje de predios de la DREUGEL con telefonía fija propia_2019" )
porcent_predios_telefija$porcent_predios_telefija_2020 <- labelled(porcent_predios_telefija$porcent_predios_telefija_2020, label =  "Porcentaje de predios de la DREUGEL con telefonía fija propia_2020" )

porcent_predios_telemovil$codooii <- labelled(porcent_predios_telemovil$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_telemovil$nombre_dre <- labelled(porcent_predios_telemovil$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_telemovil$nombre_ugel <- labelled(porcent_predios_telemovil$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_telemovil$porcent_predios_telemovil_2016 <- labelled(porcent_predios_telemovil$porcent_predios_telemovil_2016, label =  "Porcentaje de predios de la DREUGEL con telefonía móvil propia_2016" )
porcent_predios_telemovil$porcent_predios_telemovil_2017 <- labelled(porcent_predios_telemovil$porcent_predios_telemovil_2017, label =  "Porcentaje de predios de la DREUGEL con telefonía móvil propia_2017" )
porcent_predios_telemovil$porcent_predios_telemovil_2018 <- labelled(porcent_predios_telemovil$porcent_predios_telemovil_2018, label =  "Porcentaje de predios de la DREUGEL con telefonía móvil propia_2018" )
porcent_predios_telemovil$porcent_predios_telemovil_2019 <- labelled(porcent_predios_telemovil$porcent_predios_telemovil_2019, label =  "Porcentaje de predios de la DREUGEL con telefonía móvil propia_2019" )
porcent_predios_telemovil$porcent_predios_telemovil_2020 <- labelled(porcent_predios_telemovil$porcent_predios_telemovil_2020, label =  "Porcentaje de predios de la DREUGEL con telefonía móvil propia_2020" )

porcent_predios_ssbb$codooii <- labelled(porcent_predios_ssbb$codooii, label =  "Código de DRE o UGEL" )
porcent_predios_ssbb$nombre_dre <- labelled(porcent_predios_ssbb$nombre_dre, label =  "Nombre de la DRE" )
porcent_predios_ssbb$nombre_ugel <- labelled(porcent_predios_ssbb$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_predios_ssbb$porcent_predios_ssbb_2016 <- labelled(porcent_predios_ssbb$porcent_predios_ssbb_2016, label =  "Porcentaje de predios de las DREUGEL con tres servicios básicos_2016" )
porcent_predios_ssbb$porcent_predios_ssbb_2017 <- labelled(porcent_predios_ssbb$porcent_predios_ssbb_2017, label =  "Porcentaje de predios de las DREUGEL con tres servicios básicos_2017" )
porcent_predios_ssbb$porcent_predios_ssbb_2018 <- labelled(porcent_predios_ssbb$porcent_predios_ssbb_2018, label =  "Porcentaje de predios de las DREUGEL con tres servicios básicos_2018" )
porcent_predios_ssbb$porcent_predios_ssbb_2019 <- labelled(porcent_predios_ssbb$porcent_predios_ssbb_2019, label =  "Porcentaje de predios de las DREUGEL con tres servicios básicos_2019" )
porcent_predios_ssbb$porcent_predios_ssbb_2020 <- labelled(porcent_predios_ssbb$porcent_predios_ssbb_2020, label =  "Porcentaje de predios de las DREUGEL con tres servicios básicos_2020" )


trabaj_dreugel_1000est$codooii <- labelled(trabaj_dreugel_1000est$codooii, label =  "Código de DRE o UGEL" )
trabaj_dreugel_1000est$nombre_dre <- labelled(trabaj_dreugel_1000est$nombre_dre, label =  "Nombre de la DRE" )
trabaj_dreugel_1000est$nombre_ugel <- labelled(trabaj_dreugel_1000est$nombre_ugel, label =  "Nombre de la UGEL" )

trabaj_dreugel_1000est$trabaj_dreugel_1000est_2017 <- labelled(trabaj_dreugel_1000est$trabaj_dreugel_1000est_2017, label =  "Trabajadores de DRE y UGEL por cada mil estudiantes_2017" )
trabaj_dreugel_1000est$trabaj_dreugel_1000est_2018 <- labelled(trabaj_dreugel_1000est$trabaj_dreugel_1000est_2018, label =  "Trabajadores de DRE y UGEL por cada mil estudiantes_2018" )
trabaj_dreugel_1000est$trabaj_dreugel_1000est_2019 <- labelled(trabaj_dreugel_1000est$trabaj_dreugel_1000est_2019, label =  "Trabajadores de DRE y UGEL por cada mil estudiantes_2019" )
trabaj_dreugel_1000est$trabaj_dreugel_1000est_2020 <- labelled(trabaj_dreugel_1000est$trabaj_dreugel_1000est_2020, label =  "Trabajadores de DRE y UGEL por cada mil estudiantes_2020" )

porcent_equinf_oper$codooii <- labelled(porcent_equinf_oper$codooii, label =  "Código de DRE o UGEL" )
porcent_equinf_oper$nombre_dre <- labelled(porcent_equinf_oper$nombre_dre, label =  "Nombre de la DRE" )
porcent_equinf_oper$nombre_ugel <- labelled(porcent_equinf_oper$nombre_ugel, label =  "Nombre de la UGEL" )

porcent_equinf_oper$porcent_equinf_oper_2017 <- labelled(porcent_equinf_oper$porcent_equinf_oper_2017, label =  "Porcentaje de equipos informáticos operativos_2017" )
porcent_equinf_oper$porcent_equinf_oper_2018 <- labelled(porcent_equinf_oper$porcent_equinf_oper_2018, label =  "Porcentaje de equipos informáticos operativos_2018" )
porcent_equinf_oper$porcent_equinf_oper_2019 <- labelled(porcent_equinf_oper$porcent_equinf_oper_2019, label =  "Porcentaje de equipos informáticos operativos_2019" )
porcent_equinf_oper$porcent_equinf_oper_2020 <- labelled(porcent_equinf_oper$porcent_equinf_oper_2020, label =  "Porcentaje de equipos informáticos operativos_2020" )

porcent_vehi_oper_5anos$codooii <- labelled(porcent_vehi_oper_5anos$codooii, label =  "Código de DRE o UGEL" )
porcent_vehi_oper_5anos$nombre_dre <- labelled(porcent_vehi_oper_5anos$nombre_dre, label =  "Nombre de la DRE" )
porcent_vehi_oper_5anos$nombre_ugel <- labelled(porcent_vehi_oper_5anos$nombre_ugel, label =  "Nombre de la UGEL" )

porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2017 <- labelled(porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2017, label =  "Porcentaje de vehículos operativos con antiguedad +5 años _2017" )
porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2018 <- labelled(porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2018, label =  "Porcentaje de vehículos operativos con antiguedad +5 años _2018" )
porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2019 <- labelled(porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2019, label =  "Porcentaje de vehículos operativos con antiguedad +5 años _2019" )
porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2020 <- labelled(porcent_vehi_oper_5anos$porcent_vehi_oper_5anos_2020, label =  "Porcentaje de vehículos operativos con antiguedad +5 años _2020" )

porcent_vehi_oper$codooii <- labelled(porcent_vehi_oper$codooii, label =  "Código de DRE o UGEL" )
porcent_vehi_oper$nombre_dre <- labelled(porcent_vehi_oper$nombre_dre, label =  "Nombre de la DRE" )
porcent_vehi_oper$nombre_ugel <- labelled(porcent_vehi_oper$nombre_ugel, label =  "Nombre de la UGEL" )
porcent_vehi_oper$porcent_vehi_oper_2016 <- labelled(porcent_vehi_oper$porcent_vehi_oper_2016, label =  "Porcentaje de vehículos de las DREUGEL operativos_2016" )
porcent_vehi_oper$porcent_vehi_oper_2017 <- labelled(porcent_vehi_oper$porcent_vehi_oper_2017, label =  "Porcentaje de vehículos de las DREUGEL operativos_2017" )
porcent_vehi_oper$porcent_vehi_oper_2018 <- labelled(porcent_vehi_oper$porcent_vehi_oper_2018, label =  "Porcentaje de vehículos de las DREUGEL operativos_2018" )
porcent_vehi_oper$porcent_vehi_oper_2019 <- labelled(porcent_vehi_oper$porcent_vehi_oper_2019, label =  "Porcentaje de vehículos de las DREUGEL operativos_2019" )
porcent_vehi_oper$porcent_vehi_oper_2020 <- labelled(porcent_vehi_oper$porcent_vehi_oper_2020, label =  "Porcentaje de vehículos de las DREUGEL operativos_2020" )



# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(porcent_autor_1ano, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "porcent_autor_1ano.rds"))
write_dta(porcent_autor_1ano, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "porcent_autor_1ano.dta"))

write_rds(porcent_autor_posgrado, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "porcent_autor_posgrado.rds"))
write_dta(porcent_autor_posgrado, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "porcent_autor_posgrado.dta"))

write_rds(paridad_genero_autor, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "paridad_genero_autor.rds"))
write_dta(paridad_genero_autor, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "paridad_genero_autor.dta"))

write_rds(porcent_predios_agua, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_agua.rds"))
write_dta(porcent_predios_agua, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_agua.dta"))

write_rds(porcent_ofi_buen_estado, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_ofi_buen_estado.rds"))
write_dta(porcent_ofi_buen_estado, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_ofi_buen_estado.dta"))

write_rds(porcent_predios_desagu, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_desagu.rds"))
write_dta(porcent_predios_desagu, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_desagu.dta"))

write_rds(porcent_predios_elect, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_elect.rds"))
write_dta(porcent_predios_elect, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_elect.dta"))

write_rds(porcent_predios_ladrillo, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_ladrillo.rds"))
write_dta(porcent_predios_ladrillo, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_ladrillo.dta"))

write_rds(porcent_predios_propiedad, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_propiedad.rds"))
write_dta(porcent_predios_propiedad, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_propiedad.dta"))

write_rds(porcent_predios_telefija, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_telefija.rds"))
write_dta(porcent_predios_telefija, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_telefija.dta"))

write_rds(porcent_predios_telemovil, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_telemovil.rds"))
write_dta(porcent_predios_telemovil, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_telemovil.dta"))

write_rds(porcent_predios_ssbb, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_ssbb.rds"))
write_dta(porcent_predios_ssbb, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_ssbb.dta"))

write_rds(trabaj_dreugel_1000est, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "04_potencial_humano", "trabaj_dreugel_1000est.rds"))
write_dta(trabaj_dreugel_1000est, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "04_potencial_humano", "trabaj_dreugel_1000est.dta"))

write_rds(porcent_equinf_oper, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "05_parque_informatico", "porcent_equinf_oper.rds"))
write_dta(porcent_equinf_oper, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "05_parque_informatico", "porcent_equinf_oper.dta"))

write_rds(porcent_vehi_oper_5anos, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "porcent_vehi_oper_5anos.rds"))
write_dta(porcent_vehi_oper_5anos, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "porcent_vehi_oper_5anos.dta"))

write_rds(porcent_vehi_oper, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "porcent_vehi_oper.rds"))
write_dta(porcent_vehi_oper, path = file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "porcent_vehi_oper.dta"))