import 'package:flutter/material.dart';
import 'package:myunify/datos/Evento.dart';
import 'package:myunify/datos/EventoOcio.dart';
import 'package:myunify/datos/pruebas.dart';

class EditarEventoOcio extends StatefulWidget {
  @override
  _EditarEventoOcio createState() => _EditarEventoOcio();
}

class _EditarEventoOcio extends State<EditarEventoOcio> {
  Color color_interfaz = Color(0xff9AD0EC);
  Color color_interfazGrueso = Color(0xff1572A1);
  Color color_letra = Color(0xffEFDAD7);
  Color color_fondo = Color(0xffE4E4E4);

  late TextEditingController controllernombreEvento;
  late TextEditingController controllerdescripcionEvento;
  late TextEditingController controllerdia;
  late TextEditingController controllermes;
  late TextEditingController controllergetPublico;
  late TextEditingController controllerEtiquetas;
  late TextEditingController controllerduracion;
  late TextEditingController controllerActividades;

  String prueba = " ";
  @override
  Widget build(BuildContext context) {
    controllernombreEvento =
        TextEditingController(text: "Escribe el nombre del evento");
    controllerdescripcionEvento = TextEditingController(
        text: "Descripcion corta de lo que vamos a hacer");
    controllerdia = TextEditingController(text: "pon el dia ej: 22");
    controllermes = TextEditingController(
        text: "pon el mes en numeros ej: 09 para septiembre");
    controllerEtiquetas =
        TextEditingController(text: "ej: casual, estudio, petfriendly");
    controllergetPublico = TextEditingController(text: "ej: si o no");
    controllerduracion =
        TextEditingController(text: "di el numero de horas que durara");
    controllerActividades =
        TextEditingController(text: "Actividades a desarrollar");
    return Scaffold(
      backgroundColor: color_fondo,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          Text(
            "Vamos a editar tu evento",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre del evento",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: controllernombreEvento,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  )),
              const SizedBox(height: 10),
              Text(
                "Descripción corta",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerdescripcionEvento,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Actividades a desarrollar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerActividades,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Dia",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerdia,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Mes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllermes,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Duracion",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerduracion,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "¿Es público?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllergetPublico,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
              child:
                  TextButton(onPressed: _guardarOcio, child: Text("Guardar"))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controllerEtiquetas.dispose();
    controllerdescripcionEvento.dispose();
    controllerdia.dispose();
    controllermes.dispose();
    controllerduracion.dispose();
    controllergetPublico.dispose();
    controllernombreEvento.dispose();
    controllerActividades.dispose();

    super.dispose();
  }

  void _guardarOcio() {
    //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto

    DateTime fecha =
        MetodosEvento.formatearFecha(controllerdia.text, controllermes.text);
    EventoOcio EventoOcio_ = EventoOcio(
        controllernombreEvento.text,
        fecha,
        int.parse(controllerduracion.text),
        MetodosEvento.getPublico(controllergetPublico.text),
        controllerEtiquetas.text,
        controllerdescripcionEvento.text,
        controllerActividades.text,
        controllerdia.text,
        controllermes.text);
    print(EventoOcio_.toString());
    //Un problema importante, es que esta tomando el toString muy raro
    //aparte que esta poniendo fechas que no son
    //revisar y mejorar el codigo
    //faltan metodos de eventos, y pantallas de edicion
    //tambien mejorar el container y crear un alert dialog que muestre a detalle el evento
    //tambien falta poner el atributo hora xd

    MetodosEvento.agregarEvento(EventoOcio_, fecha);

    print("evento agregado");

    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }
}
