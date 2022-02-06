import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/datos/usuario.dart';
import 'package:myunify/widgets/perfil_widgets/textfield_widget.dart';
import 'package:myunify/widgets/camara_widgets/camara.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilEstado createState() => _EditarPerfilEstado();
}

class _EditarPerfilEstado extends State<EditarPerfil> {
  File? foto = null;

  Usuario usuarioActual = Metodos.usuarioregistrado;

  late TextEditingController controllernombre;
  late TextEditingController controllernombreUsuario;
  late TextEditingController controllerinstagram;
  late TextEditingController controllercorreo;

  String prueba = " ";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controllernombre = TextEditingController(text: usuarioActual.nombre);
    controllerinstagram = TextEditingController(text: usuarioActual.usuarioig);
    controllernombreUsuario =
        TextEditingController(text: usuarioActual.nombreUsuario);
    controllercorreo = TextEditingController(text: usuarioActual.correo);

    return Scaffold(
      backgroundColor: Colores.colorBurbuja,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          Center(
            child: Text(
              "Editar datos",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(child: Container(
              margin: const EdgeInsets.only(top: 7),
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 10, color: Colores.colorComplementario),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FotoUsuario(callback: (File? imagen) => foto = imagen)),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: controllernombre,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
              const SizedBox(height: 10),
              Text(
                "Usuario:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: controllernombreUsuario,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
              const SizedBox(height: 10),
              Text(
                "Usuario Instagram: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: controllerinstagram,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
              const SizedBox(height: 10),
              Text(
                "Correo: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: controllercorreo,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
            ],
          ),
          const SizedBox(height: 24),
          Center(child: guardar()),
          const SizedBox(height: 16),
          Center(child: cancelar()),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controllernombre.dispose();
    controllernombreUsuario.dispose();
    controllerinstagram.dispose();
    controllercorreo.dispose();
    super.dispose();
  }

  Widget guardar() => ButtonWidget(
      text: "Guardar",
      onClicked: () {
        //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto
        foto != null
            ? Metodos.EditarPerfil(
                controllernombre.text,
                controllercorreo.text,
                controllernombreUsuario.text,
                controllerinstagram.text,
              )
            : Metodos.EditarPerfil(
                controllernombre.text,
                controllercorreo.text,
                controllernombreUsuario.text,
                controllerinstagram.text,
              );

        Navigator.pushReplacementNamed(context, "/Main");
      });

  Widget cancelar() => ButtonWidget(
      text: "Cancelar",
      onClicked: () {
        Navigator.pop(context);
      });
}
