-- ACTUALIZANDO VALORES DE FRATERNIDAD-USUARIO
UPDATE usuario
SET id_fraternidad=1
WHERE id_usuario=11;

UPDATE usuario
SET id_fraternidad=1
WHERE id_usuario=13;

UPDATE usuario
SET id_fraternidad=1
WHERE id_usuario=15;

UPDATE usuario
SET id_fraternidad=2
WHERE id_usuario=21;

UPDATE usuario
SET id_fraternidad=3
WHERE id_usuario=81;

UPDATE usuario
SET id_fraternidad=3
WHERE id_usuario=17;

UPDATE usuario
SET id_fraternidad=3
WHERE id_usuario=12;

UPDATE usuario
SET id_fraternidad=4
WHERE id_usuario=31 ;

UPDATE usuario
SET id_fraternidad=4
WHERE id_usuario=19;

UPDATE usuario
SET id_fraternidad=4
WHERE id_usuario=16;

UPDATE usuario
SET id_fraternidad=4
WHERE id_usuario=14;

UPDATE usuario
SET id_fraternidad=5
WHERE id_usuario=91 ;

UPDATE usuario
SET id_fraternidad=6
WHERE id_usuario=41;

UPDATE usuario
SET id_fraternidad=7
WHERE id_usuario=61;

UPDATE usuario
SET id_fraternidad=8
WHERE id_usuario=71;

UPDATE usuario
SET id_fraternidad=8
WHERE id_usuario=18;


UPDATE usuario
SET id_fraternidad=9
WHERE id_usuario=51;

UPDATE usuario
SET id_fraternidad=10
WHERE id_usuario=101;

SELECT * FROM usuario;

UPDATE evento
SET descripcion='evento cancelado por mal clima'
WHERE nombre='Telas UN';

UPDATE etiqueta
SET descripcion='marcha'
WHERE id_etiqueta=1;

-- SELECT * FROM vw_usuariosfraternidad;

-- CASOS DE USO BORRADOS Y ACTUALIZACIONES:
-- CASO 1, UN USUARIO CREA UN EVENTO, PERO DECIDE CAMBIAR LA FECHA Y LUGAR POR OTRO
INSERT INTO creador VALUES(190,'pepito perez');
INSERT INTO usuario VALUES(190,3,'pepito','23432','corsjjs@example.com','ugudus_',2);
INSERT INTO evento VALUES (239,2,190,19,'evento de prueba','este es un evento de prueba',12,str_to_date('12/02/21','%d/%m/%y'),'facultad de prueba');

SELECT * FROM evento WHERE evento.id_evento=239;
UPDATE evento
SET fecha=str_to_date('13/05/22','%d/%m/%y'), hora=13
WHERE evento.id_evento=239;
-- CASO 2, UN MODERADOR VE QUE EL EVENTO ES INAPROPIADO Y LO BORRA
DELETE FROM evento
WHERE evento.id_evento=239;
-- CASO 3 UN USUARIO DECIDE CAMBIAR SU USUARIO Y CONTRASEÑA
SELECT * FROM usuario WHERE id_usuario=190;
UPDATE usuario
SET apodos='pepito super cul', clave='la clave mas segura'
WHERE usuario.id_usuario=190;
-- CASO 4 UN USUARIO DECIDE DARSE DE BAJA DE LA APLICACIÓN
DELETE FROM usuario
WHERE id_usuario=190;

-- CASO 5 MODERADOR ELIMINA UNA RESPUESTA Y UNA PREGUNTA
-- borramos una pregunta
SELECT * FROM pregunta;
DELETE FROM pregunta WHERE lower(pregunta.contenido) LIKE "%ropa%";

-- borramos una respuesta
SELECT * FROM respuesta;
DELETE FROM respuesta WHERE lower(respuesta.contenido) LIKE "%bebida%";

-- CASO 6 FRATERNIDAD CAMBIA DE JEFE

SELECT creador.id_creador FROM creador WHERE  lower(creador.nombre_creador) LIKE '%simon%'; -- obtenemos el id de simon, que es 31

UPDATE fraternidad  -- cambios el lider de la fraternidad de id 1
SET fraternidad.id_usuarioJefe = (
	SELECT creador.id_creador 
    FROM creador 
    WHERE  lower(creador.nombre_creador) LIKE '%simon%' ) 
WHERE fraternidad.id_creador_fraternidad =  1;


-- CASO 7 Usuario se registra

INSERT INTO creador(id_creador, nombre_creador) -- PRIMERO HAY QUE AÑADIRLO A CREADOR
VALUES(120,'Nacho Jaimes');

INSERT INTO usuario(id_usuario, apodos, clave, correo, instagram, importancia) 
VALUES (120, 'nacho', "1234", "nac@unal.edu.co", 'nachito12', 99);

-- CASO 8 Se elimina una amistad

DELETE FROM amigos WHERE id_amigo1=15 AND id_amigo2=12;

-- CASO 9 Se leyó y borro una notificación

DELETE FROM usuarionotificacion WHERE notificacion_id_usuario=2 AND notificacion_id_usuario=6 ;
