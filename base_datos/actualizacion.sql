INSERT INTO fraternidad (id_creador_fraternidad,id_usuarioJefe,descripcion,nombre)
VALUES 
   (1,1,'Club de reciclaje para cuidar el planeta','TapitasClub'),
   (2,2,'Fans de Juego de tronos reunidos para hablar de teorías','GameOfUnal'),
   (3,4,'Clases de yoga abiertas para todo público','YogaUnal'),
   (4,6,'Clases de salsa abiertas para toda la comunidad universitaria','SalsaUnal'),
   (5,9,'Club para cuadrar partidos de microfutbol','FutbolUnal'),
   (6,7,'Club de reflexión sobre problematicas universitarias','Unal4All'),
   (7,8,'Club de lectura para todos los amantes de la ciencia ficción','FictionBooks'),
   (8,3,'Clases de herramientas emocionales para cualquiera','Sentipensando'),
   (9,5,'Conferencias de ingeniería para aprender e innovación','Ingeniando'),
   (10,10,'Grupo religioso centrado en la alabanza de Buda','BudaUnal')
;
   
INSERT INTO pregunta (id_pregunta,Evento_id_evento,id_remitente,contenido)
VALUES 
	(1,2,1,'¿Qué tipo de ropa debo llevar?'),
	(2,2,1,'¿Cómo llego al estadio?'),
	(3,2,1,'¿Debo llenar algún formulario?'),
	(4,2,1,'¿Cómo puedo entrar a la universidad si no soy estudiante?'),
	(5,2,1,'¿A qué facultad va dirigida el evento?'),
	(6,2,1,'¿Dónde puedo encontrar más información?'),
	(7,2,1,'¿Quienes van a dirigir el evento?'),
	(8,2,1,'¿Tiene algún costo adicional?'),
    (9,2,1,'¿Se volverá a repetir el evento en un futuro?'),
	(10,2,1,'¿Qué prerequisitos debo cumplir para ir al evento?')
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
   

INSERT INTO respuesta(id_respuesta,Pregunta_id_pregunta,id_remitente,contenido) VALUES 
(1,10,3,'debes tener mas de 18 años'),
(2,8,2,'Si, las bebidas cuestan 3500 y los sandwiches 10000'),
(3,9,5,'no, no se volvera a repetir'),
(4,7,2,'La direccion nacional de bienestar'),
(5,6,1,'escribiendo al correo aj@unal.edu.co'),
(6,5,4,'A la facultad de artes'),
(7,4,9,'Puedes saltar la reja de la calle 26'),
(8,3,7,'no, no debes'),
(9,2,6,'dios mio siempre preguntan lo mismo. Por el cyt'),
(10,1,8,'debes tener el carnet de vacunacion al dia');

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

