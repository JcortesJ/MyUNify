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