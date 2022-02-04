// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';
import 'package:myunify/datos/Evento.dart';
import 'package:myunify/datos/EventoOcio.dart';
import 'package:myunify/pantallas/Calendario.dart';

class MetodosEvento {
  static Map<DateTime, List<Evento>> ListaEventosDB = {};

  static DateTime formatearFecha(String dia, String mes) {
    int dia_ = int.parse(dia);
    int mes_ = int.parse(mes);

    DateTime fechaArreglada = DateTime(2022, mes_, dia_);
    print(fechaArreglada);
    return fechaArreglada;
  }

  static void agregarEvento(Evento e, DateTime f) {
    List<Evento> listaPosible = [];
    listaPosible.add(e);
    ListaEventosDB[f] == null
        ?
        //aqui puede que se borre la lista anterior
        ListaEventosDB.addAll({f: listaPosible})
        : ListaEventosDB.update(f, (List<Evento> l) => listaPosible);
  }

  static bool getPublico(String n) {
    if (n == "si")
      return true;
    else
      return false;
  }
}
