import 'dart:io';

import 'package:myunify/Datos/Solicitud.dart';
import 'package:myunify/Datos/usuario.dart';

class Metodos {
  static late Usuario usuarioregistrado = Usuario(
    "holix",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
    null,
  );
  static late Usuario viendoAmigo = Usuario(
    "Juan Cortes",
    "Juan@hotmail.com",
    "holibb",
    "juanix",
    "juan32",
    null,
  );

  static late Usuario buscandoUsuario;

  static List<Usuario> totalUsuarios = [
    Usuario(
      "Juan Cortes",
      "Juan@hotmail.com",
      "holibb",
      "xxx",
      "123",
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

  static bool Autenticar(String usuario, String contrasena) {
    for (var i = totalUsuarios.length - 1; i >= 0; i--) {
      if (totalUsuarios[i].NombreUsuario == usuario) {
        if (totalUsuarios[i].contrasena == contrasena) {
          return true;
        } else {
          return false;
        }
      }
    }
    return (false);
  }

  static void EditarPerfil(
      String nombre, String correo, String nombreUsuario, String usuarioig) {
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

  static Usuario BuscarUsuario(String buscar) {
    for (var i = totalUsuarios.length - 1; i >= 0; i--) {
      if (totalUsuarios[i].NombreUsuario == buscar) {
        return totalUsuarios[i];
      }
    }

    return Usuario('', '', '', '', '', null);
  }

  static RegistrarUsuario(String nombre, String correo, String clave,
      String username, String usuarioIg, File? foto) {
    Usuario nuevo = Usuario(nombre, correo, clave, username, usuarioIg, foto);
    print(nuevo);
    //totalUsuarios.add(nuevo);
  }

  static EliminarMensaje(int indice, Usuario user) {
    print("cantidad de mensajes al eliminar: ${user.mensajes.length}");
    user.mensajes.remove(user.mensajes[indice]);
    print("cantidad de mensajes despues de eliminar: ${user.mensajes.length}");
  }

  static AceptarSolicitud(Usuario remitente, Usuario destino, int indice) {
    print("cantidad de amigos en el metoddo aceptar: ");
    print(destino.amigos.length);
    destino.amigos.add(remitente);
    print(destino.amigos.length);
    //EliminarMensaje(indice, destino);
  }
}
