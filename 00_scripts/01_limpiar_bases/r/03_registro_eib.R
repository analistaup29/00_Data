# Limpiar data registro EIB

# Cargar dataset ---------------------------------------------------------------

registro_eib <- read_xlsx(filepath(bases_crudas, "02_OSEE", "06_registro_eib", "Registro nacional IIEE_EIB 2019.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()

# Cambiar nombres a variables ---------------------------------------------------

registro_eib <- rename(registro_eib, cod_mod = codigo_modular, 
                       forma_atencion_eib = forma_de_atencion_eib,
                       lengua_originariaeib1 = nombre_de_lengua_originaria_1_2019,
                       lengua_originariaeib2 = nombre_de_lengua_originaria_2_2019,
                       lengua_originariaeib3= nombre_de_lengua_originaria_3_2019)

# Guardar bases en RDS y DTA ---------------------------------------------------

write_dta(registro_eib, path = filepath(bases_limpias, "02_OSEE", "06_registro_eib", "registro_eib_limpio.dta"))
write_rds(registro_eib, path = filepath(bases_limpias, "02_OSEE", "06_registro_eib", "registro_eib_limpio.rds"))