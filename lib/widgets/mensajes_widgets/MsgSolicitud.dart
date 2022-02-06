import 'package:flutter/material.dart';
import 'package:myunify/data/usuario.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/mensajes_widgets/Rechazar.dart';
import 'package:myunify/widgets/mensajes_widgets/Aceptar.dart';
import 'package:myunify/pages/Amigos/pantalla_perfil_amigo2.dart';

class Msgsolicitud extends StatelessWidget {
  Usuario remitente;
  Usuario destino;
  int indice;
  //Function aceptar;
  //Function eliminar; , required this.aceptar, required this.eliminar
  Msgsolicitud(
      {Key? key,
      required this.remitente,
      required this.destino,
      required this.indice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: todo
    //TODO ESTA DENTRO DE UN COLUMN PARA QUE SE VEA EL ANCHO DEL CONTAINER
    return Container(
        margin: EdgeInsets.only(top: 10, left: 40,right: 40, bottom: 10),
        padding: const EdgeInsets.all(10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colores.colorNaranja,
        ),
        child: Row(children: [
          Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                RichText(
                  text: const TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.person_add_alt_1, color: Colors.black)),
                    TextSpan(
                      text: " Solicitud de amistad",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Subs'),
                    )
                  ]),
                ),
                Text(
                    //Añadir nombre desde el constructor
                    '${remitente.nombreUsuario} quiere ser de tu parche',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Plano')),

                /*const Text(
                    'ñslañsñañalñalñsalñ' ,//Añadir descripcion
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Plano'
                    )
                  ),*/

                Row(
                  children: [
                    //Metodos.AceptarSolicitud(remitente, Metodos.usuarioregistrado)
                    Aceptar(
                      remitente: remitente,
                      destino: destino,
                      indice: indice,
                    ),
                    SizedBox(width: 3),
                    // Metodos.EliminarMensaje(indice, Metodos.usuarioregistrado)
                    Rechazar(
                      indice: indice,
                    ),
                  ],
                )
              ]),
          const SizedBox(width: 7),
          //SizedBox(width: 10),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.black),
            child: GestureDetector(
              onTap: () {
                Metodos.viendoAmigo = remitente;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilAmigo2()),
                );
              },
              child: const Icon(
                Icons.person_pin_sharp,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),

          //Añadir foto de perfil del man
        ]));
  }
}


/*
RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: "Click ",
      ),
      WidgetSpan(
        child: Icon(Icons.add, size: 14),
      ),
      TextSpan(
        text: " to add",
      ),
    ],
  ),
)*/
