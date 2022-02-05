import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/FondoPantalla.dart';
import 'package:myunify/widgets/mensajes_widgets/AppBarMsg.dart';
import 'package:myunify/widgets/mensajes_widgets/Cabeza.dart';
import 'package:myunify/widgets/mensajes_widgets/MsgEvento.dart';
import 'package:myunify/widgets/mensajes_widgets/MsgSolicitud.dart';

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
      home: Mensajes(),
    );
  }
}
class Mensajes extends StatefulWidget {
  const Mensajes({ Key? key }) : super(key: key);

  @override
  _MensajesState createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarmsg(context),
      body: Fondopantalla(
        child: ListView(
          children: [           
            Cabeza(),
            SizedBox(height: 15,),
            Msgsolicitud(),
            SizedBox(height: 15,),
            Msgevento()
          ]
        )
      )
    );
  }
}