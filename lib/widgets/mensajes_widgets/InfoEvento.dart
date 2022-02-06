import 'package:flutter/material.dart';
import 'package:myunify/datos/Evento.dart';

class Infoevento extends StatelessWidget {
  BuildContext contexto;
  final eventoMostrandose;
  Infoevento(
      {Key? key, required this.contexto, required this.eventoMostrandose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String info =
        "Descripcion: ${eventoMostrandose.descripcion}\nHora inicio: ${eventoMostrandose.horaInicio} \nHora final: ${eventoMostrandose.horaFin}";
    return AlertDialog(
      title: RichText(
        text: const TextSpan(children: [
          WidgetSpan(
              child: Icon(Icons.info_outline_rounded, color: Colors.white)),
          TextSpan(
            text: " Acerca del evento",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Subs'),
          )
        ]),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      backgroundColor: Colors.black,
      scrollable: true,
      content: Column(
        children: [
          Text(
            info,
            style: TextStyle(color: Colors.white),
          ),
          /*
          GestureDetector(
            onPresed: (){},
            child: Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(13)
              ),
              child: const Text('ENTENDIDO')
            )
          )*/
        ],
      ),
      /*content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Colors.black,
        ),
        child: const Text(
          'kslakla',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),*/
    );
  }
}
