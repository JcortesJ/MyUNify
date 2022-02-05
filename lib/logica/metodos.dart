import 'package:myunify/datos/usuario.dart';

class Metodos {
  static late Usuario usuarioregistrado = Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
  );
  static late Usuario viendoAmigo = Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
  );
  static late Usuario buscandoUsuario;
  static List<Usuario> totalUsuarios = [
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

  static void EditarPerfil(String nombre, String correo, String nombreUsuario, String usuarioig) {
    usuarioregistrado.nombre = nombre;
    usuarioregistrado.correo = correo;
    usuarioregistrado.nombreUsuario = nombreUsuario;
    usuarioregistrado.usuarioig = usuarioig;
  }

  static void EditarContrasena(String contrasena) {
    usuarioregistrado.contrasena = contrasena;
  }

  static void EliminarAmigo(Usuario borrar) {
    for (var i = usuarioregistrado.amigos.length - 1; i >= 0; i--) {
      if (usuarioregistrado.amigos[i] == borrar) {
        usuarioregistrado.amigos.remove(usuarioregistrado.amigos[i]);
      }
    }
  }

  static bool BuscarUsuario(String buscar) {
    for (var i = totalUsuarios.length - 1; i >= 0; i--) {
      if (totalUsuarios[i].NombreUsuario == buscar) {
        return (true);
      }
    }
    return (false);
  }
}
