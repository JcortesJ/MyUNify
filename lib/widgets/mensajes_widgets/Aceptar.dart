import 'package:flutter/material.dart';

class Aceptar extends StatelessWidget {

  //Function accion; required this.accion}
  Aceptar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){print('aceptado');},
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black
        ),
        child: RichText(
          text:TextSpan(
           children: [
              WidgetSpan(
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.green[200]
                )
              ),
              const TextSpan(
                text: " aceptar ",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}