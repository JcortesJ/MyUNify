INSERT INTO Creador (id_creador, nombre_creador) 
VALUES
-- FRATERNIDADES
	(1, 'TapitasClub'),
    (2, 'GameOfUnal'),
    (3,'YogaUnal'),
    (4,'SalsaUnal'),
    (5,'FutbolUnal'),
    (6,'Unal4All'),
    (7,'FictionBooks'),
    (8,'Sentipensando'),
    (9,'Ingeniando'),
    (10,'BudaUnal'),
    -- JEFES DE FRATERNIDAD (QUE SON USUARIOS)
    (11, 'Miguel Angel Parra Moreno'),
    (21, 'David Trinidad'),
    (31, 'Simon Blanco Gonzales'),
    (41, 'Juan Manuel Torres Lopez'),
    (51, "Jefferson Stiven Garcia"),
    (61, 'Davo Garnacho'),
    (71, 'Juan Camilo Lizandro Perdomo'),
    (81, 'Fernando Soto Parrado'),
    (91, 'Victor Jara Lara'),
    (101, 'Alvaro Uribe'),
    
    -- USUARIOS QUE NO SON JEFES
    (12, 'Saul Sandoval Hernan'),
    (13, "Luk Sanderman"),
    (14, 'Laura Figueroa Caicedo'),
    (15, 'Samuel kairus'),
    (16, 'Samanta Ramos Jimenez'),
    (17, 'Cesar Lopez Zamora'),
    (18, 'Wilson Mechado Marchan'),
    (19, 'Luna Jaimes Salsedo')
;

-- no le meti el id fraternidad para que no hayan conflictos. Una consulta de actualizacion sería meter los usuarios a fraternidades
INSERT INTO Usuario (id_usuario, apodos, clave, correo, instagram, importancia) 
VALUES
	-- Jefes Fraternidades
	(11, 'Angelo', 'MA124', 'mango@unal.edu.co', 'magoLolo', 90),
    (21, 'Diva', 'DT654', 'dtrini@unal.edu.co', 'divatrini14', 90),
    (31, 'Simoncho', 'SB188', 'simba@unal.edu.co', 'simba88', 90),
    (41, 'JuanMan', 'JT909', 'jmanto@unal.edu.co', 'juanman', 90),
    (51, 'Jeff', 'JG356', 'jstgar@unal.edu.co', 'jeff', 90),
    (61, 'Davismo', 'DG112', 'dgarna@unal.edu.co', 'davismoOficial', 90),
    (71, 'Juanca', 'JL124', 'jucaliz@unal.edu.co', 'juanca77', 90),
    (81, 'Fer', 'FS344', 'fsoto@unal.edu.co', 'xxferxx', 90),
    (91, 'Victicor', 'VJ124', 'vjara@unal.edu.co', 'jara33', 90),
    (101, 'Alvarito', 'MA124', 'AlUrCa@unal.edu.co', 'paraAlvaro', 90),
    -- USUARIOS NORMALES
    (12, 'Saul', 'SS224', 'ssando@unal.edu.co', 'bettercallsaul123', 76),
    (13, 'Sandy', 'LS234', 'sanderman@unal.edu.co', 'sanderman98', 88),
    (14, 'Lala', 'LF354', 'lafigo@unal.edu.co', 'lalafigueroa', 45),
    (15, 'Samu', 'SK344', 'skairus@unal.edu.co', 'samukkk', 85),
    (16, 'Sam', 'SR474', 'samramos@unal.edu.co', 'samy99', 95),
    (17, 'El Gordo', 'CL990', 'ceslop@unal.edu.co', 'gordocesar', 88),
    (18, 'Willy', 'WM998', 'willmercha@unal.edu.co', 'willymer', 45),
    (19, 'LuJaimes', 'LJ335', 'lujimenCa@unal.edu.co', 'lu', 65)
;


INSERT INTO fraternidad (id_usuarioJefe,id_creador_fraternidad,descripcion,nombre)
VALUES 
   (11,1,'Club de reciclaje para cuidar el planeta','TapitasClub'),
   (21,2,'Fans de Juego de tronos reunidos para hablar de teorías','GameOfUnal'),
   (31,4,'Clases de yoga abiertas para todo público','YogaUnal'),
   (41,6,'Clases de salsa abiertas para toda la comunidad universitaria','SalsaUnal'),
   (51,9,'Club para cuadrar partidos de microfutbol','FutbolUnal'),
   (61,7,'Club de reflexión sobre problematicas universitarias','Unal4All'),
   (71,8,'Club de lectura para todos los amantes de la ciencia ficción','FictionBooks'),
   (81,3,'Clases de herramientas emocionales para cualquiera','Sentipensando'),
   (91,5,'Conferencias de ingeniería para aprender e innovación','Ingeniando'),
   (101,10,'Grupo religioso centrado en la alabanza de Buda','BudaUnal')
;
   

INSERT INTO notificacion (id_notificacion,estado,tipo)
VALUES 
   (1,TRUE,'amistad'),
   (2,TRUE,'evento'),
   (3,FALSE,'amistad'),
   (4,TRUE,'evento'),
   (5,FALSE,'amistad'),
   (6,TRUE,'evento'),
   (7,TRUE,'amistad'),
   (8,FALSE,'evento'),
   (9,TRUE,'evento'),
   (10,TRUE,'evento')
;

INSERT INTO Lugar (id_lugar,nombre,direccion,aforo)
VALUES 
	(17,'CYT','Salón 304, edificio 454', 20),
	(18,'Laboratorio de microprocesadores','Salon edificio', 25),
	(19,'Parque de los maestros abstractos','Parque al frente del edificio de cine y televisión', 300),
    (20, 'Museo Leopoldo Rother', 'Carrera 45 No 26-85, Facultad de arquitectura',60),
    (21,'Plaza che','Plaza central de la Nacional frente a la bibilioteca central',200),
    (22,'Auditorio León de Greiff','Auditoria frente a la plaza che', 300),
    (23,'Agora de cultura','Al lado de ',50),
    (25,'Sala de estudio B', 'Tercer piso edificio 404',60),
    (28,'Facultad de ciencias','Salon 201, edificio 476', 30),
    (29,'Terraza CYT', 'Terraza(piso 5) del edificio 454 (ciencia y tecnología)',30),
    (26,'Estadio Alfonso Lopez', 'Estadio ubicado al lado del edificio 702 (cine y televisión)', 400 )
;
-- los eventos usan notificaciones pares xd
INSERT INTO EVENTO(id_evento,Notificacion_id_notificacion,Creador_id_creador,Lugar_id_lugar,nombre,descripcion,hora,fecha,facultad) VALUES
(1,2,1,17,'Aprende a quererte y quererme','Evento diseñado por la red de apoyo ATUN para fomentar el amor propio y hacia el projimo',12,STR_TO_DATE("28/10/2022", "%d/%m/%Y"),'Bienestar'),
(2,4,2,26,'Episfulvo','Evento del grupo de ingenieria de sistemas EPISUNAL para jugar futbol',13,STR_TO_DATE("02/11/2022", "%d/%m/%Y"),'Ingenieria'),
(3,4,4,28,'Jueves de astronomia','Jueves de divulgación de astronomia bajo las estrellas',18,STR_TO_DATE("08/08/2022", "%d/%m/%Y"),'Ciencias'),
(4,6,6,18,'Taller de diseño y uso de MDF','Encontremonos y aprende a usar las maquinas que la universidad ha dispuesto para ti',9,STR_TO_DATE("28/09/2021", "%d/%m/%Y"),'Ingenieria'),
(5,8,7,19,'Telas UN','Demostracion artistica del grupo de telas de la universidad nacional',11,STR_TO_DATE("15/10/2021", "%d/%m/%Y"),'Artes'),
(6,2,8,20,'La arquitectura hoy y ayer, reflexiones de la nueva era','Evento de divulgacion sobre la historia de la arquitectura colombiana',14,STR_TO_DATE("22/05/2021", "%d/%m/%Y"),'Artes'),
(7,4,9,22,'Despidiendo al leon','Ultimo concierto de la banda de egresados de la unal',10,STR_TO_DATE("13/03/2021", "%d/%m/%Y"),'Artes'),
(8,6,10,23,'MilongaUNAL','Clase abierta de Milonga, bajo la antigua torre de enfermeria ',18,STR_TO_DATE("05/06/2022", "%d/%m/%Y"),'Bienestar'),
(9,8,3,25,'Lo perderas todo pero no este parcial','Evento para estudiar para calculo diferencial',8,STR_TO_DATE("07/07/2021", "%d/%m/%Y"),'Sin facultad'),
(10,4,2,29,'Almuerzo 50 años facultad de economia','Evento de integracion dirigido por la direccion de bienestar FCE',12,STR_TO_DATE("09/11/2022", "%d/%m/%Y"),'FCE');



  
INSERT INTO UsuarioNotificacion(Notificacion_id_usuario, Notificacion_id_notificacion)
VALUES 
	(13, 1),
    (14,2),
    (13,2),
    (15,5),
    (12, 2),
    (13,8),
    (15,8),
    (16,6),
    (12,6),
    (11,7),
    (12,3),
    (21,9),
    (21,10),
    (31,4)
;

SELECT * FROM usuario;
 INSERT INTO pregunta (id_pregunta,Evento_id_evento,id_remitente,contenido)
VALUES 
	(1,1,12,'¿Qué tipo de ropa debo llevar?'),
	(2,4,12,'¿Cómo llego al estadio?'),
	(3,6,14,'¿Debo llenar algún formulario?'),
	(4,8,15,'¿Cómo puedo entrar a la universidad si no soy estudiante?'),
	(5,9,16,'¿A qué facultad va dirigida el evento?'),
	(6,3,17,'¿Dónde puedo encontrar más información?'),
	(7,4,18,'¿Quienes van a dirigir el evento?'),
	(8,5,19,'¿Tiene algún costo adicional?'),
    (9,6,31,'¿Se volverá a repetir el evento en un futuro?'),
	(10,7,101,'¿Qué prerequisitos debo cumplir para ir al evento?')
;
  

INSERT INTO respuesta(id_respuesta,Pregunta_id_pregunta,id_remitente,contenido) VALUES 
(1,1,13,'debes tener mas de 18 años'),
(2,8,12,'Si, las bebidas cuestan 3500 y los sandwiches 10000'),
(3,9,15,'no, no se volvera a repetir'),
(4,7,12,'La direccion nacional de bienestar'),
(5,6,11,'escribiendo al correo aj@unal.edu.co'),
(6,5,14,'A la facultad de artes'),
(7,4,19,'Puedes saltar la reja de la calle 26'),
(8,3,17,'no, no debes'),
(9,2,16,'dios mio siempre preguntan lo mismo. Por el cyt'),
(10,1,18,'debes tener el carnet de vacunacion al dia');

 INSERT INTO etiqueta(id_etiqueta,descripcion) VALUES
 (1,'Chistoso, gracioso, entretenido'),
 (2,'Extraño, insolito, exótico'),
 (3,'Miedo, terror, suspenso'),
 (4,'Romantico, Amor, Para parejas'),
 (5,'Familiar, agradable, para divertirse'),
 (6,'Musical, instrumental, auditivo'),
 (7,'Artistico, Aesthetic, interesante'),
 (8,'Cultural, reflexivo, enseñanza'),
 (9,'Deportivo, saludable, recreativo'),
 (10,'Academico, Estudio, Rutinas');
 

INSERT eventoetiqueta(Evento_id_evento,Etiqueta_id_etiqueta) VALUES 
(1,8),
(2,9),
(3,10),
(4,10),
(5,7),
(6,7),
(7,6),
(8,8),
(9,1),
(10,5);

-- Al momento que vayas a crear datos recuerda usar los numeros de 1-10 para tus ids. Si es posible revisa las otras tablas
-- para que haya concordancia entre los datos

INSERT INTO EtiquetaUsuario (Etiqueta_id_usuario,Etiqueta_id_etiqueta) 
VALUES 
-- Jefes Fraternidades
	(11, 1),
    (21, 3),
    (31, 5),
    (41, 7),
    (51, 9),
    (61, 2),
    (71, 4),
    (81, 4),
    (91, 5),
    (101, 5),
    -- USUARIOS NORMALES
    (12, 10),
    (13, 1),
    (14, 9),
    (15, 2),
    (16, 8),
    (17, 3),
    (18, 7),
    (19, 4)
;

INSERT INTO amigos ( id_amigo1, id_amigo2)
VALUES 
	(11, 21),
    (31, 11),
   (31, 18),
    (31, 12),
    (21, 19),
    (61, 12),
    (71, 14),
    (81, 14),
    (91, 15),
    (101, 15),
    (81, 13),
    (91, 16),
    (81, 17),
    (18, 17),
    (11, 19),
    (13, 19),
    (15, 14),
    (16, 14)
;

