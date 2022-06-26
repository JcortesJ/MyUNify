import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/widgets/camara_widgets/camara.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/login_widgets/Containers.dart';
import 'package:myunify/widgets/login_widgets/input_usuario.dart';

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
  File? foto = null;

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
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: size.width * 0.4,
                  height: 140,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 10,
                      color: Colores.colorComplementario
                    ),
                    borderRadius:  BorderRadius.circular(30),                  
                  ),
                  child: FotoUsuario(callback: (File? imagen) => foto = imagen)
                ),
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
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(29),
                      color: Colors.white,                   
                    ),
                    child: TextButton(                   
                      onPressed:(){
                        if(usuario!= ' ' && clave!= ' ' && correo!= ' ' && nombre != ' ' && usuarioIg != ' '){
                          Metodos.RegistrarUsuario(nombre, correo, clave, usuario, usuarioIg, foto);
                          Navigator.pushReplacementNamed(context, "/");
                        }
                        //print('user: $usuario contraseña $clave');
                        //print('entro foto: ${foto == null? 'no funciona': 'funciono!!'} ');
                      }, 
                      child: const Text(
                        "REGISTRARSE", 
                        style: TextStyle(color: Colors.black),)
                      ),
                  ),
                  const SizedBox(height: 20),
                  
            ]
            )
          ],
        )
      )
    );
  }
}