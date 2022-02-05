import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';

AppBar AppBarmsg(BuildContext context) {
    return AppBar(
        leading: IconButton(
          color:Colors.white,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: (){},
        ),
        title: const Text(
          "Mensajes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Subs'
          ),  
        ),
        elevation: 0,
        backgroundColor: Colores.colorComplementario
      );
}
