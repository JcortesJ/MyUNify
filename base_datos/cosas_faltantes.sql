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