-- ARCHIVO DE CREACION DE INDICE

CREATE UNIQUE INDEX indice_etiqueta ON
etiqueta(id_etiqueta);

-- Justificacion: es un indice unico por que se busca que las etiquetas no se repitan en la aplicación.

CREATE INDEX indice_evento ON evento(nombre);

-- Justificación: como el punto central de la aplicación es tener bastantes eventos, al momento de buscarlos esto no debe tardar mucho tiempo

-- Indice sobre pregunta y respuesta

CREATE UNIQUE INDEX indice_pregunta ON Pregunta(id_pregunta, Evento_id_evento, id_remitente);

CREATE UNIQUE INDEX indice_respuesta ON Respuesta(id_respuesta, Pregunta_id_pregunta, id_remitente);