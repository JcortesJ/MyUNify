import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController control;

  const TextfieldWidget({
    Key? key,
    required this.control,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: control,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      );
}
