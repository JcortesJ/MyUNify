-- ARCHIVO DE CREACION DE INDICE


CREATE UNIQUE INDEX indice_etiqueta ON
etiqueta(id_etiqueta);

-- Justificacion: es un indice unico por que se busca que las etiquetas no se repitan en la aplicación.

