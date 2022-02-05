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
  Color colorComplementario = Color(0xffFF3D68);


  String usuario = "";
  String clave = "";


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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(29),
                  color: colorComplementario,                   
                ),
                width: size.width * 0.9,
                //height: 80,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white ,
                  validator: (text) {
                    if (usuario.isEmpty) {
                      print("Soy el validatorV2");
                      return "Ingrese un valor";
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Usuario",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.person, color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ), 
                      errorStyle: TextStyle(color: Colors.white)
                      //errorBorder: 
                      
                  ),
                      
                  onChanged: (text) =>
                      setState(() => usuario = text),
                  autovalidateMode:
                      AutovalidateMode.onUserInteraction
                ),
                
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(29),
                  color: colorComplementario,                   
                ),
                width: size.width * 0.9,
                //height: 80,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white ,
                  validator: (text) {
                    if (usuario.isEmpty) {
                      print("Soy el validatorV2");
                      return "Ingrese un valor";
                    }
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Contraseña",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.lock_outlined, color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ), 
                      errorStyle: TextStyle(color: Colors.white)
                      //errorBorder: 
                      
                  ),
                      
                  onChanged: (text) =>
                      setState(() => usuario = text),
                  autovalidateMode:
                      AutovalidateMode.onUserInteraction
                ),
                
              ),
              
            ],
                
          ),
        )
      ),
    );
  }
}