import 'package:flutter/material.dart';
import 'package:myunify/data/usuario.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/widgets/mensajes_widgets/InfoEvento.dart';

class Aceptar extends StatelessWidget {
  AceptarSolicitud(Usuario remitente, Usuario destino, int indice) {
    print("cantidad de amigos en el metoddo aceptar: ");
    print(destino.amigos.length);
    destino.amigos.add(remitente);
    print(destino.amigos.length);
    //EliminarMensaje(indice, destino);
  }

  // Function accion;  , required this.accion
  Usuario destino;
  Usuario remitente;
  int indice;
  Aceptar(
      {Key? key,
      required this.remitente,
      required this.destino,
      required this.indice})
      : super(key: key);


  @override
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: Colors.black),
    child: GestureDetector(
        onTap: Metodos.AceptarSolicitud(remitente, destino,
            indice), //(){print("entrastte al boton");},// Metodos.AceptarSolicitud(remitente, Metodos.usuarioregistrado, indice),
        child: RichText(
          text: TextSpan(children: [
            WidgetSpan(
                child:
                    Icon(Icons.check_circle_outline, color: Colors.green[200])),
            const TextSpan(
              text: " aceptar ",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ]),
        )),
  );
}
}
/*
@override
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: Colors.black),
    child: GestureDetector(
        onTap: Metodos.AceptarSolicitud(remitente, destino,
            indice), //(){print("entrastte al boton");},// Metodos.AceptarSolicitud(remitente, Metodos.usuarioregistrado, indice),
        child: RichText(
          text: TextSpan(children: [
            WidgetSpan(
                child:
                    Icon(Icons.check_circle_outline, color: Colors.green[200])),
            const TextSpan(
              text: " aceptar ",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ]),
        )),
  );
}
*/