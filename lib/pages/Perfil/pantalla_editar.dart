import 'package:flutter/material.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/Datos/usuario.dart';


class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilEstado createState() => _EditarPerfilEstado();
}

class _EditarPerfilEstado extends State<EditarPerfil> {
  Color color_interfaz = Color(0xff9AD0EC);
  Color color_interfazGrueso = Color(0xff1572A1);
  Color color_letra = Color(0xffEFDAD7);
  Color color_fondo = Color(0xffE4E4E4);

  Usuario usuarioActual = Metodos.usuarioregistrado;

  late TextEditingController controllernombre;
  late TextEditingController controllernombreUsuario;
  late TextEditingController controllerinstagram;
  late TextEditingController controllercorreo;

  String prueba = " ";
  @override
  Widget build(BuildContext context) {

    controllernombre = TextEditingController(text: usuarioActual.nombre);
    controllerinstagram = TextEditingController(text: usuarioActual.nombre);
    controllernombreUsuario = TextEditingController(text: usuarioActual.nombreUsuario);
    controllercorreo = TextEditingController(text: usuarioActual.correo);
    
    return Scaffold(
      backgroundColor: Colors.red,
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
          ProfileWidget(
            imagePath: usuarioActual.foto,
            onClicked: () async {},
            size: 55,
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre completo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: controllernombre,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  )),
              const SizedBox(height: 10),
              Text(
                "Nombre de usuario:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextField(
                controller: controllernombreUsuario,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              ),
              const SizedBox(height: 10),
              Text(
                "Usuario Instagram: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerinstagram,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Correo: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllercorreo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
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
        print(controllernombre.text);
        Metodos.EditarPerfil(
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
