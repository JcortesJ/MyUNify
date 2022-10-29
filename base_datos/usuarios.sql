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
