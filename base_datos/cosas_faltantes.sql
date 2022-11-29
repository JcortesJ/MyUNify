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

<<<<<<< HEAD
/*usuarioNot --> recibe notifi --> quien la envia*/
SELECT * FROM notificacion;
SELECT * FROM usuarionotificacion;


CREATE VIEW vw_sol_soli AS
SELECT id_remitente as solicitante ,Notificacion_id_usuario as solicitado FROM (SELECT id_notificacion,id_remitente FROM notificacion WHERE estado=0 AND tipo Like "amistad") AS A
JOIN 
(SELECT Notificacion_id_usuario,Notificacion_id_notificacion FROM usuarionotificacion) AS B
ON A.id_notificacion = B.Notificacion_id_notificacion;

-- DROP view vw_sol_soli;

SELECT (SELECT apodos  FROM usuario JOIN vw_sol_soli ON id_usuario=solicitante)  AS nom_solicitante,
(SELECT apodos  FROM usuario JOIN vw_sol_soli ON id_usuario=solicitado) AS nom_solicitado FROM vw_sol_soli;

DROP PROCEDURE buscarNot_Ev_id;

DELIMITER $$
	CREATE PROCEDURE buscarNot_Ev_id(id_us INT)
    BEGIN 
    SELECT DISTINCT nombre FROM evento  JOIN notificacion WHERE Notificacion_id_notificacion=id_notificacion and id_remitente = id_us;
    END $$
DELIMITER ;
=======
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

DELIMITER $$
	CREATE PROCEDURE infoUser(id int)
    BEGIN
    -- Eliminamos la notificación 
    DECLARE amixCount INT DEFAULT 0;
    DECLARE eventCount INT DEFAULT 0;
    DECLARE apodo CHAR(45);
    DECLARE ig CHAR(30);
    
    SELECT count(*) INTO amixCount FROM amigos WHERE id_amigo1 = id OR id_amigo2 = id;
    SELECT count(id_evento) INTO eventCount FROM evento WHERE Creador_id_creador = id group by(Creador_id_creador);
    SELECT instagram INTO ig FROM usuario WHERE id_usuario = id;
    SELECT apodos INTO apodo FROM usuario WHERE id_usuario = id;
    
    SELECT amixCount, eventCount, apodo, ig;
    
    END $$
DELIMITER ;

>>>>>>> f91a1d69409ed11564089db3ad17a2e987ebb867
