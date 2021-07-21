

* Importamos Padrón web actualizado al 27/06/2021
import dbase using "/Users/bran/Downloads/Padron_web_20210627/Padron_web.dbf", clear

rename *, lower

drop director telefono email pagweb dir_cen referencia 

* Exportar

save "/Users/bran/Downloads/Padron_web_20210627/padron_iiee.dta"
