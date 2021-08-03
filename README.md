<p align="center">
	<img src="https://github.com/analistaup29/00_Data/blob/main/img/logo_minedu.png?raw=true")>
</p>

# Repositorio Team Data - UPP

Este repositorio contiene el código que transforma las bases de datos/fuentes de información generadas por Minedu para su uso en la elaboración de estudios/análisis enfocados en asegurar un gasto público eficiente y tomar decisiones basadas en evidencia/data.

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

- El código de corrió en la PC de Minedu con **Windows 10 y 16GB de RAM**

Instrucciones para replicar
---------------------------

### En una PC de Minedu

1. Ya tienes una cuenta en GitHub.com? Si no, [ve a GitHub.com](https://github.com/join)  e inscríbete.
2. Descarga e instala [GitHub Desktop](https://desktop.github.com) en tu PC.
3. Inicia sesión en GitHub Desktop con tu usuario Github.
5. Haz click en el botón verde `Code` que se muestra arriba de la lista de archivos en este repositorio, haz click en la opción `Open with GitHub Desktop`.
7. La data utilizada se encuentra en la Unidad B de Minedu. Ve a `B:\OneDrive - Ministerio de Educación\unidad_B\00_Data` utilizando el VPN. Verifica que tienes acceso a los datos.
8. En el folder `00_scripts` encontrarás un script llamado `00_master.R`.
9. Para correr el código abre `00_master.R` y copia la ruta del repositorio clonado en usuarios.

Bases construidas
---------------------------

Puedes acceder a las bases construidas en la siguiente ruta en la Unidad B. Ve a `B:\OneDrive - Ministerio de Educación\unidad_B\00_Data\03_bases_integradas`. Las bases integradas se encuentran a nivel de servicio educativo, local educativo, ugel, distrito entre otras. Las bases están en formatos `.dta` y `.rda` para su análisis en Stata o R. **En este momento se encuentra disponible la base a nivel de servicio educativo**

Guías
---------------------------

También se han elaborado guías para que puedas utilizar las bases de datos, crees un proyecto y lo sincronizes con GitHub, etc. Esta información se encuentra disponible en la [Guía de Usuario](https://raw.githack.com/analistaup29/00_Data/main/04_documentacion/00_guia/01_resume.html) **En elaboración**

&nbsp;
