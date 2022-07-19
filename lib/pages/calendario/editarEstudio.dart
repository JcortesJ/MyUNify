import 'package:flutter/material.dart';
import 'package:myunify/data/Evento.dart';
import 'package:myunify/data/EventoEstudio.dart';
import 'package:myunify/data/EventoOcio.dart';
import 'package:myunify/data/eventoLogica.dart';

class EditarEventoEstudio extends StatefulWidget {
  @override
  _EditarEventoEstudio createState() => _EditarEventoEstudio();
}

class _EditarEventoEstudio extends State<EditarEventoEstudio> {
  Color color_fondo = Colors.yellow.shade200;

  late TextEditingController controllernombreEvento;
  late TextEditingController controllerdescripcionEvento;
  late TextEditingController controllerHoraInicio;
  late TextEditingController controllerHoraFin;
  late TextEditingController controllergetPublico;
  late TextEditingController controllerduracion;
  late TextEditingController controllerTema;

  @override
  Widget build(BuildContext context) {
    controllernombreEvento = TextEditingController();
    controllerdescripcionEvento = TextEditingController();
    controllerHoraInicio = TextEditingController();
    controllerHoraFin = TextEditingController();

    controllergetPublico = TextEditingController();
    controllerduracion = TextEditingController();
    controllerTema = TextEditingController();
    return Scaffold(
      backgroundColor: color_fondo,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 20),
          Text(
            "Vamos a programar tu estudio",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre de la sesión",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: controllernombreEvento,
                  decoration: InputDecoration(
                    hintText: "¿como se llamará tu sesión?",
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
                  hintText: "Describe cosas como el sitio o en donde verse",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Temas a repasar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerTema,
                decoration: InputDecoration(
                  hintText: "¿Qué vas a repasar?",
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
                  hintText: "ej: 4:00",
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
                  hintText: "ej 5:00",
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
                  hintText: "ej 2",
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
            ],
          ),
          const SizedBox(height: 24),
          Center(
              child: TextButton(
                  onPressed: _guardarEstudio, child: Text("Guardar"))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.

    controllerdescripcionEvento.dispose();
    controllerHoraInicio.dispose();
    controllerHoraFin.dispose();
    controllerduracion.dispose();
    controllergetPublico.dispose();
    controllernombreEvento.dispose();
    controllerTema.dispose();

    super.dispose();
  }

  void _guardarEstudio() {
    //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto

    DateTime fecha = MetodosEvento.diaSeleccionado;
    // MetodosEvento.formatearFecha(controllerdia.text, controllermes.text);
    EventoEstudio EventoEstudio_ = EventoEstudio(
        controllernombreEvento.text,
        fecha,
        int.parse(controllerduracion.text),
        MetodosEvento.getPublico(controllergetPublico.text),
        "Sesion de estudio",
        controllerdescripcionEvento.text,
        controllerTema.text,
        controllerHoraInicio.text,
        controllerHoraFin.text);
    print("hemos creado el evento de estudio");

    //revisar y mejorar el codigo: no
    //arreglar problema de actualizar el calendario sin que se vea paila
    //si es posible meter animaciones xd
    //averiguar si se pueden poner animaciones en la splash screen
    //añadir persistencia
    //añadir encontrar eventos
    //buscar si se puede poner

    MetodosEvento.agregarEvento(EventoEstudio_, fecha);

    print("evento estudio agregado");

    //Navigator.pushNamedAndRemoveUntil(context, "/Calendario", (route) => false);
    Navigator.pop(context);
  }
}
