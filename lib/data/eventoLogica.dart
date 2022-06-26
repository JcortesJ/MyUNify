// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';
import 'package:myunify/data/Evento.dart';
import 'package:myunify/data/EventoOcio.dart';
import 'package:myunify/pages/Calendario.dart';

class MetodosEvento {
  static Map<DateTime, List<Evento>> ListaEventosDB = {};

  static List<dynamic> eventosPublicos = [];
  static late DateTime diaSeleccionado;
  static DateTime diacentrado = DateTime.now();
  /*
  static DateTime formatearFecha(String dia, String mes) {
    int dia_ = int.parse(dia);
    int mes_ = int.parse(mes);

    DateTime fechaArreglada = DateTime(2022, mes_, dia_);
    print(fechaArreglada);
    return fechaArreglada;
  }
  */

  static void agregarEvento(Evento e, DateTime f) {
    diacentrado = f;

    List<Evento> listaPosible = [e];

    if (ListaEventosDB[f] == null) {
      ListaEventosDB.addAll({f: listaPosible});
      if (e.publico = true) {
        //añade a la lista publica si es necesario
        eventosPublicos.add(e);
        print("hemos añadido a una lista vacia");
      }
    } else {
      List<Evento> listaVieja = ListaEventosDB[f] as List<Evento>;
      listaVieja.add(e);
      // ListaEventosDB.update(f, (List<Evento> l) => listaVieja);
      ListaEventosDB[f] = listaVieja;
      if (e.publico = true) {
        //añade a la lista publica si es necesario
        eventosPublicos.add(e);
      }
      print("se ha agregado el evento a una lista vieja");
    }
  }

  static bool getPublico(String n) {
    if (n == "si")
      return true;
    else {
      return false;
    }
  }
}
