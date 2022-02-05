import 'package:flutter/material.dart';
import 'pages/paginaPrincipal.dart';
import 'package:myunify/pages/Perfil/pantalla_editar.dart';
import 'package:myunify/pages/Perfil/pantalla_perfil.dart';
import 'package:myunify/pages/Perfil/pantalla_contrasena.dart';
import 'package:myunify/pages/Calendario.dart';
import 'package:myunify/pages/editarClase.dart';
import 'package:myunify/pages/editarEstudio.dart';
import 'package:myunify/pages/editarOcio.dart';
import 'package:myunify/webview/pagina.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyUNify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => PaginaPrincipal(),
          "/EditarOcio": (BuildContext context) => EditarEventoOcio(),
          "/EditarEventoEstudio": (BuildContext context) => EditarEventoEstudio(),
          "/Calendario": (BuildContext context) => VistaCalendar(),
          "/EditarEventoClase": (BuildContext context) => EditarEventoClase(),
          "/paginaBienestar": (BuildContext context) => paginaBienestar(),
          "/Main": (BuildContext context) => PaginaPrincipal(),
          "/Editar": (BuildContext context) => EditarPerfil(),
          "/Contrasena": (BuildContext context) => EditarContrasena(),
          "/Ver": (BuildContext context) => PaginaPerfil(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: Text('Not Found'))),
          );
        },
      );
  }
}
