import 'package:flutter/material.dart';
import 'package:myunify/data/Solicitud.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/login_widgets/Containers.dart';
import 'package:myunify/widgets/login_widgets/input_usuario.dart';
import 'package:myunify/logica/metodos.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String usuario = "";
  String clave = "";

  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Fondopantalla(
            child: Form(
      key: keyform,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('BIENVENIDO',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Subs')),
              Image.asset(
                'assets/buhoUNIFY.png',
                width: size.width * 0.6,
                height: size.height * 0.4,
              ),
              Containers(
                  child: InputUsuario(
                      iconod: Icons.person,
                      label: "Usuario",
                      invisible: false,
                      control: usuario,
                      Callback: (String valor) => usuario = valor)),
              Containers(
                  child: InputUsuario(
                      iconod: Icons.lock,
                      label: "Contraseña",
                      invisible: true,
                      control: clave,
                      Callback: (String valor) => clave = valor)),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: Colors.white,
                ),
                child: TextButton(
                    onPressed: () {
                      //print("cantidad de mensajes: ");
                      //print(Metodos.usuarioregistrado.mensajes.length);
                      /* Metodos.usuarioregistrado.mensajes
                          .add(Solicitud("", Metodos.totalUsuarios[2], false));
                      print(Metodos.usuarioregistrado.mensajes[0]);
                      print(Metodos.usuarioregistrado.mensajes.length); */
                      Metodos.Autenticar(usuario, clave) == true
                          ? _entrar(context)
                          : _autenticacionfallida(context);
                    },
                    child: const Text(
                      "INICIAR SESION",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
        ],
      ),
    )));
  }

  void _entrar(BuildContext context) {
    Metodos.EstablecerRegistrado(usuario);
    Navigator.pushNamed(context, "/Main");
  }

  void _autenticacionfallida(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //mirar si dejamos este o el alertDialog de material

            content:
                Text("Usuario o contraseña incorrecta, intentelo de nuevo: "),
            actions: <Widget>[
              Center(
                child: FlatButton(
                  color: Colors.orange.shade400,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Volver",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          );
        });
  }
}
