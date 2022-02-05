import 'package:flutter/material.dart';

class ContainerWidget2 extends StatelessWidget {
  final String text;

  const ContainerWidget2({Key? key,
    required this.text,
  })
   : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
            padding: EdgeInsets.only(left:10,right:10, bottom: 3,top: 3),
            decoration: BoxDecoration(
                    color: Colors.orange,                    //border: Border.all(width: 2, color: Colors.amber),
                    borderRadius: BorderRadius.circular(15)),
            child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.deepOrange,
            ),
          ),
          );
}
