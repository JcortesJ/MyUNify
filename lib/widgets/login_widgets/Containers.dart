import 'package:flutter/material.dart';
import '../../Colores.dart';

class Containers extends StatelessWidget {
  
  late Widget child; 

  Containers({ Key? key, @required child }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(29),
        color: Colores.colorComplementario,                   
      ),
      width: size.width * 0.9,
      //height: 80,
      child:child
    );
  }
}
