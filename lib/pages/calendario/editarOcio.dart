import 'package:flutter/material.dart';
import 'package:myunify/data/Evento.dart';
import 'package:myunify/data/EventoOcio.dart';
import 'package:myunify/data/eventoLogica.dart';

class EditarEventoOcio extends StatefulWidget {
  @override
  _EditarEventoOcio createState() => _EditarEventoOcio();
}

class _EditarEventoOcio extends State<EditarEventoOcio> {
  Color color_fondo = Colors.yellow.shade200;

  late TextEditingController controllernombreEvento;
  late TextEditingController controllerdescripcionEvento;
  late TextEditingController controllerHoraInicio;
  late TextEditingController controllerHoraFin;
  late TextEditingController controllergetPublico;
  late TextEditingController controllerEtiquetas;
  late TextEditingController controllerduracion;
  late TextEditingController controllerActividades;

  @override
  Widget build(BuildContext context) {
    controllernombreEvento = TextEditingController();
    controllerdescripcionEvento = TextEditingController();
    controllerHoraInicio = TextEditingController();
    controllerHoraFin = TextEditingController();
    controllerEtiquetas = TextEditingController();
    controllergetPublico = TextEditingController();
    controllerduracion = TextEditingController();
    controllerActividades = TextEditingController();
    return Scaffold(
      backgroundColor: color_fondo,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 20),
          Text(
            "Vamos a crear tu evento",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                    hintText: "¿como se llamará tu evento?",
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
                  hintText: "Donde será? contacto?",
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
                  hintText: "¿Qué vamos a hacer?",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Hora de inicio",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerHoraInicio,
                decoration: InputDecoration(
                  hintText: "ej 3:30",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Hora de fin",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerHoraFin,
                decoration: InputDecoration(
                  hintText: "ej 4:50",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Duracion en horas",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerduracion,
                decoration: InputDecoration(
                  hintText: "ej 4",
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
                  hintText: "si o no",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Ponle etiquetas a tu evento",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerEtiquetas,
                decoration: InputDecoration(
                  hintText: "ej pet-friendly, animalista, vegana, taciturna",
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
    controllerHoraInicio.dispose();
    controllerHoraFin.dispose();
    controllerduracion.dispose();
    controllergetPublico.dispose();
    controllernombreEvento.dispose();
    controllerActividades.dispose();

    super.dispose();
  }

  void _guardarOcio() {
    //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto

    DateTime fecha = MetodosEvento.diaSeleccionado;
    // MetodosEvento.formatearFecha(controllerdia.text, controllermes.text);
    EventoOcio EventoOcio_ = EventoOcio(
        controllernombreEvento.text,
        fecha,
        int.parse(controllerduracion.text),
        MetodosEvento.getPublico(controllergetPublico.text),
        controllerEtiquetas.text,
        controllerdescripcionEvento.text,
        controllerActividades.text,
        controllerHoraInicio.text,
        controllerHoraFin.text);
    print(EventoOcio_.nombre);

    //revisar y mejorar el codigo: no
    //faltan metodos de eventos, y pantallas de edicion: solo borrar

    MetodosEvento.agregarEvento(EventoOcio_, fecha);

    print("evento agregado");

    //  Navigator.pushNamedAndRemoveUntil(context, "/Calendario", (route) => false);
    Navigator.pop(context);
  }
}
