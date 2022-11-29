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
        END;     
        $$
	DELIMITER ;
    
    DROP TRIGGER crear_usNot;
    DELIMITER $$
    CREATE TRIGGER crear_usNot AFTER INSERT ON evento
    FOR EACH ROW BEGIN
		 SET @id_user = NEW.Creador_id_creador;
         INSERT INTO usuarionotificacion VALUES (@id_user,@id_not); 
    END $$
    DELIMITER ;