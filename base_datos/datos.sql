-- aqui hare las actualizaciones porqe aja
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

SELECT * FROM vw_usuariosfraternidad;
