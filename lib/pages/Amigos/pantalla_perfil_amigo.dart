import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/Datos/usuario.dart';
import 'package:myunify/widgets/perfil_widgets/container_widget.dart';
import 'package:myunify/widgets/perfil_widgets/container_widget2.dart';

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
      backgroundColor: Colores.colorBurbuja,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: amigoActual.foto,
            onClicked: () async {},
            size: 55,
          ),
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
          ContainerWidget2(text: "Nombre:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: user.nombre),
          const SizedBox(
            height: 10,
          ),
          ContainerWidget2(text: "Nombre de usuario:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: user.nombreUsuario),
          const SizedBox(
            height: 10,
          ),
          ContainerWidget2(text: "Instagram:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: user.usuarioig),
          const SizedBox(
            height: 10,
          ),
          ContainerWidget2(text: "Correo:"),
          const SizedBox(
            height: 6,
          ),
          ContainerWidget(text: user.correo),
          const SizedBox(
            height: 10,
          ),
        ],
      );
}
