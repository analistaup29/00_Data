# Limpiar data registro EIB

# Cargar dataset ---------------------------------------------------------------

registro_eib <- read_xlsx(file.path(bases_crudas, "02_OSEE", "06_registro_eib", "Registro nacional IIEE_EIB 2019.xlsx"), col_names = TRUE, skip = 1 ) %>% clean_names()

# Cambiamos nombres a variables ------------------------------------------------

registro_eib <- rename(registro_eib, cod_mod = codigo_modular, 
                       forma_atencion_eib = forma_de_atencion_eib,
                       lengua_originariaeib1 = nombre_de_lengua_originaria_1_2019,
                       lengua_originariaeib2 = nombre_de_lengua_originaria_2_2019,
                       lengua_originariaeib3= nombre_de_lengua_originaria_3_2019,
                       ugel = nombre_de_la_dre_o_ugel_que_supervisa_la_i_e,
                       servicio_edu = nro_y_o_nombre_del_servicios_educativo)

# Generamos nuevas variables ---------------------------------------------------

# Variable identificadora de EIB
registro_eib <- mutate(registro_eib, eib = c("EIB"))

# Labels de variables

registro_eib$lengua_originariaeib1 <- labelled(registro_eib$lengua_originariaeib1, label="Lengua originaria 1 (RVM 185-2019-MINEDU)")
registro_eib$lengua_originariaeib2 <- labelled(registro_eib$lengua_originariaeib2, label="Lengua originaria 2 (RVM 185-2019-MINEDU)")
#registro_eib$lengua_originariaeib3 <- labelled(registro_eib$lengua_originariaeib3, label="Lengua originaria 3 (RVM 185-2019-MINEDU)")
registro_eib$eib <- labelled(registro_eib$eib, label="IIEE es EIB (RVM 185-2019-MINEDU)")
registro_eib$forma_atencion_eib <- labelled(registro_eib$forma_atencion_eib, label="Forma EIB (RVM 185-2019-MINEDU)")

# Guardar bases en RDS y DTA ---------------------------------------------------

write_dta(registro_eib, path = file.path(bases_limpias, "02_OSEE", "06_registro_eib", "registro_eib_limpio.dta"))
write_rds(registro_eib, path = file.path(bases_limpias, "02_OSEE", "06_registro_eib", "registro_eib_limpio.rds"))