-- pruebas jjj

SHOW TRIGGERS;

INSERT INTO Creador (id_creador, nombre_creador) 
VALUES (4554,'usuario prueba 1'),(2342,'jijij'),(2000,'prueba2');

INSERT INTO Usuario (id_usuario, apodos, clave, correo, instagram, importancia) 
VALUES (4554,'usuario prueba1',2342,'jiiji','xdxd',2),(2342,'jijijij',234,'xddd','kiki',22),(2000,'kiki do',232,'you love','me',29);

INSERT INTO EVENTO(id_evento,Notificacion_id_notificacion,Creador_id_creador,Lugar_id_lugar,nombre,descripcion,hora,fecha,facultad) VALUES
(23454,69,4554,18,'evento de prueba1','este es un evento de prueba',23,str_to_date('2/2/22','%d/%m/%y'),'ingenieria'),
(23455,70,2342,18,'evento de prueba1','este es un evento de prueba',23,str_to_date('2/2/22','%d/%m/%y'),'ingenieria'),
(23456,71,2342,18,'evento de prueba1','este es un evento de prueba',23,str_to_date('2/2/22','%d/%m/%y'),'ingenieria');

SELECT * FROM notificacion;
SELECT * FROM usuarionotificacion;

SET @numero1 = contar_eventosCreados(4554);
SELECT @numero1,'usuario 1';

SET @numero1 = contar_eventosCreados(2342);
SELECT @numero1,'usuario 2';

SET @numero1 = contar_eventosCreados(2000);
SELECT @numero1,'usuario 3';

INSERT INTO etiquetausuario VALUES (2,2342),(3,2342),(10,2342),(1,4554),(5,4554),(2,2000);
INSERT INTO amigos VALUES (4554,2342),(2342,4554),(2000,4554),(4554,2000);

SELECT * FROM usuario;
SELECT * FROM amigos;
SELECT * FROM etiquetausuario;
SELECT * FROM usuarionotificacion;
SELECT * FROM creador;

CALL baja_usuario(2342);
CALL baja_usuario(2000);
CALL baja_usuario(4554);

