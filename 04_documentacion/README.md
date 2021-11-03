# Documentación

Aquí se incluye la documentación del repositorio. Incluye los diccionarios de las variables, guias para administración de data y las instrucciones para replicar el proyecto y actualizar los scripts.

## Contenido 

- [Guías](https://github.com/analistaup29/00_Data/tree/main/04_documentacion/00_guia)
- [Diccionarios](https://github.com/analistaup29/00_Data/tree/main/04_documentacion/01_diccionarios)
- [Replicabilidad y actualización](https://github.com/analistaup29/00_Data/tree/main/04_documentacion/02_replicabilidad)

## Estructura del proyecto

Se ha organizado la data en tres etapas/partes:

- **Data cruda:** Contiene datasets recibidas *as is* por las Unidades/Direcciones de Minedu, no está lista para ser analizada de inmediato y generalmente se encuentra en formato `.xlsx` o `.txt`.
- **Data limpia:** Contiene datasets que fueron procesadas para normalizar los nombres, añadir labels o crear variables adicionales. La data se guarda en [formato tidy](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html). Se guarda en formato `.rds` o `.dta` y está lista para ser analizada/procesada en un Software Estadístico.
- **Data construida:** Contiene datasets que ya fueron *combinadas* a nivel `cod_mod`, `cod_local` u otro nivel (se combinan las datasets limpias). Se recomienda utilizar las datasets construidas ya que tienen los nombres normalizados, tienen labels y contienen indicadores relevantes para la caracterización de las IIEE.

El proyecto se estructura en dos carpetas. La carpeta `Github` contiene los scripts que limpian la data y la carpeta `00_Data` contiene los datasets crudos, limpios y construidos (en la unidad_B de Minedu). 

```markdown
├── GitHub                              
    ├── 00_scripts                      -> Contiene los scripts que limpian y construyen las datasets.
        ├── 00_master.R                 -> Es el script principal que controla a todos los scripts.
        ├── 01_limpiar_bases            -> Incluye scripts que normalizan variables y asignan labels.
        ├── 02_construir_bases          -> Incluye scripts que unen las bases limpias para generar las bases integradas.
    ├── 04_documentacion
        ├── 00_guia                     -> Incluye guias para el equipo de data.
        ├── 01_diccionarios             -> Incluye los diccionarios para las variables de las bases limpias y construidas.
        ├── 02_replicabilidad           -> Incluye las instrucciones para replicar el repositorio en otra PC de Minedu.
├── unidad_B/00_Data
    ├── 01_bases_crudas
        ├── 01_UMC                      -> Incluye las bases crudas - as is - de la UMC
        ├── 02_OSEE                     -> Incluye las bases crudas - as is - de la OSEE
        ...
        ├── 99_otros                    -> Incluye otras bases crudas de Minedu/Sector público
    ├── 02_bases_limpias
        ├── 01_UMC                      -> Incluye las bases limpias de la UMC
        ├── 02_OSEE                     -> Incluye las bases limpias de la OSEE
        ...
        ├── 99_otros                    -> Incluye otras bases limpias de Minedu/Sector público
    ├── 03_bases_construidas
        ├── 01_bases_integradas         -> Incluye las bases puras integradas (cod_mod, cod_local, codooii)
        ├── 02_intervenciones           -> Incluye las bases de las intervenciones pedagógicas
        ├── 03_consolidados_historicos  -> Incluye los consolidados históricos (SIAGIE, etc.)
```

