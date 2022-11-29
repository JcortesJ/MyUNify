CREATE SCHEMA taller_triggers;
USE taller_triggers;

create table T1 (
a int primary key,
b varchar (15)
);
create table T2 (
x int auto_increment primary key ,
a int,
b varchar (15),
cuenta varchar (50),
data_base varchar (15),
fecha date,
operacion varchar (15) check ( operacion in
('Adicion', 'Actualizacion','Borrado') ),
tabla varchar (15)
);
create view VW_T2 as
SELECT a, b FROM T2 WHERE cuenta = user() and data_base=database() with check option;

/*punto 2*/

INSERT T1 values (1, 'Maria Lopez');
INSERT T1 values (2, 'Alvaro Perez');
select * from T1;
select * from T2;
select * from VW_T2;

DELIMITER $$
CREATE TRIGGER TR_T1 BEFORE INSERT on T1
FOR EACH ROW BEGIN
SET @aa = NEW.a;
SET @bb = NEW.b;
INSERT INTO T2 (a, b, cuenta, data_base, fecha, operacion,
tabla) values ( @aa, @bb, user(), database(), CURDATE(),
'Adicion', 'T1');
END $$ 
DELIMITER ;

insert T1 values (3, 'Luis Gomez');
select * from T1;
select * from T2;
select * from VW_T2;


insert T1 values (4, "Pedro Mora");
insert T1 values (5, "Maria Acosta");
insert T1 values (6, "Sandra Perez");
insert T1 values (7, "Jose Rueda");
select * from T1;
select * from T2;
select * from VW_T2;

/*Parte 2 del taller*/
DROP SCHEMA presentaciones_museos;

CREATE SCHEMA presentaciones_museos ;
USE presentaciones_museos;

-- Drop table if exists presentacion;
-- Drop table if exists museo;
-- drop table if exists obra;
-- drop table if exists exposicion;

CREATE TABLE museo (
     mus_id INTEGER NOT NULL PRIMARY KEY,
     mus_nombre VARCHAR(45) NOT NULL
);

CREATE TABLE exposicion (
    exp_id INTEGER NOT NULL PRIMARY KEY,
    exp_nombre VARCHAR(50) NOT NULL
);

CREATE TABLE obra(
    obr_id INTEGER NOT NULL PRIMARY KEY,
    obr_nombre VARCHAR(50) NOT NULL,
    obr_tipo VARCHAR(50) NOT NULL,
    obr_costo DOUBLE NOT NULL,
    obr_exp_id INTEGER NOT NULL,
    FOREIGN KEY (obr_exp_id) REFERENCES exposicion(exp_id)
		
);

CREATE TABLE presentacion(
    pre_fecha VARCHAR(50) NOT NULL,
    pre_mus_id INTEGER NOT NULL,
    pre_obr_id INTEGER NOT NULL,
    FOREIGN KEY (pre_obr_id) REFERENCES obra(obr_id) ,
    FOREIGN KEY (pre_mus_id) REFERENCES museo(mus_id)
);

INSERT INTO museo(mus_id,mus_nombre) VALUES 
    (101,'Louvre'),
    (102,'Met'),
    (205,'Shangai'),
    (304,'Britanico');

INSERT INTO exposicion(exp_id,exp_nombre) VALUES
(1003,'Da Vinci'),
(1004,'Renacimiento'),
(1005,'Cubismo'),
(1006,'Impresionismo');

INSERT INTO obra(obr_id,obr_nombre,obr_tipo,obr_costo,obr_exp_id) VALUES
(111,'Mona lisa','Pintura', 1000,1003),
(112,'Ultima cena','Pintura',800,1003),
(113,'Hombre vitruvio','Boceto',400,1003),
(114,'Planos','Planos',200,1003),
(200,'Fornarina','Pintura',400,1004),
(201,'David','Escultura',700,1004),
(202,'Nacimiento venus','Pintura',250,1004),
(300,'Violin and candlestick','Pintura',300,1005),
(301,'Les demoiselles d’avignon','Pintura',350,1005),
(302,'Cabeza de mujer','Escultura',300,1005),
(400,'Autorretrato','Pintura',100,1006),
(401,'La parade','Pintura',300,1006),
(402,'Solei levant','Pintura',300,1006);

INSERT INTO presentacion(pre_fecha,pre_mus_id,pre_obr_id) VALUES
('Ene-mar-2019',101,111),
('Oct-dic-2019',101,111),
('Ene-mar-2019',101,112),
('Oct-dic-2019',101,112),
('May-sept-2019',101,200),
('May-sept-2019',101,201),
('Oct-dic-2019',101,113),
('Ene-jul-2019',102,300),
('Ene-jul-2019',102,301),
('Abr-jun-2019',102,113),
('Sept-2019',102,113),
('Abr-jun-2019',102,112),
('sept-2019',102,112),
('Ene-abr-2019',102,202),
('Ene-abr-2019',102,201),
('Jul-2019',205,113),
('Jul-2019',205,114),
('Marz-jun-2019',205,401),
('Marz-jun-2019',205,402),
('Oct-dic-2019',205,301),
('Oct-dic-2019',205,302),
('Oct-dic-2019',205,200),
('Oct-dic-2019',205,202),
('Ago-nov-2019',304,402),
('Ago-nov-2019',304,400),
('Jul-ago-2019',304,114),
('Jul-ago-2019',304,111);

/*
Crear una tabla historia con el esquema (his_id, his_fecha, his_obr_nombre,
his_acción). Crear un trigger, que cada vez que se borren o inserten obras en la tabla
Obra se inserte un registro en la tabla historia con la fecha y hora, nombre de la obra,
y la acción realizada (borrado o inserción). Adicionar y borrar obras, para probar el
trigger.
*/

CREATE TABLE historia (
	his_id INT primary key auto_increment,
    hid_fecha VARCHAR(50),
    his_obr_nombre VARCHAR(50),
    his_accion varchar(15) check ( his_accion in
('Adicion', 'Actualizacion','Borrado'))
);

/*TR insertar*/
DELIMITER $$
CREATE TRIGGER TR_INS BEFORE INSERT on obra
FOR EACH ROW BEGIN
SET @nombre_obr = NEW.obr_nombre;
INSERT INTO historia (hid_fecha,his_obr_nombre,his_accion) values ( CURDATE(),@nombre_obr,'Adicion');
END $$ 
DELIMITER ;

/*TR borrar*/
DELIMITER $$
CREATE TRIGGER TR_BOR BEFORE DELETE on obra
FOR EACH ROW BEGIN
SET @nombre_obr = OLD.obr_nombre;

INSERT INTO historia (hid_fecha,his_obr_nombre,his_accion) values ( CURDATE(),@nombre_obr,'Borrado');
END $$ 
DELIMITER ;


INSERT INTO obra(obr_id,obr_nombre,obr_tipo,obr_costo,obr_exp_id) VALUES
(500,'obra prueba 1','Pintura', 1000,1003),
(501,'obra prueba 2','Pintura', 1000,1003),
(502,'obra prueba 3','Escultura', 1000,1003),
(503,'obra prueba 4','Pintura', 1000,1003),
(504,'obra prueba 5','Boceto', 1000,1003);

SELECT * FROM historia;

DELETE FROM obra 
WHERE obr_id >= 500 ;



SELECT * FROM historia;

/*
Crea un trigger que cada vez que el precio de una Obra cambie inserte en una tabla
llamada historia2, el id de la obra, la fecha, el usuario de la bd, el costo antiguo, el
costo nuevo y el porcentaje de cambio (incremento o reducción, si aplica). Después
de creado el trigger, crear y ejecutar varias veces un PA que cambie el costo
(incremento y reducción del costo) de las obras y revisar la tabla historia2
*/

CREATE TABLE historia2 (
 id_accion INT PRIMARY KEY auto_increment,
 id_obra INT,
 fecha VARCHAR(50),
 usuario VARCHAR(50),
 costo_antiguo DOUBLE,
 costo_nuevo DOUBLE,
 porcentaje_cambio DOUBLE,
 incremento BOOLEAN
);
DROP TRIGGER TR_UP;
DELIMITER $$
CREATE TRIGGER TR_UP BEFORE UPDATE ON obra
FOR EACH ROW BEGIN
	SET @id = OLD.obr_id;
    SET @antiguo = OLD.obr_costo;
    SET @nuevo = NEW.obr_costo;
    IF @antiguo >= @nuevo THEN
		SET @incremento = FALSE;
        SET @porcentaje = 1-(@nuevo/@antiguo);
	
	ELSEIF @antiguo < @nuevo THEN
		SET @incremento = TRUE;
        SET @porcentaje = (@nuevo/@antiguo)-1;
	END IF;
INSERT INTO historia2 (id_obra,fecha,usuario,costo_antiguo,costo_nuevo,porcentaje_cambio,incremento) VALUES (@id,CURDATE(),USER(),@antiguo,@nuevo,@porcentaje,@incremento);
END $$
DELIMITER ;
DROP TRIGGER TR_UP;

DELIMITER $$
CREATE PROCEDURE cambio_precioMas()
BEGIN
	UPDATE  obra
    /*incremento del 20% para obras pares*/
    SET obr_costo = (obr_costo)*(1.2)
    WHERE obr_id % 2 = 0;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cambio_precioMen()
BEGIN
	UPDATE  obra
    /*decremento del 20% para obras impares*/
    SET obr_costo = obr_costo-(obr_costo)*(0.2)
    WHERE obr_id % 2 != 0;
END $$
DELIMITER ;

/*PUNTO 3*/

/*Crear Triggers necesarios para que borre en cascada sobre las tablas relacionadas
cuando se borre una exposición. Mostrar el registro borrado al ejecutar el Trigger. */

DELIMITER $$
CREATE TRIGGER borrarExposicion BEFORE DELETE ON exposicion
FOR EACH ROW BEGIN
-- BUSCAMOS EL ID DE LA EXPO

DECLARE numero INT DEFAULT 0;
set @id = OLD.exp_id;
-- primero borramos las presentaciones y luego las obras
-- contamos cuantas obras tienen la expo
SET numero = (SELECT COUNT(*) FROM obra WHERE obr_exp_id=@id);
recorrido:
WHILE numero>0
DO

DELETE FROM presentacion
WHERE pre_obr_id = (SELECT obr_id FROM obra WHERE obr_exp_id=@id

LIMIT 1);

SET numero = numero-1;
END
WHILE recorrido;
-- luego borramos libremente
DELETE FROM obra
WHERE obr_exp_id = @id;
-- finalmente borramos la exposicion
END $$
DELIMITER ;

DROP TRIGGER borrarExposicion;

DELETE FROM exposicion WHERE exp_id = 1006;
SELECT * FROM exposicion;
SELECT * FROM obra;
SELECT * FROM presentacion;


/*Crear un Trigger que se active cuando se cambie el código de una obra, que cambie
el código en las tablas relacionadas.*/

DROP TRIGGER TO_UP;
DELIMITER $$
CREATE TRIGGER TO_UP AFTER UPDATE ON obra
FOR EACH ROW BEGIN
	SET @id = NEW.obr_id;
    SET @id_vieja = OLD.obr_id;
    UPDATE presentacion 
    SET pre_obr_id = @id
    WHERE pre_obr_id = @id_vieja;
END $$
DELIMITER ;


UPDATE  obra 
SET obr_id = 115
WHERE obr_id = 111;

SELECT * FROM obra;
SELECT * FROM presentacion;

UPDATE presentacion

SET pre_obr_id = 115
WHERE pre_obr_id = 111;
SET FOREIGN_KEY_CHECKS=0; 


/**
. Crear un trigger que envíe un mensaje antes de realizar una operación sobre la tabla
presentación, avisando cual es la obra relacionada. Probar el trigger
*/

DELIMITER $$
	CREATE procedure mostrar(id INT)
    BEGIN
    SELECT 'la obra relacionada es: ',obr_nombre FROM obra WHERE obr_id = id;
    END $$
DELIMITER ;

DELIMITER $$
	CREATE procedure mostrar2(id INT)
    BEGIN
    CALL mostrar(id);
    END $$
DELIMITER ;

CREATE TABLE mostrarPre (
 id_obra int,
 mensaje VARCHAR(50)
);

DROP TRIGGER TR_PRE;
DELIMITER $$
CREATE TRIGGER TR_PRE BEFORE INSERT    ON presentacion
FOR EACH ROW BEGIN
	SET @id = NEW.pre_obr_id;
    SET @nombre = (SELECT obr_nombre FROM obra WHERE obr_id = @id);
	INSERT INTO mostrarPre VALUES (@id,@nombre);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TR_PR BEFORE UPDATE    ON presentacion
FOR EACH ROW BEGIN
	SET @id = OLD.pre_obr_id;
    SET @nombre = (SELECT obr_nombre FROM obra WHERE obr_id = @id);
	INSERT INTO mostrarPre VALUES (@id,@nombre);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TR_P BEFORE DELETE   ON presentacion
FOR EACH ROW BEGIN
	SET @id = OLD.pre_obr_id;
    SET @nombre = (SELECT obr_nombre FROM obra WHERE obr_id = @id);
	INSERT INTO mostrarPre VALUES (@id,@nombre);
END $$
DELIMITER ;

SELECT * FROM PRESENTACION;
SELECT * FROM mostrarPre;
DELETE FROM presentacion WHERE pre_mus_id = 900;
INSERT INTO presentacion VALUES ('enero jj8',102,112);