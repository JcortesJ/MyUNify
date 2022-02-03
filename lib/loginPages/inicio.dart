
//import 'dart:io'  show File;
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    Color colorNaranja = Color(0xFFFAAD80);
    Color colorRosado = Color(0xFFFF6767);
    Color colorComplementario = Color(0xffFF3D68);

    @override
    Widget build(BuildContext context){
        Size size = MediaQuery.of(context).size; // Da las dimensiones de la pantalla del dispositivo
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorNaranja, colorRosado],
              //stops:const  [0.5, 0.5],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter
            )
          ),
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /*
              Positioned(
                top: 0,
                right: 2,
                //right: 0,
                //right: 0,
                child: Image.asset('assets/patron1.png', width: size.width *0.6, height: size.height * 0.5,)
                ),
                Positioned(
                //top: ,
                left: 2,
                //right: 0,
                //right: 0,
                child: Image.asset('assets/patron2.png', width: size.width *0.6, height: size.height * 0.5,)
                ),
                */
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: size.width * 0.8,
                      //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(13),
                        color: colorComplementario,                   
                      ),
                      child: TextButton(                   
                        /*style: ButtonStyle(
                          backgroundColor: colorComplementario
                        ),*/
                        onPressed:(){}, 
                        child: const Text(
                          "LOGIN", 
                          style: TextStyle(color: Colors.white),)
                        ),
                    ),
                    Container(
                      height: 15,
                    ),
                    Container(
                      width: size.width * 0.8,
                      //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(13),
                        color: Colors.white,                   
                      ),
                      child: TextButton(                   
                        /*style: ButtonStyle(
                          backgroundColor: colorComplementario
                        ),*/
                        onPressed:(){}, 
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
            ]
          )
        );
  }
}
