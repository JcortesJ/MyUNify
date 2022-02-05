class Usuario {
  String linkFoto = "null";
  late String nombre;
  late String correo;
  late String contrasena;
  late String nombreUsuario;
  late String usuarioig;
  late List<Usuario> amigos = [
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "juanix",
      "juan32",
    ),
  ];
  late String foto;

  Usuario(this.nombre, this.correo, this.contrasena, this.nombreUsuario,
      this.usuarioig);

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
  set NombreUsuario(String l) => nombreUsuario= l;
  set Usuarioig (String x) => usuarioig= x;

  factory Usuario.fromJson(dynamic json) {
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
      };

}
