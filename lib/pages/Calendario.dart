import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myunify/data/Evento.dart';
import 'package:myunify/data/EventoClase.dart';
import 'package:myunify/data/EventoEstudio.dart';
import 'package:myunify/data/EventoOcio.dart';
import 'package:myunify/data/eventoLogica.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:table_calendar/table_calendar.dart';

class VistaCalendar extends StatefulWidget {
  //const VistaCalendar({Key? key, required this.title}) : super(key: key);

  @override
  State<VistaCalendar> createState() => _VistaCalendarState();
}

class _VistaCalendarState extends State<VistaCalendar> {
  Color colorSecundario2 = Color(0xffFAAD80);
  Color colorFondo = Colors.orange;
  Color colorSecundario1 = Color(0xffFF3D68);
  Color colorBottom = Color(0xffA73489);

  @override
  void init() {
    super.initState();
    mostrarEventos();
  }

  //De locos, un mapa de arreglos xd

  // Map<DateTime, List<Evento>> ListaEventos = MetodosEvento.ListaEventosDB;
  //como es estatico no tienes que crear un objeto xd

  List<Evento> eventosDelDia = [];
  Map<DateTime, List<Evento>> listacopia = MetodosEvento.ListaEventosDB;
  //la clase evento deberia tener por defecto que eventos del dia tenga este texto
  //Creamos las variables básicas donde focused day es el primer dia, y selected el que toque la persona
  DateTime _focusedDay = MetodosEvento.diacentrado;
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  EventoOcio diaSinEvento = EventoOcio(
      "No tienes eventos para hoy",
      DateTime.now(),
      2,
      true,
      "ninguna",
      "este evento esta vacio",
      "ninguna",
      " ",
      " ");
  void mostrarEventos() {
    eventosDelDia = [];
    //limpia la lista de eventos antes de mostrarlos
    DateTime escogido = _selectedDay;
    //problema, no esta mostrando para el dia que es xd
    listacopia[_selectedDay] == null
        ? eventosDelDia.add(diaSinEvento)
        : eventosDelDia = MetodosEvento.ListaEventosDB[_selectedDay]!;
    print("Mostrando la lista de eventos ${eventosDelDia.isEmpty}");
    print(eventosDelDia);

    //Lo que deberia hacer este metodo es tomar el diccionario y extraer la lista de eventos
  }

  void _crearEvento(BuildContext context) {
    MetodosEvento.diaSeleccionado = _selectedDay;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //Aqui debe redirigir a otra pantalla en la que se llenen los detalles del evento
            title: Text("Crear un evento"),
            content: Text("Selecciona uno de los tipos de eventos por favor "),
            actions: <Widget>[
              Center(
                child: FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/EditarOcio"),
                    color: colorFondo,
                    child: const Text("Evento ocio",
                        style: TextStyle(color: Colors.black))),
              ),
              Center(
                child: FlatButton(
                    color: colorFondo,
                    onPressed: () =>
                        Navigator.pushNamed(context, "/EditarEventoEstudio"),
                    child: const Text("Evento Estudio",
                        style: TextStyle(color: Colors.black))),
              ),
              Center(
                child: FlatButton(
                    color: colorFondo,
                    onPressed: () =>
                        Navigator.pushNamed(context, "/EditarEventoClase"),
                    child: const Text("Añadir una clase",
                        style: TextStyle(color: Colors.black))),
              ),
              Center(
                child: FlatButton(
                    color: colorFondo,
                    onPressed: () =>
                        Navigator.pushNamed(context, "/paginaBienestar"),
                    child: const Text("Ingresar a web",
                        style: TextStyle(color: Colors.black))),
              ),
              Center(
                  child: FlatButton(
                      color: colorFondo,
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Volver",
                          style: TextStyle(color: Colors.black)))),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colores.colorBurbuja,
      body: Column(
        //Cuerpo del calendario
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 35),
            height: MediaQuery.of(context).size.height *
                0.2, //hace la app responsive
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(30)),
            child:
                //Pendiente modificarlo XD
                TableCalendar(
              //Table calendar obtenido en ciertas partes de: https://medium.flutterdevs.com/display-dynamic-events-at-calendar-in-flutter-22b69b29daf6
              firstDay: DateTime(2021),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,

              //Especificamos el idioma del calendario
              // locale: 'es_COL', //para ponerlo hay que añadir un paquete y q pereza
              lastDay: DateTime(2023),
              calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.black),
                  todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  weekendDecoration: BoxDecoration(
                      //color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50))),

              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),

              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

//Metodo sacado de la pagina de la libreria https://pub.dev/packages/table_calendar
//Esto hace que al poner el dedo podamos ver el dia seleccionado (visualmente)
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  //esto guarda el dia seleccionado dentro de la variable selectedDay
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  print("dia seleccionado ${_focusedDay}");
                  mostrarEventos();
                  // update `_focusedDay` here as well
                });
              },
            ),
          ),

          //TEXTO FANCY
          Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              height: MediaQuery.of(context).size.height *
                  0.08, //hace la app responsive
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(15),
              child:
                  //Pendiente modificarlo XD
                  Row(
                children: [
                  Text(
                    "Actualizar Calendario",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mostrarEventos();
                        });
                      },
                      icon: Icon(Icons.refresh))
                ],
              )),

          //LISTA DE EVENTOS
          Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              height: MediaQuery.of(context).size.height *
                  0.50, //hace la app responsive
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(20)),
              child:
                  //Pendiente llenarlo de eventos XD
                  ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10),
                children: List.generate(eventosDelDia.length, (index) {
                  return Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: EdgeInsets.only(top: 4.0, bottom: 5.0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () => _mostrarEventoDetallado(eventosDelDia[index],
                          context, _selectedDay, eventosDelDia),
                      child: Text(
                        "${eventosDelDia[index].nombre} \nInicia: ${eventosDelDia[index].horaInicio} \nAcaba: ${eventosDelDia[index].horaFin}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  );
                }),
              ))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add_circle_outline_sharp,
          color: Colors.white,
        ),
        onPressed: () => _crearEvento(context),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _mostrarEventoDetallado(Evento eventosDelDia, BuildContext context,
      DateTime diaSeleccionado, List<Evento> lista_eventos_eseDia) {
    String eventoCompleto = " ";
    if (eventosDelDia is EventoOcio) {
      eventoCompleto =
          "Nombre: ${eventosDelDia.nombre} \nPublico: ${eventosDelDia.publico ? "si" : "no"} \nDuracion: ${eventosDelDia.duracion} horas \n" +
              "Descripcion: ${eventosDelDia.descripcion} \nActividades a hacer: ${eventosDelDia.actividades} \n" +
              "Etiquetas: ${eventosDelDia.Etiquetas} \nHora inicio: ${eventosDelDia.horaInicio} \nHora fin: ${eventosDelDia.horaFin}";
    } else if (eventosDelDia is EventoClase) {
      eventoCompleto =
          "Nombre: ${eventosDelDia.nombre}\n Duracion: ${eventosDelDia.duracion} horas\n" +
              //" Descripcion: ${eventosDelDia.descripcion}\nProfesor: ${eventosDelDia.Profesor}\n" +
              "Etiquetas: ${eventosDelDia.Etiquetas} \nHora inicio: ${eventosDelDia.horaInicio} \nHora fin: ${eventosDelDia.horaFin}";
    } else if (eventosDelDia is EventoEstudio) {
      eventoCompleto =
          "Nombre: ${eventosDelDia.nombre}\nDuracion: ${eventosDelDia.duracion} horas\n" +
              "Descripcion: ${eventosDelDia.descripcion}\nTemas: ${eventosDelDia.tema}\n" +
              "Etiquetas: ${eventosDelDia.Etiquetas} \nHora inicio: ${eventosDelDia.horaInicio} \nHora fin: ${eventosDelDia.horaFin}";
    }
    //organizar el texto segun el tipo de evento
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //Aqui debe redirigir a otra pantalla en la que se llenen los detalles del evento
            title: Text("Detalles del evento"),
            content: Text(eventoCompleto),
            actions: <Widget>[
              FlatButton(
                  color: colorFondo,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Volver",
                      style: TextStyle(color: Colors.white))),
              FlatButton.icon(
                  onPressed: () => _eliminarEvento(
                        eventosDelDia,
                        lista_eventos_eseDia,
                        diaSeleccionado,
                      ),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.orange,
                  ),
                  label: Text("Borrar evento")),
            ],
          );
        });
  }

  //este metodo borra los eventos, sacandolo de la lista de eventos, y actualizando la lista en el diccionario
  _eliminarEvento(Evento e, List<Evento> listaEseDia, DateTime claveDia) {
    listaEseDia.remove(e);
    MetodosEvento.eventosPublicos.remove(e);
    List<Evento> listaActualizada = listaEseDia;
    MetodosEvento.ListaEventosDB[claveDia] = listaActualizada;
    listacopia[claveDia] = listaActualizada;
    print("evento borrado con exito");
    // Navigator.pushNamedAndRemoveUntil(context, "/Calendario", (route) => false);
    Navigator.pop(context);
  }
}
