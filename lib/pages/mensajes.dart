import 'package:flutter/material.dart';
import 'package:myunify/Datos/EventoOcio.dart';
import 'package:myunify/Datos/NotificacionEvento.dart';
import 'package:myunify/Datos/Solicitud.dart';
import 'package:myunify/Datos/usuario.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/mensajes_widgets/AppBarMsg.dart';
import 'package:myunify/widgets/mensajes_widgets/Cabeza.dart';
import 'package:myunify/widgets/mensajes_widgets/MsgEvento.dart';
import 'package:myunify/widgets/mensajes_widgets/MsgSolicitud.dart';
import 'package:myunify/Datos/eventoLogica.dart';
import 'package:myunify/Datos/Evento.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({Key? key}) : super(key: key);

  @override
  _MensajesState createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  List<dynamic> mensajesMostrar = MetodosEvento.eventosPublicos + Metodos.usuarioregistrado.mensajes;
  Usuario destino = Metodos.usuarioregistrado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarmsg(context),
      body: Fondopantalla(
        child: ListView(
          children:
            List.generate(mensajesMostrar.length, (index){
              print(mensajesMostrar.length);
              if(mensajesMostrar[index] is Solicitud ){
                Usuario remitente = mensajesMostrar[index].emisor;
                print("entro a mensajes solicitud");  
                /*setState(() {
                  mensajesMostrar = Metodos.usuarioregistrado.mensajes;
                });*/
                //, eliminar: Metodos.EliminarMensaje(index, Metodos.usuarioregistrado), aceptar: Metodos.AceptarSolicitud(remitente, Metodos.usuarioregistrado)            
                return Msgsolicitud(remitente: remitente, destino: destino, indice: index);
              }
              else if (mensajesMostrar[index] is Evento) {
              return Msgevento(
                //a veces leer bien las cosas nos hace mejores
                eventoMostrando: mensajesMostrar[index],
              );
            } else{
                return SizedBox();
              }

            })            
            /*Cabeza(),
           

            SizedBox(height: 15,),
            Msgsolicitud(),
            SizedBox(height: 15,),
            Msgevento()*/
          
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
