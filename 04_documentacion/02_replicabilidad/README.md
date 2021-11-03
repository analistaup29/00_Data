# Replicar y/o actualizar el repositorio

Aquí se incluyen los pasos para replicar o actualizar los scripts que generan las datasets limpias y construidas.

Si encuentras algún problema para correr el código o reproducir los resultados, por favor [crea un `Informe de problemas`](https://github.com/analistaup29/00_Data/issues/new) en este repositorio.

Requerimientos computacionales
------------------------------

### Requerimientos de software

- R Studio (código se corrió con la versión 1.4)
  - haven v2.3.1
  - janitor v2.1.0
  - RStata v1.1.1
  - tidyverse v1.3.0
  - foreign v0.8-81
  - reticulate v1.20
  - Miniconda

### Requerimientos de memoria y tiempo de ejecución

- El código de corrió en la PC de Minedu con **Windows 10 y 8GB de RAM**

Instrucciones para replicar
---------------------------

### En una PC de Minedu
1. Clona el repositorio en tu PC
2. Ve a la carpeta `00_scripts`, allí encontrarás un script llamado `00_master.R`. Este script te permite correr todos los demás scripts con un solo click. 
3. Hay dos tipos de scripts, los scripts que *limpian* las datasets y los scripts que *construyen* datasets. El primer grupo de scripts están en la carpeta `01_limpiar_bases` e incluye los scripts que normalizan variables, asignan labels y crean nuevos indicadores. El segundo grupo de scripts se encuentran en la carpeta `02_construir_bases` y básicamente unen las bases limpias para generar las bases integradas.
4. Si deseas agregar una fuente de datos adicional, primero crea un nuevo script en la carpeta `01_limpiar_bases` y luego combinala con una de las bases integradas modificando uno de los scripts en `02_construir_bases`.
5. Todas las bases se guardan en la Unidad B de Minedu y son accesibles desde el sharepoint o desde el VPN virtual. Puedes ver la lista de bases en el readme principal del repositorio.