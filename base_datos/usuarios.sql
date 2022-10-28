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
	FROM notificación ;
GRANT SELECT, DELETE ON vw_notificacion TO 'usuario';
GRANT SELECT, INSERT, UPDATE, DELETE ON evento TO 'usuario';
GRANT SELECT, INSERT ON lugar TO 'usuario';
GRANT SELECT, DELETE ON usuarionotificacion TO 'usuario';
GRANT SELECT, INSERT, DELETE ON eventoetiqueta TO 'usuario';
GRANT SELECT, INSERT, DELETE ON amigos TO 'usuario';

-- Creación de usuario de ejemplo a partir de rol
CREATE USER 'usuarioX' IDENTIFIED BY 'user123';
GRANT 'usuario' TO 'usuarioX';
