import 'dart:io';

import 'package:myunify/data/Solicitud.dart';
import 'package:myunify/data/usuario.dart';

class Metodos {
  static late Usuario usuarioregistrado = Usuario(
    "",
    "",
    "",
    "",
    "",
    null,
  );
  static late Usuario viendoAmigo;
  static late Usuario buscandoUsuario;

  static List<Usuario> totalUsuarios = [
    Usuario(
      "Jose Simon Ramos",
      "XxpapisimonxX@hotmail.com",
      "sutaponcito",
      "angelsuicida",
      "@xxemocionalssxx",
      null,
    ),
    Usuario(
      "Juan Manuel Cortes",
      "XxpapijuanxX@hotmail.com",
      "salaverga",
      "pacman",
      "@estavaparajuan",
      null,
    ),
    Usuario(
      "Jefferson Duvan Ramirez",
      "XxpapijeffxX@hotmail.com",
      "12345",
      "jeff",
      "@monstro32",
      null,
    ),
    Usuario(
      "Alexei Fernandez",
      "XxiexeixX@hotmail.com",
      "alexei",
      "alexei12",
      "@alexei3212",
      null,
    ),
    Usuario(
      "Pecha Rojas",
      "XxpechisxX@hotmail.com",
      "123",
      "pechitagod",
      "@pecha_pro",
      null,
    ),
    Usuario(
      "Jonatan Gomez",
      "XxjonixX@hotmail.com",
      "colchas",
      "jonatanuwu",
      "@i<3colchas",
      null,
    )
  ];

  static bool Autenticar(String usuario, String contrasena) {
    for (var i = totalUsuarios.length - 1; i >= 0; i--) {
      if (totalUsuarios[i].NombreUsuario == usuario) {
        if (totalUsuarios[i].Contrasena == contrasena) {
          return true;
        } else {
          return false;
        }
      }
    }
    return (false);
  }

  static void EditarPerfil(String nombre, String correo, String nombreUsuario,
      String usuarioig, File? imagen) {
    if (imagen != null) {
      usuarioregistrado.foto = imagen;
    }
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



  // ignore: non_constant_identifier_names
  static bool ValidarRegistro(Usuario nuevo) {
    int i = 0;
    while (i < totalUsuarios.length &&
        (totalUsuarios[i].nombreUsuario != nuevo.NombreUsuario &&
            totalUsuarios[i].correo != nuevo.correo)) {
      i++;
    }
    return i == totalUsuarios.length;
  }

  static Usuario RegistrarUsuario(String nombre, String correo, String clave,
      String username, String usuarioIg, File? foto) {
    Usuario nuevo = Usuario(nombre, correo, clave, username, usuarioIg, foto);
    //print(nuevo);
    //totalUsuarios.add(nuevo);
    return nuevo;
  }

  static EliminarMensaje(int indice, Usuario user) {
    print("cantidad de mensajes al eliminar: ${user.mensajes.length}");
    //user.mensajes.remove(user.mensajes[indice]);
    print("cantidad de mensajes despues de eliminar: ${user.mensajes.length}");
  }

  static AceptarSolicitud(Usuario remitente, Usuario destino, int indice) {
    print("cantidad de amigos en el metoddo aceptar: ");
    print(destino.amigos.length);
    destino.amigos.add(remitente);
    print(destino.amigos.length);
    //EliminarMensaje(indice, destino);
  }

  static void EstablecerRegistrado(String usuario) {
    for (var i = totalUsuarios.length - 1; i >= 0; i--) {
      if (totalUsuarios[i].NombreUsuario == usuario) {
        usuarioregistrado = totalUsuarios[i];
      }
    }
  }
}
