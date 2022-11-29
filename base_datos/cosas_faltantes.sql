SELECT * FROM CREADOR;
SELECT * FROM usuario;
INSERT INTO CREADOR (id_creador,nombre_creador) VALUES (123,'jiji2');


/*triggers faltantes*/
DELIMITER $$
	CREATE TRIGGER TR_Creador BEFORE INSERT ON usuario
    FOR EACH ROW BEGIN
    SET @nv_id = NEW.id_usuario;
    SET @nv_nombre = NEW.apodos;
    INSERT INTO creador VALUES (@nv_id,@nv_nombre);
    END $$
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER BR_creador BEFORE DELETE ON usuario
    FOR EACH ROW BEGIN
    SET @ol_id = OLD.id_usuario;
    DELETE FROM creador WHERE id_creador = @ol_id;
    END $$
DELIMITER ;

USE myunify;

-- 5. cuando se borre un evento, borrarlo de la tabla eventos guardados

SELECT * FROM evento;

DELIMITER $$
	CREATE PROCEDURE borrar_evento(id int)
    BEGIN
    -- Eliminamos la notificación 
    DECLARE id_noti INT DEFAULT 0;
    SELECT Notificacion_id_notificacion INTO id_noti FROM evento WHERE id_evento=id;
    DELETE FROM usuarionotificacion WHERE Notificacion_id_notificacion = id_noti;
    DELETE FROM notificacion WHERE id_notificacion=id_noti;
    -- Eliminamos guardados
    DELETE FROM eventoguardado WHERE id_evento = id;
    -- Eliminamos el evento
    DELETE FROM evento WHERE id_evento = id;
    END $$
DELIMITER ;

CALL borrar_evento(10);

-- 6. (funcion) modificar usuario al momento de editar datos
SELECT * FROM usuario;
DROP PROCEDURE IF EXISTS editar_usuario;

DELIMITER $$
	CREATE PROCEDURE editar_usuario(id int,apodo2 char(45),correo2 char(60),instagram2 char(60))
    BEGIN
    IF apodo2 is not null THEN
		UPDATE usuario
		SET apodos = apodo2
		WHERE id_usuario=id;
	END IF;
    IF correo2 is not null THEN
		UPDATE usuario
		SET correo = correo2
		WHERE id_usuario=id;
	END IF;
    IF instagram2 is not null THEN
		UPDATE usuario
		SET instagram = instagram2
		WHERE id_usuario=id;
	END IF;
    END $$
DELIMITER ;

CALL editar_usuario(11,"angel",null,null);
CALL editar_usuario(12,null,"lanrea@unal.edu.co","andre_li");
 
-- 7. (función) recibir por parametro id de usuario y regresar el numero de eventos guardados

SELECT * FROM eventoguardado;

DELIMITER $$
	CREATE FUNCTION eventosguardados_usuario(id int)
    RETURNS INT
    BEGIN
		DECLARE num_eventos INT DEFAULT 0;
		-- hacemos la consulta que nos trae el maximoINTO max_cost
        SELECT COUNT(id_evento) INTO num_eventos FROM eventoGuardo WHERE id_creador=id;
		return num_eventos;
    END $$
DELIMITER ;

CALL eventosguardados_usuario(1);


-- 11. (indice) usuarios
CREATE UNIQUE INDEX indice_usuarios ON usuario(id_usuario);
-- justificación: es un indice unico por que se busca que la busqueda por id de usuario que es una de las
-- busquedas más comúnes en la eplicación se realice de forma rápida y eficiente.

