import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myunify/datos/Solicitud.dart';
import 'package:myunify/Datos/usuario.dart';
import 'package:myunify/widgets/perfil_widgets/appbar_widget.dart';
import 'package:myunify/widgets/perfil_widgets/button_widget.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/widgets/generales/Colores.dart';

class BuscadorAmigo extends StatefulWidget {

  @override
  _BuscadorAmigoEstado createState() => _BuscadorAmigoEstado();
}

class _BuscadorAmigoEstado extends State<BuscadorAmigo> {
  Color color_interfaz = Color(0xff9AD0EC);
  Color color_interfazGrueso = Color(0xff1572A1);
  Color color_letra = Color(0xffEFDAD7);


  late Usuario amigo;
  Usuario usuarioActual = Metodos.usuarioregistrado;

  late TextEditingController controlleramigo;

  @override
  Widget build(BuildContext context) {
    controlleramigo = TextEditingController(text: "");

    return Scaffold(
      backgroundColor: Colores.colorBurbuja,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          
          const Center(
            child:  Text(
              "Buscador Amigos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ingrese el nombre de usuario de su amig@:",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
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
          controller: controlleramigo,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
              const SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 24),
          Center(child: buscar()),
          const SizedBox(height: 16),
          Center(child: cancelar()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controlleramigo.dispose();
    super.dispose();
  }

  void _amigoEncontrado(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //mirar si dejamos este o el alertDialog de material
            title: Text("Usuario encontrado"),
            content: Text("¿Desea enviar una solicitud de amistad?"),
            actions: <Widget>[
              Center(child: FlatButton(
                  color: Colors.orange.shade400,
                  onPressed: () {
                    Solicitud nueva = Solicitud("", usuarioActual, false);
                    amigo.mensajes.add(nueva);
                    //Navigator.pushReplacementNamed(context, '/amigos');
                    Navigator.pop(context);
                    
                  }, // que cree la solicitud
                  child: const Text("Enviar solicitud de amistad",
                      style: TextStyle(color: Colors.black))),
              ),
               Center(
                 child:FlatButton(
                  color: Colors.orange.shade400,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar",
                      style: TextStyle(color: Colors.black))),
                      ),
            ],
          );
        });
  }

  void _amigoNoEncontrado(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //mirar si dejamos este o el alertDialog de material
            content: Text("Usuario no encontrado, intentelo de nuevo: "),
            actions: <Widget>[
              Center(child: FlatButton(
                  color: Colors.orange.shade400,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Volver",
                      style: TextStyle(color: Colors.black))),
              ),
            ],
          );
        });
  }

  Widget buscar() => ButtonWidget(
      text: "Buscar",
      onClicked: () {
        Usuario resultado = Metodos.BuscarUsuario(controlleramigo.text);
        if (resultado.NombreUsuario != '') {
          _amigoEncontrado(context);
          amigo = resultado;
        } else {
          _amigoNoEncontrado(context);
          amigo = resultado;
        }
      });
  Widget cancelar() => ButtonWidget(
      text: "Cancelar",
      onClicked: () {
        Navigator.pop(context);
      });
}
