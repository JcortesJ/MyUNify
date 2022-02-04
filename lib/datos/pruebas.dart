// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';
import 'package:myunify/datos/Evento.dart';
import 'package:myunify/pantallas/Calendario.dart';

class MetodosEvento {
  static Map<DateTime, List<Evento>> ListaEventosDB = {};

  static DateTime formatearFecha(String dia, String mes) {
    String dia = "02";
    String mes = "09";
    String basura = "00:00:00.000Z";
    String ano = "2022";
    String fecha = "$ano-$dia-$mes $basura";
    var fechaArreglada = DateTime.parse(fecha);
    print(fechaArreglada is DateTime);
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
