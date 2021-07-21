* Definir Globales
* ---------------------

* Definir usuario que usa el script

global user 1

* PC Santiago Minedu
if $user == 1 {
       global github 		"C:/Users/ANALISTAUP18/Documents/GitHub/data_upp/scripts/01_clean"
}

if $user == 1 {
       global onedrive 		"B:/OneDrive - Ministerio de Educación/unidad_B/1. Data"
}

	* Globales
	global data_raw				"$onedrive/01_data_raw"
	global data_clean			"$onedrive/02_data_clean"
	global data_constructed		"$onedrive/03_data_constructed"
	global scripts				"$github/scripts"
   

	set more off, permanent  	

/*------------------------------------------------------------------
  Do-Files
-------------------------------------------------------------------*/


*------------------------------------------------------------------
* Limpiar, unir bases de datos y crear variables de interés

*if (1) {
*	do "$scripts/01_cleandata.do"			// Limpia bases de datos
*}



