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
WHERE id_usuario=81 AND id_usuario=12 AND id_usuario=17;

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
WHERE id_usuario=91 AND id_usuario=18;

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

