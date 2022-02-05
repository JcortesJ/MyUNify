import 'package:flutter/material.dart';
import 'Colores.dart';

/*void main() {
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
      home: Fondopantalla(child: Text("")),
    );
  }
}
*/
class Fondopantalla extends StatelessWidget {

  final Widget child;
  const Fondopantalla({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size; 
    return Container(
       decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colores.colorRosado, Colores.colorNaranjaClaro],
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
                left: 0,
                child: Image.asset('assets/burbujaSup.png', width: size.width *0.6)
                ),
          Positioned(
            bottom:0 ,
            right: 0,
            child: Image.asset('assets/burbujaInf.png', width: size.width *0.6)
          ),
          Positioned(
            child: Image.asset('assets/burbajaCentral.png', width: size.width *0.6)
          ),*/
          child
        ]
      )
    );
  }
}
