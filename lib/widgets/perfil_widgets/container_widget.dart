import 'package:flutter/material.dart';
import 'package:myunify/Colores.dart';

class ContainerWidget extends StatelessWidget {
  final String text;

  const ContainerWidget({Key? key,
    required this.text,
  })
   : super(key: key);

  @override
  Widget build(BuildContext context) => Container(            
            child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          );
}
