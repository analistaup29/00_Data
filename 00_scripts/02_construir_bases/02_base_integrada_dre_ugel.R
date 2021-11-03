# Construir data base integrada a nivel de codooii

# Cargar datasets ---------------------------------------------------------------

porcent_autor_1ano <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "porcent_autor_1ano.rds"))
porcent_autor_posgrado <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "porcent_autor_posgrado.rds"))
paridad_genero_autor <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "01_funcionario_dre_ugel", "paridad_genero_autor.rds"))
porcent_predios_agua <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_agua.rds"))
porcent_ofi_buen_estado <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_ofi_buen_estado.rds"))
porcent_predios_desagu <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_desagu.rds"))
porcent_predios_elect <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_elect.rds"))
porcent_predios_ladrillo <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_ladrillo.rds"))
porcent_predios_propiedad <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_propiedad.rds"))
porcent_predios_telefija <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_telefija.rds"))
porcent_predios_telemovil <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_telemovil.rds"))
porcent_predios_ssbb <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "03_infraestructura", "porcent_predios_ssbb.rds"))
trabaj_dreugel_1000est <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "04_potencial_humano", "trabaj_dreugel_1000est.rds"))
porcent_equinf_oper <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "05_parque_informatico", "porcent_equinf_oper.rds"))
porcent_vehi_oper_5anos <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "porcent_vehi_oper_5anos.rds"))
porcent_vehi_oper <- read_rds(file.path(bases_limpias, "02_OSEE", "08_indicadores_dreugel", "08_parque_automotor", "porcent_vehi_oper.rds"))

# Mantener variables de interés ------------------------------------------------

var_id <- porcent_predios_agua %>%
  select(nombre_dre,
         nombre_ugel,
         codooii)

porcent_autor_1ano <- porcent_autor_1ano %>%
  select(codooii,
         porcent_autor_1ano_2020)
porcent_autor_posgrado <- porcent_autor_posgrado %>%
  select(codooii,
         porcent_autor_posgrado_2020)
paridad_genero_autor <- paridad_genero_autor %>%
  select(codooii,
         paridad_genero_autor_2020)
porcent_predios_agua <- porcent_predios_agua %>%
  select(codooii,
         porcent_predios_agua_2020)
porcent_ofi_buen_estado <- porcent_ofi_buen_estado %>%
  select(codooii,
         porcent_ofi_buen_estado_2020)
porcent_predios_desagu <- porcent_predios_desagu %>%
  select(codooii,
         porcent_predios_desagu_2020)
porcent_predios_elect <- porcent_predios_elect %>%
  select(codooii,
         porcent_predios_elect_2020)
porcent_predios_ladrillo <- porcent_predios_ladrillo %>%
  select(codooii,
         porcent_predios_ladrillo_2020)
porcent_predios_propiedad <- porcent_predios_propiedad %>%
  select(codooii,
         porcent_predios_propiedad_2020)
porcent_predios_telefija <- porcent_predios_telefija %>%
  select(codooii,
         porcent_predios_telefija_2020)
porcent_predios_telemovil <- porcent_predios_telemovil %>%
  select(codooii,
         porcent_predios_telemovil_2020)
porcent_predios_ssbb <- porcent_predios_ssbb %>%
  select(codooii,
         porcent_predios_ssbb_2020)
trabaj_dreugel_1000est <- trabaj_dreugel_1000est %>%
  select(codooii,
         trabaj_dreugel_1000est_2020)
porcent_equinf_oper <- porcent_equinf_oper %>%
  select(codooii,
         porcent_equinf_oper_2020)
porcent_vehi_oper_5anos <- porcent_vehi_oper_5anos %>%
  select(codooii,
         porcent_vehi_oper_5anos_2020)
porcent_vehi_oper <- porcent_vehi_oper %>%
  select(codooii,
         porcent_vehi_oper_2020)

# Unimos bases de datos --------------------------------------------------------

base_integrada_codooii <- var_id %>%
  left_join(porcent_autor_1ano, by = 'codooii') %>%
  left_join(porcent_autor_posgrado, by = 'codooii') %>%
  left_join(paridad_genero_autor, by = 'codooii') %>%
  left_join(porcent_predios_agua, by = 'codooii') %>%
  left_join(porcent_ofi_buen_estado, by = 'codooii') %>%
  left_join(porcent_predios_desagu, by = 'codooii') %>%
  left_join(porcent_predios_elect, by = 'codooii') %>%
  left_join(porcent_predios_ladrillo, by = 'codooii') %>%
  left_join(porcent_predios_propiedad, by = 'codooii') %>%
  left_join(porcent_predios_telefija, by = 'codooii') %>%
  left_join(porcent_predios_telemovil, by = 'codooii') %>%
  left_join(porcent_predios_ssbb, by = 'codooii') %>%
  left_join(trabaj_dreugel_1000est, by = 'codooii') %>%
  left_join(porcent_equinf_oper, by = 'codooii') %>%
  left_join(porcent_vehi_oper_5anos, by = 'codooii') %>%
  left_join(porcent_vehi_oper, by = 'codooii') %>%
  distinct()

# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(base_integrada_codooii, path = file.path(bases_construidas, "01_bases_integradas", "base_integrada_codooii.rds"))
write_dta(base_integrada_codooii, path = file.path(bases_construidas, "01_bases_integradas", "base_integrada_codooii.dta"))

