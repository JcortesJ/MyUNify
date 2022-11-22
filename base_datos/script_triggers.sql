-- script triggers
DROP TRIGGER crear_notificacion;
-- TRIGGERS
-- al momento de crear un evento, se inserta en la tabla notificación su notificación correspondiente
DELIMITER $$
CREATE TRIGGER crear_notificacion    
    BEFORE INSERT
         ON evento FOR EACH ROW    
         BEGIN    
		-- para acceder a la última columna insertada utilizamos la palabra NEW
        -- para acceder a la última borrada usamos OLD
        -- obtenemos el id_notificacion de la tabla a guardar
        SET @id_not = NEW.Notificacion_id_notificacion;
        INSERT INTO notificacion(id_notificacion,estado,tipo) VALUES (@id_not,TRUE,'evento');
        -- este trigger permite que no haya errores de que primero se deba insertar en notificacion para insertar en evento
        -- adicionamente insertamos en la tabla notificacionusuario
        SET @id_user = NEW.Creador_id_creador;
        INSERT INTO usuarionotificacion VALUES (@id_user,@id_not);
        END;     
        $$
	DELIMITER ;
    
-- al momento de un cambio en la tabla notificación, crear un nuevo registro en la tabla de amigos

DROP TRIGGER IF EXISTS crearAmigos;

DELIMITER $$
CREATE TRIGGER crearamigos    
    BEFORE UPDATE ON notificacion FOR EACH ROW 
        BEGIN    
         
		-- obtenemos el nuevo valor del estado de la notificacion
        SET @not_respond = new.estado;
        
        -- obtebemos el id de la notificacion que sufrio el cambio
        SET @id_not = new.id_notificacion;
        IF(@not_respond = 1) THEN -- si el cambio es que la acepto agregamos los amigos
			SET @DONE = validarNot(@id_not);
		END IF;

        END;     
        $$
DELIMITER ;

SELECT @done;