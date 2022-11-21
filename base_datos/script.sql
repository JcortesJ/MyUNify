
-- -----------------------------------------------------
-- Schema MyUnify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MyUnify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS MyUnify;
USE MyUnify ;

-- -----------------------------------------------------
-- Tabla Creador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Creador(
  id_creador INT NOT NULL,
  nombre_creador CHAR(60) NOT NULL,
  PRIMARY KEY (id_creador));

-- -----------------------------------------------------
-- Tabla Usuario
-- -----------------------------------------------------
-- EJECUTAR PRIMERO 
CREATE TABLE IF NOT EXISTS Usuario (
  id_usuario INT NOT NULL,
  id_fraternidad INT NULL,
  apodos CHAR(45) NOT NULL,
  clave CHAR(25) NOT NULL,
  correo CHAR(60) NOT NULL,
  instagram CHAR(30) NOT NULL,
  importancia INT NOT NULL,
  PRIMARY KEY (id_usuario)
 );




-- -----------------------------------------------------
-- Tabla Fraternidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fraternidad (

  id_creador_fraternidad INT NOT NULL,
  id_usuarioJefe INT,
  descripcion TEXT(120) NOT NULL,
  nombre CHAR(45) NOT NULL,
  PRIMARY KEY (id_creador_fraternidad))
;
-- LUEGO EJECUTAR ALTER
ALTER TABLE USUARIO 
    ADD FOREIGN KEY (id_usuario)
    REFERENCES MyUnify.Creador(id_creador)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    ADD FOREIGN KEY (id_fraternidad)
    REFERENCES MyUnify.Fraternidad (id_creador_fraternidad)
    ON DELETE CASCADE  ON UPDATE CASCADE
;

ALTER TABLE Fraternidad 
    ADD FOREIGN KEY (id_creador_fraternidad)
    REFERENCES MyUnify.Creador(id_creador)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    ADD FOREIGN KEY (id_usuarioJefe)
    REFERENCES MyUnify.Usuario(id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table LUGAR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Lugar (
  id_lugar INT NOT NULL,
  aforo INT NOT NULL,
  direccion CHAR(80) NOT NULL,
  nombre CHAR(80) NOT NULL,
  PRIMARY KEY (id_lugar));


-- -----------------------------------------------------
-- Table MyUnify.Notificacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Notificacion (
  id_notificacion INT NOT NULL,
  id_remitente INT NOT NULL,
  estado TINYINT NOT NULL,
  tipo ENUM('amistad','evento'),
  PRIMARY KEY (id_notificacion),
  FOREIGN KEY(id_remitente) REFERENCES MyUnify.Creador(id_creador));


-- -----------------------------------------------------
-- Table MyUnify.Evento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Evento (
  id_evento INT NOT NULL,
  Notificacion_id_notificacion INT NOT NULL,
  Creador_id_creador INT NOT NULL,
  Lugar_id_lugar INT NOT NULL,
  nombre CHAR(80) NOT NULL,
  descripcion CHAR(150)  DEFAULT 'Severo evento, caiga',
  hora INT NOT NULL,
  fecha DATE NOT NULL,
  facultad CHAR(80) NULL,
  PRIMARY KEY (id_evento),
    FOREIGN KEY (Creador_id_creador)
    REFERENCES MyUnify.Creador (id_creador)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (Lugar_id_lugar)
    REFERENCES MyUnify.Lugar (id_lugar)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (Notificacion_id_notificacion)
    REFERENCES MyUnify.Notificacion (id_notificacion)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MyUnify.Pregunta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pregunta (
  id_pregunta INT NOT NULL,
  Evento_id_evento INT NOT NULL,
  id_remitente INT NOT NULL,
  contenido CHAR(120) NOT NULL,
  PRIMARY KEY (id_pregunta),
    FOREIGN KEY (id_remitente)
    REFERENCES MyUnify.Usuario(id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (Evento_id_evento)
    REFERENCES MyUnify.Evento (id_evento)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MyUnify.Respuesta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Respuesta (
  id_respuesta INT NOT NULL,
  Pregunta_id_pregunta INT NOT NULL,
  id_remitente  INT NOT NULL,
  contenido CHAR(120) NOT NULL,
  PRIMARY KEY (id_respuesta, Pregunta_id_pregunta),
    FOREIGN KEY (Pregunta_id_pregunta)
    REFERENCES MyUnify.Pregunta (id_pregunta)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_remitente)
    REFERENCES MyUnify.Usuario (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MyUnify.Etiqueta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Etiqueta (
  id_etiqueta INT NOT NULL,
  descripcion  CHAR(120) NOT NULL,
  PRIMARY KEY (id_etiqueta))
;


-- -----------------------------------------------------
-- Table MyUnify.EventoEtiqueta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EventoEtiqueta (
  Evento_id_evento INT NOT NULL,
  Etiqueta_id_etiqueta INT NOT NULL,
  PRIMARY KEY (Evento_id_evento, Etiqueta_id_etiqueta),
    FOREIGN KEY (Evento_id_evento)
    REFERENCES MyUnify.Evento (id_evento)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (Etiqueta_id_etiqueta)
    REFERENCES MyUnify.Etiqueta (id_etiqueta)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MyUnify.EtiquetaUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EtiquetaUsuario (
  Etiqueta_id_etiqueta INT NOT NULL,
  Etiqueta_id_usuario INT NOT NULL,
  PRIMARY KEY (Etiqueta_id_etiqueta, Etiqueta_id_usuario),
    FOREIGN KEY (Etiqueta_id_etiqueta)
    REFERENCES MyUnify.Etiqueta(id_etiqueta)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
 -- CONSTRAINT fk_Etiqueta_has_Usuario_Usuario1
    FOREIGN KEY (Etiqueta_id_usuario)
    REFERENCES MyUnify.Usuario (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MyUnify.UsuarioNotificacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS UsuarioNotificacion (
  Notificacion_id_usuario INT NOT NULL,
  Notificacion_id_notificacion INT NOT NULL,
  PRIMARY KEY ( Notificacion_id_usuario, Notificacion_id_notificacion),
    FOREIGN KEY ( Notificacion_id_usuario)
    REFERENCES MyUnify.Usuario (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (Notificacion_id_notificacion)
    REFERENCES MyUnify.Notificacion (id_notificacion)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MyUnify.EventoGuardado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EventoGuardado (
  id_creador INT NOT NULL,
  id_evento INT NOT NULL,
  PRIMARY KEY ( id_creador,id_evento),
    FOREIGN KEY (id_creador)
    REFERENCES MyUnify.Creador ( id_creador),
    FOREIGN KEY (id_evento)
    REFERENCES MyUnify.Evento (id_evento))
;


-- -----------------------------------------------------
-- Table MyUnify.Amigos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Amigos (
  id_amigo1 INT NOT NULL,
  id_amigo2 INT NOT NULL,
  PRIMARY KEY (id_amigo1 ,id_amigo2),
    FOREIGN KEY (id_amigo1 )
    REFERENCES MyUnify.Usuario (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_amigo2)
    REFERENCES MyUnify.Usuario (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

