/*
import 'package:flutter/material.dart';

class InputUsuario extends StatefulWidget {

  late Icon iconod;
  late Icon iconoi;
  String label = "";
  late bool visible;
  InputUsuario({ Key? key, iconod, iconoi, @required label, visible}) : super(key: key);

  @override
  _InputUsuarioState createState() => _InputUsuarioState();
}

class _InputUsuarioState extends State<InputUsuario> {
  String usuario = "";
  String clave = "";
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

    return TextFormField(
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white ,
      validator: (text) {
        if (usuario.isEmpty) {
          return "Ingrese un valor";
        }
      },
      decoration: const InputDecoration(
          hintText: widget.label,
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
    ) ;
  }
}

/*
TextFormField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white ,
                  validator: (text) {
                    if (usuario.isEmpty) {
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
                ),*/
*/