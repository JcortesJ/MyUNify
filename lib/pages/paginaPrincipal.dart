import 'package:flutter/material.dart';
import 'package:myunify/pages/Perfil/pantalla_perfil.dart';
import 'package:myunify/pages/Perfil/pantalla_editar.dart';
import 'package:myunify/pages/Perfil/pantalla_contrasena.dart';
import 'Amigos/buscador_Amigo.dart';
import 'Calendario.dart';
import 'Amigos/lista_amigos.dart';
import 'package:myunify/pages/mensajes.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _SchoolPaginaPrincipal createState() => _SchoolPaginaPrincipal();
}

class _SchoolPaginaPrincipal extends State<PaginaPrincipal> {
  int _selectedItemIndex = 0;
  final List pages = [
    PaginaPerfil(),
    PaginaAmigos(),
    const Mensajes(),
    VistaCalendar(),
    /* BuscadorAmigo(), */
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.orange,
            selectedIconTheme: IconThemeData(color: Colors.orange[600]),
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text("Perfil"),
                icon: Icon(Icons.account_circle),
              ),
              BottomNavigationBarItem(
                title: Text("Amigos"),
                icon: Icon(Icons.add_reaction_rounded),
              ),
              BottomNavigationBarItem(
                title: Text("Mensajes"),
                icon: Icon(Icons.circle_notifications_rounded),
              ),
              BottomNavigationBarItem(
                title: Text("Calendario"),
                icon: Icon(Icons.calendar_today_rounded),
              ),
              /*  BottomNavigationBarItem(
              title: Text("Eventos"),
              icon: Icon(Icons.add_circle_rounded),
            ), */
            ],
          ),
          body: pages[_selectedItemIndex]),
    );
  }
}
