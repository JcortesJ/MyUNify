import 'dart:io';

class Usuario {
  late File? foto;
  late String nombre;
  late String correo;
  late String contrasena;
  late String nombreUsuario;
  late String usuarioig;

  List<dynamic> mensajes = [];

  late List<Usuario> amigos = [
    Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
    null,
  ),
  Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
    null,
  ),
  Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
    null,
  ),
  Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
    null,
  ),
  ];

  Usuario(this.nombre, this.correo, this.contrasena, this.nombreUsuario,
      this.usuarioig,
      this.foto);

  String get Correo {
    return correo;
  }

  String get Contrasena {
    return contrasena;
  }

  String get NombreUsuario {
    return nombreUsuario;
  }

  String get Usuarioig {
    return usuarioig;
  }

  set Nombre(String n) => nombre = n;
  set Correo(String c) => correo = c;
  set Contrasena(String e) => contrasena = e;
  set NombreUsuario(String l) => nombreUsuario = l;
  set Usuarioig(String x) => usuarioig = x;

  @override
  String toString() {
      return "Nombre: $nombreUsuario y tengo ${mensajes.length} mensjaes";
  }

/*   factory Usuario.fromJson(dynamic json) {
    return Usuario(
        json['nombre'] as String,
        json['correo'] as String,
        json['contrasena'] as String,
        json['nombreUsuario'] as String,
        json['usuarioig'] as String);
  }

  Map toJson() => {
        'nombre': nombre,
        'correo': correo,
        'contrasena': contrasena,
        'nombreUsuario': nombreUsuario,
        'usuarioig': usuarioig,
      }; */

}
