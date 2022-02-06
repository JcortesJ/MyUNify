import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myunify/data/usuario.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/mensajes_widgets/Aceptar.dart';
import 'package:myunify/widgets/mensajes_widgets/InfoEvento.dart';
import 'package:myunify/widgets/mensajes_widgets/Rechazar.dart';
import 'package:myunify/data/Evento.dart';
import 'package:myunify/data/eventoLogica.dart';

class Msgevento extends StatelessWidget {
  final Evento eventoMostrando;
  const Msgevento({Key? key, required this.eventoMostrando}) : super(key: key);

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Infoevento(
            contexto: context,
            eventoMostrandose: eventoMostrando,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String fechaEvento = DateFormat.yMMMEd().format(eventoMostrando.Fecha);
    Size size = MediaQuery.of(context).size;
    return 
      Container(
        margin: EdgeInsets.only(top: 10, left: 40,right: 40, bottom: 10),
        padding: const EdgeInsets.all(10),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colores.colorExtra,
        ),
        child: Row(children: [
          Column(
            children: [
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.event, 
                    color: Colors.black)),
                  TextSpan(
                  
                    text: " "+eventoMostrando.nombre,
                    style: TextStyle(
                      
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Subs'),
                  ),
                ]),
              ),
              Text(fechaEvento,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plano')),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  // Aceptar(),
                  //  SizedBox(width: 3),
                  //  Rechazar(),
                ],
              )
            ],
          ),
          const SizedBox(width: 7),
          //SizedBox(width: 10),
          Container(
            //alignment: Alignment.centerRight,
            margin: EdgeInsets.only(left: 15),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.black),
            child: GestureDetector(
              onTap: () async {
                _showSelectionDialog(context);
              },
              child: const Icon(
                Icons.place,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ]
      ),
    );
  }
}
