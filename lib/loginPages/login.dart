import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/login_widgets/Containers.dart';
import 'package:myunify/widgets/login_widgets/input_usuario.dart';

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
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String usuario = " ";
  String clave = " ";

  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold( 
      body: Fondopantalla(
        child:  Form(
          key: keyform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'QUE SE DICE',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
              ),
              Image.asset(
                'assets/buhoUNIFY.png',
                width: size.width*0.6,
                height: size.height*0.4,
              ),
              Containers(
                child: InputUsuario(iconod: Icons.person, label: "Usuario", invisible: false, control: usuario, Callback: (String valor) => usuario = valor)
              ),
              Containers( 
                child: InputUsuario(iconod: Icons.lock, label: "Contraseña", invisible: true, control: clave, Callback: (String valor) => clave = valor)
              ),       
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(29),
                  color: Colors.white,                   
                ),
                child: TextButton(                   
                  onPressed:(){}, 
                  child: const Text(
                    "INICIAR SESION", 
                    style: TextStyle(color: Colors.black),)
                  ),
              ),  
            ],             
          ),
        )
      )
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:myunify/widgets/login_widgets/Containers.dart';
import 'package:myunify/widgets/login_widgets/input_usuario.dart';

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
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color colorNaranja = Color(0xFFFAAD80);
  Color colorRosado = Color(0xFFFF6767);

  String usuario = " ";
  String clave = " ";

  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorNaranja, colorRosado],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter
          )
        ),
        height: size.height,
        width: size.width,
        child: Form(
          key: keyform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Containers(
                child: InputUsuario(iconod: Icons.person, label: "Usuario", invisible: false, control: usuario)
              ),
              Containers( 
                child: InputUsuario(iconod: Icons.lock, label: "Contraseña", invisible: true, control: clave)
              ),
              
            ],
                
          ),
        )
      ),
    );
  }
}
*/