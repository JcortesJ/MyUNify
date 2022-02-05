import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';

class Dialogo extends StatelessWidget {
  Function accion;
  BuildContext contexto;
  Dialogo({ Key? key , required this.accion, required this.contexto}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: const Text(
        "Seleccione para abrir su galería",
        textAlign: TextAlign.center,
         style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Subs'
        )
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Divider(color: Colors.black),
            GestureDetector(
              child: const Text(
                "Galeria",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Plano',
                  fontSize: 20
                )
              ),
              onTap: () {
                accion(contexto);
              },
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
          ],
        ),
      ),
      backgroundColor: Colors.white,
  );;
}
}