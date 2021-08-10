
# Correr limpieza de datos en R

# Seleccionar acciones ---------------------------------------------------------

# Limpieza de datos
limpiar_padron_iiee         <- 0 # Limpia padron de IIEE
limpiar_padrones_asig_temp  <- 0 # Limpia padrones de asignaciones temporales
limpiar_registro_eib        <- 0 # Limpia registro EIB 2019
limpiar_siagie_notas        <- 0 # Limpia padron SIAGIE 2020 notas
limpiar_siagie_matricula    <- 1 # Limpia padron SIAGIE 2021 matriculas


# Correr codigo ----------------------------------------------------------------

# Limpia padron de IIEE
if (limpiar_padron_iiee) source(file.path(scripts, "01_limpiar_bases", "01_padron_iiee.R"))
# INPUTS
# OUTPUTS

# Limpia padrones de asignaciones temporales
if (limpiar_padrones_asig_temp) source(file.path(scripts, "01_limpiar_bases", "02_padron_asignaciones_temporales.R"))
# INPUTS
# OUTPUTS

# Limpia registro EIB 2019
if (limpiar_registro_eib) source(file.path(scripts, "01_limpiar_bases", "03_registro_eib.R"))
# INPUTS
# OUTPUTS

# Limpia padron SIAGIE 2020
if (limpiar_siagie_notas) source(file.path(scripts, "01_limpiar_bases", "04_siagie_notas.R"))
# INPUTS
# OUTPUTS

# Limpia padron SIAGIE 2020
if (limpiar_siagie_matricula) source(file.path(scripts, "01_limpiar_bases", "05_siagie_matricula.R"))
# INPUTS
# OUTPUTS

