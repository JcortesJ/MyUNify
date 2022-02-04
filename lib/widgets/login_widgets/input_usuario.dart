
import 'package:flutter/material.dart';

class InputUsuario extends StatefulWidget {

  final IconData iconod;
  final String label;
  final bool invisible;
  String control = " ";
  final Function Callback;
  InputUsuario({ Key? key, required  this.iconod, required this.label, required this.invisible, required this.control, required this.Callback}) : super(key: key);

  @override
  _InputUsuarioState createState() => _InputUsuarioState();
}

class _InputUsuarioState extends State<InputUsuario> {

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

    return TextFormField(
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white ,
      validator: (text) {
        if (widget.control.isEmpty) {
          return "Ingrese un valor";
        }
      },
      obscureText: widget.invisible,
      decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: TextStyle(color: Colors.white),
          icon: Icon(widget.iconod, color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ), 
          errorStyle: TextStyle(color: Colors.white)
          //errorBorder: 
          
      ),
          
      onChanged: (text) =>
          //setState(() => widget.control = text),
          setState(
            (){
              widget.control = text;
              //print(widget.control);
              widget.Callback(text);
            }
          ),
      autovalidateMode:
          AutovalidateMode.onUserInteraction
    ) ;
  }
}