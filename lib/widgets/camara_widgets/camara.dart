import 'dart:io'  show File;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Dialogo.dart';
/*

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(button: TextStyle(color: Colors.black)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedLabelStyle: TextStyle(color: Colors.black),
              unselectedLabelStyle: TextStyle(color: Colors.black)
          )
      ),
      home: FotoUsuario(),
    );
  }
}

*/
class FotoUsuario extends StatefulWidget{
  File? imageFile = null;

  final Function callback;

  FotoUsuario({Key? key, required this.callback}) : super(key: key);
  _FotoUsuarioScreenState createState() => _FotoUsuarioScreenState();


                                            
}

class _FotoUsuarioScreenState extends State<FotoUsuario>{

  

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? picture = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      widget.imageFile = File(picture!.path);
      widget.callback(widget.imageFile);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialogo(accion: (BuildContext contexto){_openGallery(contexto); }, contexto: context, );
        }
    );
  }



  @override
  Widget build(BuildContext conext){
    return Scaffold( 
      body:IconButton(
        onPressed: () async{ _showSelectionDialog(context);}, 
        icon:
        widget.imageFile == null? Icon(Icons.photo_outlined, color: Colors.white, size: 60) : Image.file(File(widget.imageFile!.path)),
        iconSize: 120,
      ),
      backgroundColor: Colors.black,
    );
  } 
}

/*
  @override
  Widget build(BuildContext conext){
    return Scaffold( 
      body:IconButton(
        onPressed: () async{ _showSelectionDialog(context);}, 
        icon:
        widget.imageFile == null? Icon(Icons.photo_outlined, color: Colors.white) : Image.file(File(widget.imageFile!.path)),
        iconSize: 120,
      ),
      backgroundColor: Colors.black,
    );
  } 
}
*/ 