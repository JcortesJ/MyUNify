-- creacion pas/funciones





-- FUNCIONES/PAS

-- . (para PAS) cuando un usuario se de de baja borrar en cascada todas las tablas relacionadas con el

DROP PROCEDURE baja_usuario;
DELIMITER $$

CREATE PROCEDURE baja_usuario (id_user INT )
BEGIN
	-- primero debemos borrar de las tablas asociadas
    -- amigos
    DELETE FROM amigos WHERE id_amigo1 = id_user OR id_amigo2 = id_user;
    -- etiqueta usuario
    DELETE FROM etiquetausuario WHERE Etiqueta_id_usuario= id_user;
    -- usuario notificacion
    DELETE FROM usuarionotificacion WHERE Notificacion_id_usuario = id_user;
    
    -- luego podemos borrar en usuario
    DELETE FROM usuario WHERE id_usuario = id_user;
    -- finalmente en creador
    DELETE FROM creador WHERE id_creador = id_user;
END $$
DELIMITER ;

-- contar por id el numero de eventos creados

DROP FUNCTION contar_eventosCreados;


DELIMITER $$
CREATE FUNCTION contar_eventosCreados(id_creador INT)
RETURNS INT
BEGIN
	DECLARE numero INT DEFAULT 0;
	SET numero = (SELECT COUNT(*) FROM evento WHERE Creador_id_creador = id_creador);
    RETURN numero;
END $$
DELIMITER ;


-- (Funcion) dada una notificacion de solicitud de amistad aceptada, crear el registro de amigos

DROP FUNCTION IF EXISTS agregarAmigos;
DROP FUNCTION IF EXISTS validarNot;

DELIMITER $$
CREATE FUNCTION agregarAmigos(id_not INT)
RETURNS boolean DETERMINISTIC
BEGIN
    DECLARE done boolean DEFAULT true;
	DECLARE receptor INT DEFAULT 0;
    DECLARE remitente INT DEFAULT 0;
	SET remitente = ( SELECT id_remitente from notificacion WHERE id_notificacion = id_not); -- el remitente es un atributo de la tabla notificacion
    -- El receptor es una tributo de la tabla usuarioNotificacion
    SET receptor = ( SELECT Notificacion_id_usuario FROM notificacion JOIN usuarioNotificacion ON (notificacion.id_notificacion = usuarioNotificacion.Notificacion_id_notificacion) WHERE notificacion.id_notificacion = id_not );
    
    INSERT INTO amigos(id_amigo1, id_amigo2) VALUES (remitente, receptor); -- creamos el registro de los nuevos amigos
    
    RETURN done;
END $$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION validarNot(id_not INT)
RETURNS boolean DETERMINISTIC
BEGIN
    DECLARE tipoNot VARCHAR(20) DEFAULT "";
    DECLARE done boolean DEFAULT false; -- para controlar si la funcion se ejecuto con exito
	SELECT tipo INTO tipoNot FROM notificacion WHERE notificacion.id_notificacion = id_not; -- para saber el tipo de la notificacion
    IF tipoNot LIKE 'amistad' THEN -- Si la notificacion es de amistad
		set done =  agregarAmigos(id_not); -- llamamos la funcion que los vuelve amigos en la base de datos
    END IF;
    
    RETURN done;
END $$
DELIMITER ;


show columns FROM notificacion;
SET @DONE = validarNot(5);
SELECt @DONE; 


-- Al crear un usuario, insertarlo en ambas tablas creador y usuario

DROP PROCEDURE IF EXISTS createUser;

DELIMITER $$
CREATE PROCEDURE createUser(id_usuario INT,nombre char(60), apodos char(45), clave char(25), correo char(60), instagram char(30))
BEGIN
    
	INSERT INTO creador(id_creador, nombre_creador) -- PRIMERO HAY QUE AÑADIRLO A CREADOR
	VALUES(id_usuario,nombre);

	INSERT INTO usuario(id_usuario, apodos, clave, correo, instagram, importancia)  -- luego lo metemos a usuario
	VALUES (id_usuario, apodos, clave, correo, instagram, 99);
    
END $$
DELIMITER ;

