import 'package:flutter/material.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/datos/usuario.dart';

class PerfilAmigo extends StatefulWidget {
  @override
  _PerfilAmigoEstado createState() => _PerfilAmigoEstado();
}

class _PerfilAmigoEstado extends State<PerfilAmigo> {
  // final contactoActual = Metodos.contactoActual;

  dynamic amigoActual = Metodos.viendoAmigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: amigoActual.linkFoto,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          construirNombre(amigoActual),
          const SizedBox(height: 24),
          construirInformacion(amigoActual),
          const SizedBox(height: 16),
          Center(child: eliminarAmigo()),
          const SizedBox(height: 16),
          Center(child: volver()),
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
            style: const TextStyle(color: Colors.black),
          )
        ],
      );

  Widget eliminarAmigo() => ButtonWidget(
      text: "Eliminar Amigo",
      onClicked: () {
        Metodos.EliminarAmigo(amigoActual);
        //Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        Navigator.pop(context);
      });

  Widget volver() => ButtonWidget(
      text: "Volver",
      onClicked: () {
        //Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        Navigator.pop(context);
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
