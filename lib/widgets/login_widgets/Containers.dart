import 'package:flutter/material.dart';
import '../generales/Colores.dart';

class Containers extends StatelessWidget {
  
  final Widget child; 

  const Containers({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(29),
        color: Colores.colorComplementario,                   
      ),
      width: size.width * 0.9,
      height: 80,
      child:child
    );
  }
}