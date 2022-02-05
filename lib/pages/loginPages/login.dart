import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/login_widgets/Containers.dart';
import 'package:myunify/widgets/login_widgets/input_usuario.dart';

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
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'BIENVENIDO',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Subs'
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
                      onPressed:(){
                        Navigator.pushNamed(context, "/Main"); 
                      }, 
                      child: const Text(
                        "INICIAR SESION", 
                        style: TextStyle(color: Colors.black),)
                      ),
                  ),  
                ],             
              ),
            ],
          ),
        )
      )
    );
  }
}
