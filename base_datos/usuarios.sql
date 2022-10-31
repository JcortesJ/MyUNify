-- Creación rol Usuario
-- CREATE ROLE 'usuario'@'localhost' ;
CREATE USER 'usuario'@'localhost' ;

-- Asignación permisos a rol usuario
GRANT SELECT, DELETE ON creador TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON fraternidad TO 'usuario'@'localhost' ;
CREATE VIEW vw_users AS SELECT id_usuario,id_fraternidad,apodos,correo,instagram,importancia
	FROM usuario;
GRANT SELECT, UPDATE, DELETE ON vw_users TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT, DELETE ON respuesta TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT, DELETE ON pregunta TO 'usuario'@'localhost' ;
GRANT SELECT ON etiqueta TO 'usuario'@'localhost' ;
CREATE VIEW vw_notificacion AS SELECT id_notificacion, estado,tipo
	FROM notificacion ;
GRANT SELECT, DELETE ON vw_notificacion TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON evento TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT ON lugar TO 'usuario'@'localhost' ;
GRANT SELECT, DELETE ON usuarionotificacion TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT, DELETE ON eventoetiqueta TO 'usuario'@'localhost' ;
GRANT SELECT, INSERT, DELETE ON amigos TO 'usuario'@'localhost' ;
flush privileges;
-- Creación de usuario de ejemplo a partir de rol
-- DROP USER 'usuarioX'@'localhost' ;
-- CREATE USER 'usuarioX'@'localhost' IDENTIFIED BY 'user123';
-- GRANT 'usuario'@'localhost' TO 'usuarioX'@'localhost' ;
-- flush privileges;

SELECT * FROM mysql.user;
-- DROP USER "modX"@'localhost';
-- DROP USER "fraternidadX"@'localhost';
-- DROP USER "unregisteredUser"@'localhost';
-- DROP USER "unregisteredX"@'localhost';
-- DROP USER "fraternidad_rol"@'localhost';
-- DROP USER "usuarioX"@'localhost';
-- DROP USER "usuario"@'localhost';
-- DROP USER "moderador";
-- DROP USER "fraternidadX";
-- DROP USER "fraternidad_rol";
-- DROP USER "usuarioX";
-- DROP USER "usuario";

-- ROL USUARIO SIN REGISTRAR

-- CREATE ROLE 'unregisteredUser'@'localhost';
CREATE USER 'unregisteredUser'@'localhost';

GRANT INSERT ON creador TO 'unregisteredUser'@'localhost';
GRANT INSERT ON usuario TO 'unregisteredUser'@'localhost';

-- CREATE USER "unregisteredX"@'localhost' IDENTIFIED BY "unre123"; 
-- GRANT 'unregisteredUser'@'localhost' TO "unregisteredX"@'localhost';

-- GRANT INSERT ON creador TO 'unregisteredX'@'localhost';
-- GRANT INSERT ON usuario TO 'unregisteredX'@'localhost';
-- GRANT ALL PRIVILEGES ON myunify TO 'unregisteredX'@"localhost" ;

-- Rol de fraternidad 

-- CREATE ROLE 'fraternidad_rol'@'localhost';
CREATE USER 'fraternidad_rol'@'localhost';
-- Sobre creador solo lectura
GRANT SELECT ON creador to 'fraternidad_rol'@'localhost';
-- sobre fraternidad leer, actualizar y borrar
GRANT SELECT,UPDATE,DELETE on fraternidad to 'fraternidad_rol'@'localhost';
-- Sobre usuario solo leer
GRANT SELECT on usuario to 'fraternidad_rol'@'localhost';
-- sobre respuesta crear, LEER y borrar
GRANT SELECT,UPDATE,INSERT on respuesta to 'fraternidad_rol'@'localhost';
-- sobre pregunta lo mismo
GRANT SELECT,UPDATE,INSERT on pregunta to 'fraternidad_rol'@'localhost';
-- sobre etiqueta solo leer
GRANT SELECT on etiqueta to 'fraternidad_rol'@'localhost';
-- sobre notificacion borrar y leer
GRANT SELECT,DELETE on notificacion to 'fraternidad_rol'@'localhost';
-- sobre evento es todo el crud
GRANT SELECT,INSERT,UPDATE,DELETE on evento to 'fraternidad_rol'@'localhost';
-- sobre lugar solo es leer y crear
GRANT SELECT,INSERT on etiqueta to 'fraternidad_rol'@'localhost';

-- Creación de usuario de ejemplo a partir de rol
-- CREATE USER 'fraternidadX'@'localhost' IDENTIFIED BY 'toor';
-- GRANT 'fraternidad_rol'@'localhost' TO 'fraternidadX'@'localhost';
-- flush privileges;
-- SHOW GRANTS FOR 'fraternidadX'@'localhost';
-- sobre fraternidad leer, actualizar y borrar
-- GRANT SELECT,UPDATE,DELETE on fraternidad to 'fraternidadX'@'localhost'; -- BORRAR ESTE
-- GRANT SELECT ON creador to 'fraternidadX'@'localhost'; -- BORRA ESTE TAMBIEN
-- GRANT ALL PRIVILEGES ON myunify TO 'fraternidadX'@"localhost" ;

-- las vistas que le podrian interesar a la fraternidad son:
-- numero de usuarios que están suscritos a ellas
CREATE VIEW vw_usuariosFraternidad AS SELECT fraternidad.nombre,count(id_usuario) AS numero FROM usuario 
JOIN fraternidad ON  fraternidad.id_creador_fraternidad = usuario.id_fraternidad  GROUP BY fraternidad.nombre;
-- las 5 etiquetas más utilizadas en los eventos
CREATE VIEW vw_etiquetasComunes AS SELECT etiqueta.descripcion,COUNT(id_etiqueta) FROM eventoetiqueta JOIN etiqueta 
ON eventoetiqueta.Etiqueta_id_etiqueta=etiqueta.id_etiqueta 
JOIN evento ON Evento_id_evento=evento.id_evento -- AND evento.Creador_id_creador=fraternidad.id_creador_fraternidad
GROUP BY etiqueta.descripcion ORDER BY COUNT(id_etiqueta) DESC LIMIT 5;
-- numero de eventos creados por mes
-- probar si esta consulta sirve
CREATE VIEW vw_eventosMes AS SELECT MONTH(evento.fecha) AS MES , COUNT(id_evento) AS NUMERO FROM evento
GROUP BY MONTH(evento.fecha);
flush privileges;


-- asignar permisos de lectura al rol sobre las vistas
GRANT SELECT  ON myunify.vw_eventosMes TO 'fraternidad_rol'@'localhost';
GRANT SELECT  ON myunify.vw_etiquetasComunes TO 'fraternidad_rol'@'localhost';
GRANT SELECT  ON myunify.vw_usuariosFraternidad TO 'fraternidad_rol'@'localhost';
flush privileges;

-- Asigfnacion perfiles MODERADOR

-- crracion rol moderador

-- CREATE ROLE "moderador"@'localhost';
CREATE USER "moderador"@'localhost';

-- permisos a moderador
GRANT SELECT, DELETE ON MyUnify.creador TO "moderador"@'localhost';
GRANT SELECT, DELETE ON MyUnify.fraternidad TO "moderador"@'localhost';
flush privileges;

DROP VIEW IF EXISTS vw_user_mod;
CREATE VIEW vw_user_mod AS SELECT id_usuario, id_fraternidad, apodos, instagram FROM usuario;

GRANT SELECT, DELETE ON MyUnify.vw_user_mod TO "moderador"@'localhost';
GRANT SELECT, DELETE ON Respuesta TO "moderador"@'localhost'; 
GRANT SELECT, DELETE ON Pregunta TO "moderador"@'localhost'; 
GRANT SELECT, DELETE ON MyUnify.Evento TO "moderador"@'localhost'; 
flush privileges;
-- creacion de un moderador

-- CREATE USER 'modX'@"localhost"  IDENTIFIED BY 'mod123';
-- GRANT 'moderador'@'localhost' TO 'modX'@"localhost" ;
-- flush privileges;
-- SHOW GRANTS FOR 'modX'@'localhost';
-- GRANT SELECT, DELETE ON Respuesta TO "modX"@'localhost'; 
-- GRANT ALL PRIVILEGES ON myunify TO 'modX'@"localhost" ;
-- flush privileges;