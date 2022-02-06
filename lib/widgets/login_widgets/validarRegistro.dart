import 'package:flutter/material.dart';

class validarRegistro extends StatelessWidget {
  BuildContext contexto;

  validarRegistro(
      {Key? key, required this.contexto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      title: RichText(
        text: const TextSpan(children: [
          WidgetSpan(
              child: Icon(Icons.info_outline_rounded, color: Colors.white)),
          TextSpan(
            text: " ERROR",
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
        children: const [
          Text(
            'Ya hay un usuario con ese nombre de usuario o con ese correo',
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
