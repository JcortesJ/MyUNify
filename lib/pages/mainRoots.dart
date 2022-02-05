import 'package:flutter/material.dart';
import 'package:myunify/loginPages/Registro.dart';
import 'package:myunify/loginPages/inicio.dart';
import 'package:myunify/loginPages/login.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => Inicio(),
          "/login": (BuildContext context) => Login(),
          "/registro": (BuildContext context) => Registro(),
          //"/Ver": (BuildContext context) => PaginaPerfil()
        }

        //home: MenuContactos(),
        );
  }
}