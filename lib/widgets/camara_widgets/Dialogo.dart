import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';

class Dialogo extends StatelessWidget {
  Function accion;
  BuildContext contexto;
  Dialogo({ Key? key , required this.accion, required this.contexto}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text("Seleccione para abrir su galería"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              child: const Text("Galeria"),
              onTap: () {
                accion(contexto);
              },
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
          ],
        ),
      ),
      backgroundColor: Colores.colorBurbuja,
  );;
}
}