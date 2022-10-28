INSERT INTO fraternidad (id_creador_fraternidad,id_usuarioJefe,descripcion,nombre)
VALUES 
   (1,1,'Club de reciclaje para cuidar el planeta','TapitasClub'),
   (1,1,'Fans de Juego de tronos reunidos para hablar de teorías','GameOfUnal'),
   (1,1,'Clases de yoga abiertas para todo público','YogaUnal'),
   (1,1,'Clases de salsa abiertas para toda la comunidad universitaria','SalsaUnal'),
   (1,1,'Club para cuadrar partidos de microfutbol','FutbolUnal'),
   (1,1,'Club de reflexión sobre problematicas universitarias','Unal4All'),
   (1,1,'Club de lectura para todos los amantes de la ciencia ficción','FictionBooks'),
   (1,1,'Clases de herramientas emocionales para cualquiera','Sentipensando'),
   (1,1,'Conferencias de ingeniería para aprender e innovación','Ingeniando'),
   (1,1,'Grupo religioso centrado en la alabanza de Buda','BudaUnal')
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
   



