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
