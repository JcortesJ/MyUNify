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
