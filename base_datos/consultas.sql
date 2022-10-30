-- ¿Cuántos usuarios tiene cada fraternidad?

-- Amigos en común entre dos usuarios

-- Usuarios que no pertenezcan a ninguna fraternidad
INSERT INTO creador VALUES (103,'oso perezoso');
INSERT INTO usuario(id_usuario,apodos,clave,correo,instagram,importancia) VALUES (103,'osito perezoso','123','oso_1230','jcorns@gmail.com',33);

SELECT usuario.apodos FROM usuario WHERE id_fraternidad IS NULL;
-- etiquetas que tengan más usuarios
-- Cual es el evento que más usuarios tienen guardados en su calendario

-- Cual es el evento que tiene más cantidad de preguntas
SELECT evento.nombre, COUNT(evento.id_evento) AS Numero FROM evento JOIN pregunta ON evento.id_evento = pregunta.Evento_id_evento
GROUP BY evento.nombre ORDER BY COUNT(evento.id_evento) DESC LIMIT 1;
-- Cuantos eventos existen por cada etiqueta
-- Cuantos usuarios pertenecen a cada fraternidad 

-- Etiqueta más común entre los usuarios de una misma fraternidad
SELECT fraternidad.nombre,etiqueta.descripcion ,COUNT(usuario.id_usuario) AS usuarios FROM etiqueta JOIN etiquetausuario 
ON etiqueta.id_etiqueta = etiquetausuario.Etiqueta_id_etiqueta  JOIN usuario ON etiquetausuario.Etiqueta_id_usuario=usuario.id_usuario
JOIN fraternidad ON usuario.id_fraternidad=fraternidad.id_creador_fraternidad
GROUP BY usuario.id_fraternidad ORDER BY COUNT(usuario.id_usuario) DESC LIMIT 1;
-- Cual es el creador que más eventos ha creado
-- Usuarios con más de 10 amigos

-- Qué personas han hecho más preguntas que respuestas 
SELECT usuario.apodos,COUNT(pregunta.id_remitente) AS preguntas, COUNT(respuesta.id_remitente) AS respuestas FROM usuario LEFT JOIN pregunta ON id_usuario = pregunta.id_remitente
LEFT JOIN respuesta  ON  id_usuario=respuesta.id_remitente GROUP BY usuario.apodos
HAVING COUNT(pregunta.id_remitente)>=COUNT(respuesta.id_remitente) LIMIT 1;

-- las 5 fraternidades más importantes en promedio
SELECT fraternidad.nombre, AVG(usuario.importancia) AS importancia_promedio FROM fraternidad JOIN usuario ON usuario.id_fraternidad = fraternidad.id_creador_fraternidad
group by fraternidad.nombre ORDER BY AVG(usuario.importancia)  DESC LIMIT 5;


-- ¿Cuántos usuarios tiene cada fraternidad?
SELECT fraternidad.nombre, COUNT(usuario.id_fraternidad) as miembros
FROM usuario,fraternidad 
WHERE usuario.id_fraternidad = fraternidad.id_creador_fraternidad 
GROUP BY (fraternidad.id_creador_fraternidad);

-- las 3 etiquetas que tengan más usuarios

-- Primero, esto nos muestra exclusivamente las 3 etiquetas mas usadas, pero que tal si hay etiquetas que tienen el mismo nuemro de usuarios y deberian entrar al podio?
SELECT etiqueta.descripcion, COUNT(etiquetausuario.Etiqueta_id_usuario) as users
FROM 
	etiqueta JOIN etiquetausuario ON(etiqueta.id_etiqueta = etiquetausuario.Etiqueta_id_etiqueta)
GROUP BY (etiqueta.id_etiqueta)
ORDER BY (users) DESC LIMIT 3;


-- hacemos una vista de los anterior

CREATE VIEW vw_topetiqueta AS 
SELECT etiqueta.descripcion, COUNT(etiquetausuario.Etiqueta_id_usuario) as users
FROM 
	etiqueta JOIN etiquetausuario ON(etiqueta.id_etiqueta = etiquetausuario.Etiqueta_id_etiqueta)
GROUP BY (etiqueta.id_etiqueta)
ORDER BY (users) DESC LIMIT 3;

-- consulta por si se repiten
SELECT etiqueta.descripcion, COUNT(etiquetausuario.Etiqueta_id_usuario) as users
FROM etiqueta JOIN etiquetausuario ON(etiqueta.id_etiqueta = etiquetausuario.Etiqueta_id_etiqueta)
GROUP BY (etiqueta.id_etiqueta)
HAVING users>= ( SELECT users FROM vw_topetiqueta LIMIT 2,1) 
ORDER BY (users) DESC;
;


--  Cuantos eventos existen por cada etiqueta

SELECT etiqueta.descripcion, COUNT(eventoetiqueta.Evento_id_evento) AS eventos
FROM etiqueta JOIN eventoetiqueta ON(eventoetiqueta.Etiqueta_id_etiqueta = etiqueta.id_etiqueta)
GROUP BY(etiqueta.id_etiqueta)
ORDER BY (eventos) DESC;

-- Cual es el creador que más eventos ha creado

-- Primero, esto nos muestra exclusivamente 1 creador, pero que tal si hay creadores que tienen el mismo nuemro de eventos y deberian entrar al podio?
SELECT creador.nombre_creador, COUNT(evento.id_evento) AS eventos 
FROM evento JOIN creador ON (creador.id_creador = evento.Creador_id_creador)
GROUP BY (evento.Creador_id_creador)
ORDER BY(eventos) DESC limit 1;

-- Hacemos una vista de lo anterior

CREATE VIEW vw_bestcreador AS 
	SELECT creador.nombre_creador, COUNT(evento.id_evento) AS eventos 
	FROM evento JOIN creador ON (creador.id_creador = evento.Creador_id_creador)
	GROUP BY (evento.Creador_id_creador)
	ORDER BY(eventos) DESC limit 1;

-- posteriormente, hacemos la consulta por si se repiten
SELECT creador.nombre_creador, COUNT(evento.id_evento) AS eventos 
FROM evento JOIN creador ON (creador.id_creador = evento.Creador_id_creador)
GROUP BY (evento.Creador_id_creador)
HAVING eventos >= ( SELECT eventos FROM vw_bestcreador)
ORDER BY(eventos) DESC limit 1;