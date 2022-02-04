import 'package:flutter/material.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/datos/usuario.dart';
import 'package:myunify/pantallas/paginaPrincipal.dart';
import 'pantalla_editar.dart';
import 'pantalla_contrasena.dart';

class PaginaPerfil extends StatefulWidget {
  @override
  _PerfilEstado createState() => _PerfilEstado();
}

class _PerfilEstado extends State<PaginaPerfil> {
  // final contactoActual = Metodos.contactoActual;

  dynamic usuarioActual = Metodos.usuarioregistrado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      //appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          Center(
            child: Text(
              "Tu perfil",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ProfileWidget(
            imagePath: usuarioActual.linkFoto,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          construirNombre(usuarioActual),
          const SizedBox(height: 13),
          construirInformacion(usuarioActual),
          const SizedBox(height: 16),
          Center(child: editarContacto()),
          const SizedBox(height: 16),
          Center(child: cambiarContrasena()),
          const SizedBox(height: 16),
          Center(child: cerrarSesion()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget construirNombre(Usuario user) => Column(
        children: [
          Text(
            user.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.nombreUsuario,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      );

  Widget editarContacto() => ButtonWidget(
      text: "Editar datos",
      onClicked: () {
        Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => EditarPerfil()),
              );
      });

  Widget cambiarContrasena() => ButtonWidget(
      text: "Cambiar contraseña",
      onClicked: () {
        Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => EditarContrasena()),
              );
      });

  Widget cerrarSesion() => ButtonWidget(
      text: "Cerrar sesión",
      onClicked: () {
        Navigator.pushReplacementNamed(context, "/");
      });

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    super.dispose();
  }

  Widget construirInformacion(Usuario user) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Usuario Instagram",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            user.usuarioig,
            style: const TextStyle(
              height: 1.4,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Correo",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            user.correo,
            style: const TextStyle(
              height: 1.4,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
}
