import 'package:flutter/material.dart';
import 'package:myunify/datos/EventoOcio.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/mensajes_widgets/AppBarMsg.dart';
import 'package:myunify/widgets/mensajes_widgets/Cabeza.dart';
import 'package:myunify/widgets/mensajes_widgets/MsgEvento.dart';
import 'package:myunify/widgets/mensajes_widgets/MsgSolicitud.dart';
import 'package:myunify/datos/eventoLogica.dart';
import 'package:myunify/datos/Evento.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({Key? key}) : super(key: key);

  @override
  _MensajesState createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  List<dynamic> mensajesMostrar = MetodosEvento.eventosPublicos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarmsg(context),
        body: Fondopantalla(
            child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: List.generate(mensajesMostrar.length, (index) {
            if (mensajesMostrar[index] is Evento) {
              return Msgevento(
                //a veces leer bien las cosas nos hace mejores
                eventoMostrando: mensajesMostrar[index],
              );
            } else {
              SizedBox(
                height: 15,
              );
              return Msgsolicitud();
            }
          }),
        )

            /*
              ListView(children: [
          Cabeza(),
          SizedBox(
            height: 15,
          ),
          Msgsolicitud(),
          SizedBox(
            height: 15,
          ),
          Msgevento()
        ]))
             */

            ));
  }
}
