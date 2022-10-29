-- Creación rol Usuario
CREATE ROLE 'usuario';
-- Asignación permisos a rol usuario
GRANT SELECT, DELETE ON creador TO 'usuario';
GRANT SELECT, INSERT, UPDATE, DELETE ON fraternidad TO 'usuario';
CREATE VIEW vw_users AS SELECT id_usuario,id_fraternidad,apodos,correo,instagram,importancia
	FROM usuario;
GRANT SELECT, UPDATE, DELETE ON vw_users TO 'usuario';
GRANT SELECT, INSERT, DELETE ON respuesta TO 'usuario';
GRANT SELECT, INSERT, DELETE ON pregunta TO 'usuario';
GRANT SELECT ON etiqueta TO 'usuario';
CREATE VIEW vw_notificacion AS SELECT id_notificacion, estado,tipo
	FROM notificacion ;
GRANT SELECT, DELETE ON vw_notificacion TO 'usuario';
GRANT SELECT, INSERT, UPDATE, DELETE ON evento TO 'usuario';
GRANT SELECT, INSERT ON lugar TO 'usuario';
GRANT SELECT, DELETE ON usuarionotificacion TO 'usuario';
GRANT SELECT, INSERT, DELETE ON eventoetiqueta TO 'usuario';
GRANT SELECT, INSERT, DELETE ON amigos TO 'usuario';

-- Creación de usuario de ejemplo a partir de rol
CREATE USER 'usuarioX' IDENTIFIED BY 'user123';
GRANT 'usuario' TO 'usuarioX';

-- Creacion de roles jm 
-- Rol de fraternidad 

CREATE ROLE 'fraternidad_rol';
-- Sobre creador solo lectura
GRANT SELECT ON creador to 'fraternidad';
-- sobre fraternidad leer, actualizar y borrar
GRANT SELECT,UPDATE,DELETE on fraternidad to 'fraternidad_rol';
-- Sobre usuario solo leer
GRANT SELECT on usuario to 'fraternidad_rol';
-- sobre respuesta crear, LEER y borrar
GRANT SELECT,UPDATE,INSERT on respuesta to 'fraternidad_rol';
-- sobre pregunta lo mismo
GRANT SELECT,UPDATE,INSERT on pregunta to 'fraternidad_rol';
-- sobre etiqueta solo leer
GRANT SELECT on etiqueta to 'fraternidad_rol';
-- sobre notificacion borrar y leer
GRANT SELECT,DELETE on notificacion to 'fraternidad_rol';
-- sobre evento es todo el crud
GRANT SELECT,INSERT,UPDATE,DELETE on evento to 'fraternidad_rol';
-- sobre lugar solo es leer y crear
GRANT SELECT,INSERT on etiqueta to 'fraternidad_rol';

-- Creación de usuario de ejemplo a partir de rol
CREATE USER 'fraternidadX' IDENTIFIED BY 'toor';
GRANT 'fraternidad_rol' TO 'fraternidadX';

-- las vistas que le podrian interesar a la fraternidad son:
-- numero de usuarios que están suscritos a ellas y etiquetas más comunes
CREATE VIEW vw_usuariosFraternidad AS SELECT fraternidad.nombre,count(id_usuario) FROM usuario WHERE fraternidad.id_creador_fraternidad = usuario.id_fraternidad GROUP BY fraternidad.nombre;
-- las 5 etiquetas más utilizadas en los eventos
CREATE VIEW vw_etiquetasComunes AS SELECT etiqueta.descripcion,COUNT(id_etiqueta) FROM eventoetiqueta JOIN etiqueta 
ON eventoetiqueta.Etiqueta_id_etiqueta=etiqueta.id_etiqueta 
JOIN evento ON Evento_id_evento=evento.id_evento -- AND evento.Creador_id_creador=fraternidad.id_creador_fraternidad
GROUP BY etiqueta.descripcion ORDER BY COUNT(id_etiqueta) DESC LIMIT 5;
-- numero de eventos creados por mes
-- probar si esta consulta sirve
CREATE VIEW vw_eventosMes AS SELECT MONTH(evento.fecha) AS MES , COUNT(id_etiqueta) AS NUMERO FROM evento
GROUP BY MONTH(evento.fecha);

-- asignar permisos de lectura al rol sobre las vistas
GRANT SELECT  ON myunify.vw_eventosMes TO 'fraternidad_rol';
GRANT SELECT  ON myunify.vw_etiquetasComunes TO 'fraternidad_rol';
GRANT SELECT  ON myunify.vw_usuariosFraternidad TO 'fraternidad_rol';

-- roles simon
