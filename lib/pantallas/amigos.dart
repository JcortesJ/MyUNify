import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:myunify/datos/usuario.dart';
import 'package:myunify/datos/usuario.dart';
import 'package:myunify/logica/metodos.dart';
import 'package:myunify/widgets/perfil_widgets/profile_widget.dart';
import 'buscador_Amigo.dart';
import 'Perfil/pantalla_perfil_amigo.dart';
import 'dart:convert';
//import 'package:agenda/Pantallas/Perfil/pantalla_perfil.dart';
import '../main.dart';

class PaginaAmigos extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<PaginaAmigos> createState() => _PaginaAmigosState();
}

class _PaginaAmigosState extends State<PaginaAmigos> {
  Color color_interfaz = Color(0xff7676CC);
  Color color_interfazGrueso = Color(0xff1E1E34);
  Color color_letra = Color(0xffE4E4E4);
  Color color_fondo = Color(0xffE4E4E4);

  List<Usuario> _amigos = Metodos.usuarioregistrado.amigos;

  late TextEditingController controlleramigo;

  void irAContacto(Usuario amigo) {
    //este metodo deberia tener el parametro Contacto y un navigator xd
    setState(() {
      Metodos.viendoAmigo = amigo;
      Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => PerfilAmigo()),
              );
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    super.dispose();
  }

/*   void _convertirJSON() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonContactos = jsonEncode(Metodos.contactos);

    setState(() {
      prefs.setString("uxiono", jsonContactos);
      print("Datos subidos con exito");
    });
  }

  void _decodJSON() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String json_contactos = prefs.getString("uxiono") ?? "";
      var listaConts_js = jsonDecode(json_contactos) as List;
      List<Contacto> contactosDeNuevo =
          listaConts_js.map((index) => Contacto.fromJson(index)).toList();
      Metodos.contactos = contactosDeNuevo;
      print("Datos descargados con exito");
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      //appBar: AppBar(),
      appBar: AppBar(
        title: Text('Amigos actuales:  ${_amigos.length}'),
        shadowColor: Colors.deepOrange,
        backgroundColor: color_interfazGrueso,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // actions: <Widget>
      // ],

      body: Center(
  
              //Aqui en el child deben ir los contactos xd
              child: ListView(
                //cambia la direccion de scroll
                scrollDirection: Axis.vertical,
                children:
                    //cada container es un contacto, ahora la pregunta es
                    //como creo un widget por contacto xdd
                    //La respuesta está en este list.generate
                    // DOC: https://docs.flutter.dev/cookbook/lists/grid-lists
                  List.generate(_amigos.length, (index) {
                  return Container(
                      padding: EdgeInsets.all(8),
                      height: 80,
                      width: 500,
                      margin: EdgeInsets.only(top: 5.0, right: 30,left: 30),
                      decoration: BoxDecoration(
                          color: color_interfaz,
                          //border: Border.all(width: 2, color: Colors.amber),
                          borderRadius: BorderRadius.circular(15)),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          //container de la imagen
                              ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Ink.image(
                                    image: NetworkImage(_amigos[index].linkFoto),
                                    fit: BoxFit.cover,
                                    width: 65,
                                    height: 50,
                                  ),
                                ),
                              ),
                           
                          //container del texto
                          Container(
                              margin: EdgeInsets.only(left: 50, top: 15),
                              child:
                                  // ignore: prefer_const_constructors
                                  InkWell(
                                      onTap: () =>
                                          irAContacto(_amigos[index]),
                                      child: Text(
                                        "${_amigos[index].nombre}",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                        textAlign: TextAlign.left,
                                      ))),
                        ],
                      ));
                }),
              ),
            ),
         /*   ],
        ),
      ),*/

      //Finalmente el bottomNavigationBar que supongo que repetiremos
      //en todas las pantall
  
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

      floatingActionButton: FloatingActionButton(
        backgroundColor: color_interfaz,
        onPressed: () => Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => BuscadorAmigo()),
              ),
        tooltip: 'Increment',
        child: const Icon(Icons.plus_one),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
