import 'package:flutter/material.dart';
import 'package:myunify/datos/EventoClase.dart';
import 'package:myunify/datos/eventoLogica.dart';
import 'package:myunify/datos/Evento.dart';

class EditarEventoClase extends StatefulWidget {
  @override
  _EditarEventoClase createState() => _EditarEventoClase();
}

class _EditarEventoClase extends State<EditarEventoClase> {
  Color color_fondo = Colors.yellow.shade200;

  late TextEditingController controllernombreEvento;
  late TextEditingController controllerdescripcionEvento;
  late TextEditingController controllerHoraInicio;
  late TextEditingController controllerHoraFin;
  late TextEditingController controllergetPublico;
  late TextEditingController controllerduracion;
  late TextEditingController controllerMaterias;
  late TextEditingController controllerProfesor;

  @override
  Widget build(BuildContext context) {
    controllernombreEvento = TextEditingController();
    controllerdescripcionEvento = TextEditingController();
    controllerHoraInicio = TextEditingController(text: "ej: 4:20");
    controllerHoraFin = TextEditingController(text: "ej: 20:10");
    controllerMaterias = TextEditingController(text: "ej: calculo integral");
    controllergetPublico = TextEditingController(text: "ej: si o no");
    controllerduracion = TextEditingController(text: " ");
    controllerProfesor = TextEditingController(text: "ej Snoop Dog");
    return Scaffold(
      backgroundColor: color_fondo,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 20),
          Text(
            "Vamos a registrar tu Clase",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre del la clase",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: controllernombreEvento,
                  decoration: InputDecoration(
                    hintText: "Nombre de tu clase",
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
                "Profesor:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerProfesor,
                decoration: InputDecoration(
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Duración en horas",
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
                "¿Qué materia es?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllerMaterias,
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
                  TextButton(onPressed: _guardarClase, child: Text("Guardar"))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controllerMaterias.dispose();
    controllerdescripcionEvento.dispose();
    controllerHoraInicio.dispose();
    controllerHoraFin.dispose();
    controllerduracion.dispose();
    controllergetPublico.dispose();
    controllernombreEvento.dispose();
    controllerProfesor.dispose();

    super.dispose();
  }

  void _guardarClase() {
    //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto

    DateTime fecha = MetodosEvento.diaSeleccionado;
    // MetodosEvento.formatearFecha(controllerdia.text, controllermes.text);
    EventoClase EventoClase_ = EventoClase(
        controllernombreEvento.text,
        fecha,
        int.parse(controllerduracion.text),
        false,
        "Clase, Estudio",
        controllerMaterias.text,
        controllerdescripcionEvento.text,
        controllerProfesor.text,
        controllerHoraInicio.text,
        controllerHoraFin.text);
    print(EventoClase_.nombre);

    //revisar y mejorar el codigo: no
    //faltan metodos de eventos, y pantallas de edicion: solo borrar
    
    MetodosEvento.agregarEvento(EventoClase_, fecha);

    print("evento agregado");

    //Navigator.pushNamedAndRemoveUntil(context, "/Main", (route) => false);

    //Pensar luego en como hacer para que te devuelva a la lista de calendario
    Navigator.pop(context);
  }
}
