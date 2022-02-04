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
      home: Registro(),
    );
  }
}
class Registro extends StatefulWidget {
  
  const Registro({ Key? key }) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  String usuario = " ";
  String clave = " ";
  String correo = " ";
  String nombre = " ";
  String usuarioIg = " ";

  final keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Fondopantalla(
        child: ListView(
          children:  [
            Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  //WIdget Camara
                  Column(
                    children: [
                      // ignore: prefer_const_constructors
                      Containers(
                        child:InputUsuario(iconod: Icons.person, label: "Usuario", invisible: false, control: usuario, Callback: (String valor) => usuario = valor,),
                      ),
                      Containers(
                        child: InputUsuario(iconod: Icons.lock_open_sharp, label: "Contraseña", invisible: false, control: clave, Callback: (String valor) => clave = valor)
                      )
                    ]
                  )
                ]
              ),
              Containers(
                child: InputUsuario(iconod: Icons.perm_identity_sharp, label: "Nombre completo", invisible: false, control: nombre, Callback: (String valor) => nombre = valor)
              ),
              Containers(
                child: InputUsuario(iconod: Icons.check_circle_outline, label: "Usuario instagram", invisible: false, control: usuarioIg, Callback: (String valor) => usuarioIg = valor)
              ),
              Containers(
                child: InputUsuario(iconod: Icons.mark_email_read_outlined, label: "Email", invisible: false, control: correo, Callback: (String valor) => correo = valor)
              ),
              Container(
                  //padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(29),
                    color: Colors.white,                   
                  ),
                  child: TextButton(                   
                    onPressed:(){
                      //print('user: $usuario contraseña $clave');
                    }, 
                    child: const Text(
                      "REGISTRARSE", 
                      style: TextStyle(color: Colors.black),)
                    ),
                ),  
            ]
            )
          ],
        )
      )
    );
  }
}