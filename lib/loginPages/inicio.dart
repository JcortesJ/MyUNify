
//import 'dart:io'  show File;
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrones inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Inicio(),
    );
  }
}
class Inicio extends StatelessWidget {
  Inicio({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size; // Da las dimensiones de la pantalla del dispositivo
      return Fondopantalla(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/InicioUNIFY.png', 
              width: size.width*0.6, 
              height: size.height*0.4,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(29),
                color: Colores.colorComplementario,                   
              ),
              child: TextButton(                   
                onPressed:(){
                  Navigator.pushNamed(context, "/login");
                }, 
                child: const Text(
                  "LOGIN", 
                  style: TextStyle(color: Colors.white),)
                ),
            ),
            /*Container(
              height: 15,
            )*/
            Container(
              //margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(29),
                color: Colors.white,                   
              ),
              child: TextButton(                   
                onPressed:(){
                  Navigator.pushNamed(context, "/registro");
                }, 
                child: const Text(
                  "REGISTRARSE", 
                  style: TextStyle(color: Colors.black),)
                ),
            ),
            Container(
              height: 35,
            )
          ],
        )
      );
  }
}

