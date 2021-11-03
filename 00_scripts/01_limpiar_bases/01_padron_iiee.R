# Limpiar base padrón IIEE

# Cargar dataset ---------------------------------------------------------

# Leer dbf

padron_iiee <- read.dbf("B:/OneDrive - Ministerio de Educación/unidad_B/00_Data/01_bases_crudas/02_OSEE/04_padron_iiee/Padron_web20210723.dbf", as.is = TRUE) %>% clean_names()
#padron_iiee <- read.dbf(file.path(bases_crudas, "02_OSEE", "04_padron_iiee","Padron_web20210723.dbf"), as.is = TRUE)  %>% clean_names()


# Cambiar encoding a UTF-8 - Encoding se encuentra en IBM850
padron_iiee <-padron_iiee %>%
  mutate_if(is.character, 
            function(col) iconv(col, from = "IBM850", to = "ISO8859-1"))

# Cambiar nombres a variables ---------------------------------------------------

padron_iiee <- rename(padron_iiee, talumno_censo = talumno,
                      tdocente_censo = tdocente,
                       tseccion_censo = tseccion,
                      talum_hom_censo  =talum_hom,
                      talum_muj_censo  =talum_muj)

# Definir levels de variables---------------------------------------------------

# d_niv_mod_levels <- c(
#   d_niv_mod1 = "Inicial - Cuna",
#   d_niv_mod2 = "Inicial - Jardín",
#   d_niv_mod3 = "Inicial - Cuna-jardín",
#   d_niv_mod4 = "Inicial - Programa no escolarizado",
#   d_niv_mod5 = "Primaria",
#   d_niv_mod6 = "Primaria de Adultos",
#   d_niv_mod7 = "Básica Alternativa",
#   d_niv_mod8 = "Básica Alternativa-Inicial e Intermedio",
#   d_niv_mod9 = "Básica Alternativa-Avanzado",
#   d_niv_mod10 = "Básica Especial",
#   d_niv_mod11 = "Básica Especial-Inicial",
#   d_niv_mod12 = "Básica Especial-Primaria",
#   d_niv_mod13 = "Secundaria",
#   d_niv_mod14 = "Secundaria de Adultos",
#   d_niv_mod15 = "Instituto Superior Pedagógico",
#   d_niv_mod16 = "Técnico Productiva",
#   d_niv_mod17 = "Educación Ocupacional",
#   d_niv_mod18 = "Escuela Formación Artística",
#   d_niv_mod19 = "Escuela Superior Pedagógica",
#   d_niv_mod20 = "Escuela Superior Tecnológica",
#   d_niv_mod21 = "Instituto Superior Tecnológico"
# )

# d_forma_levels <- c(
#   d_forma1 = "Escolarizada",
#   d_forma2 = "No escolarizada",
#   d_forma3 = "No aplica"
# )
# 
# d_cod_car_levels <- c(
#   d_cod_car1 = "Unidocente",
#   d_cod_car2 = "Polidocente Multigrado",
#   d_cod_car3 = "Polidocente Completo",
#   d_cod_car4 = "No disponible",
#   d_cod_car5 = "No aplica"
# )
# 
# d_tipssexo_levels <- c(
#   d_tipssexo1 = "Varones",
#   d_tipssexo2 = "Mujeres",
#   d_tipssexo3 = "Mixto"
# )
# 
# d_gestion_levels <- c(
#   d_gestion1 = "Pública de gestión directa",
#   d_gestion2 = "Pública de gestión privada",
#   d_gestion3 = "Privada"
# )
# 
# d_ges_dep_levels <- c(
#   d_ges_dep1 = "Sector Educación",
#   d_ges_dep2 = "Otro sector público (FF.AA.)",
#   d_ges_dep3 = "Municipalidad",
#   d_ges_dep4 = "Convenio con Sector Educación",
#   d_ges_dep5 = "Cooperativo",
#   d_ges_dep6 = "Comunidad o asociación religiosa",
#   d_ges_dep7 = "Comunidad",
#   d_ges_dep8 = "Particular",
#   d_ges_dep9 = "Empresa (Fiscalizado)",
#   d_ges_dep10 = "Asociación civil / Inst.Benéfica"
# )
# 
# dareacenso_levels <- c(
#   dareacenso1 = "Urbana",
#   dareacenso2 = "Rural"
# )
# 
# d_tipoprog_levels <- c(
#   d_tipoprog1 = "PIETBAF",
#   d_tipoprog2 = "PIET, Wawa Pukllana",
#   d_tipoprog3 = "SET",
#   d_tipoprog4 = "PRONOEI",
#   d_tipoprog5 = "Ludoteca",
#   d_tipoprog6 = "PAIGRUMA",
#   d_tipoprog7 = "Familias que aprenden",
#   d_tipoprog8 = "Escuela del aire",
#   d_tipoprog9 = "Ludoteca itinerante",
#   d_tipoprog10 = "Ciclo I - Entorno Familiar",
#   d_tipoprog11 = "Ciclo I - Entorno Comunitario",
#   d_tipoprog12 = "Ciclo I - SET",
#   d_tipoprog13 = "Ciclo II - Entorno Familiar",
#   d_tipoprog14 = "Ciclo II - Entorno Comunitario"
# )
# 
# d_cod_tur_levels <- c(
#   d_cod_tur1 = "Mañana",
#   d_cod_tur2 = "Tarde",
#   d_cod_tur3 = "Mañana-Tarde",
#   d_cod_tur4 = "Noche",
#   d_cod_tur5 = "Mañana-Tarde-Noche",
#   d_cod_tur6 = "Mañana-Noche",
#   d_cod_tur7 = "Tarde-Noche"
# )
# 
# d_estado_levels <- c(
#   d_estado1 = "Activa",
#   d_estado2 = "Inactiva"
# )
# 
# d_fte_dato_levels <- c(
#   d_fte_dato1 = "Declarado",
#   d_fte_dato2 = "Imputado",
#   d_fte_dato3 = "No Aplica"
# )

# Añadir labels y factores -----------------------------------------------------

padron_iiee$cod_mod <- labelled(padron_iiee$cod_mod, label="Código modular")
padron_iiee$anexo <- labelled(padron_iiee$anexo, label="Anexo")
padron_iiee$codlocal <- labelled(padron_iiee$codlocal, label="Código de local educativo")
padron_iiee$codgeo <- labelled(padron_iiee$codgeo, label="Código de ubicación geográfica (DD-PP-DI)")
padron_iiee$d_dpto <- labelled(padron_iiee$d_dpto, label="Nombre departamento")
padron_iiee$d_prov <- labelled(padron_iiee$d_prov, label="Nombre provincia")
padron_iiee$d_dist <- labelled(padron_iiee$d_dist, label="Nombre distrito")
padron_iiee$cen_edu <- labelled(padron_iiee$cen_edu, label="Nombre del centro educativo")
padron_iiee$d_region <- labelled(padron_iiee$d_region, label="Dirección o Gerencia regional de educación")
padron_iiee$codooii <- labelled(padron_iiee$codooii, label="Código de DRE o UGEL que supervisa el servicio educativo")
padron_iiee$d_dreugel <- labelled(padron_iiee$d_dreugel, label="Nombre de la DRE o UGEL que supervisa el servicio educativo")
#padron_iiee$nlat_ie <- labelled(padron_iiee$nlat_ie, label="Coordenada gegráfica - Latitud")
#padron_iiee$nlong_ie <- labelled(padron_iiee$nlong_ie, label="Coordenada gegráfica - Longitud")
padron_iiee$talumno_censo <- labelled(padron_iiee$talumno_censo, label="Total alumnos (Censo educativo 2020)")
padron_iiee$tdocente_censo <- labelled(padron_iiee$tdocente_censo, label="Total docentes (Censo educativo 2020)")
padron_iiee$tseccion_censo <- labelled(padron_iiee$tseccion_censo, label="Total secciones (Censo educativo 2020)")
padron_iiee$fecha_act <- labelled(padron_iiee$fecha_act, label="Fecha de actualización Padrón IIEE")
padron_iiee$codcp_inei <- labelled(padron_iiee$codcp_inei, label="Código del centro poblado - INEI")
padron_iiee$codccpp <- labelled(padron_iiee$codccpp, label="Código del centro poblado - UE-MINEDU")
padron_iiee$cen_pob <- labelled(padron_iiee$cen_pob, label="Centro Poblado")
padron_iiee$niv_mod <- labelled(padron_iiee$niv_mod, label="Código de Nivel / Modalidad")
padron_iiee$talum_hom_censo <- labelled(padron_iiee$talum_hom_censo, label="Total alumnos - hombres (Censo educativo 2020)")
padron_iiee$talum_muj_censo <- labelled(padron_iiee$talum_muj_censo, label="Total alumnos - mujeres (Censo educativo 2020)")
padron_iiee$d_niv_mod <- labelled(padron_iiee$d_niv_mod, label="Nivel / Modalidad")
padron_iiee$d_forma <- labelled(padron_iiee$d_forma, label="Forma de atención")
padron_iiee$d_cod_car <- labelled(padron_iiee$d_cod_car, label="Caracteristica (Censo educativo 2020)")
padron_iiee$d_tipssexo <- labelled(padron_iiee$d_tipssexo, label="Género de los alumnos")
padron_iiee$d_gestion <- labelled(padron_iiee$d_gestion, label="Gestión del servicio educativo")
padron_iiee$d_ges_dep <- labelled(padron_iiee$d_ges_dep, label="Gestión / Dependencia")
padron_iiee$dareacenso <- labelled(padron_iiee$dareacenso, label="Área geográfica (500 Habitantes)")
padron_iiee$d_tipoprog <- labelled(padron_iiee$d_tipoprog, label="Tipo de programa")
padron_iiee$d_cod_tur <- labelled(padron_iiee$d_cod_tur, label="Turno de atención")
padron_iiee$d_estado <- labelled(padron_iiee$d_estado, label="Estado del servicio educativo")
padron_iiee$d_fte_dato <- labelled(padron_iiee$d_fte_dato, label="Tipo de la fuente de datos Censo 2020")

# Guardar bases en RDS y DTA ---------------------------------------------------

write_rds(padron_iiee, path = file.path(bases_limpias, "02_OSEE", "04_padron_iiee", "padron_iiee_limpia.rds")) 
write_dta(padron_iiee, path = file.path(bases_limpias, "02_OSEE", "04_padron_iiee", "padron_iiee_limpia.dta")) 