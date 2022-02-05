// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';
import 'package:myunify/datos/Evento.dart';
import 'package:myunify/datos/EventoOcio.dart';
import 'package:myunify/pantallas/Calendario.dart';

class MetodosEvento {
  static Map<DateTime, List<Evento>> ListaEventosDB = {};
  static late DateTime diaSeleccionado;
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
    List<Evento> listaPosible = [e];

    //bug mas paila que alguna vez he visto
    /**
     * Horas invertidas resolviendo esto: 12h
     * El error: cuando agregabas el evento, creabas una lista posible, en caso de 
     * que no hubiera nada. Sin embargo, nunca la llené con el evento creado
     * por esto, no se mostraba el evento y la lista salía como vacia
     * Asi que moraleja, no codees bajo el consumo de sustancias extrañas ok no
     * No escribas codigo por que si, sino documentalo todo y trata de hacerlo tranquilo
     */

    if (ListaEventosDB[f] == null)
      ListaEventosDB.addAll({f: listaPosible});
    else {
      List<Evento> listaVieja = ListaEventosDB[f] as List<Evento>;
      listaVieja.add(e);
      ListaEventosDB.update(f, (List<Evento> l) => listaVieja);
      print(ListaEventosDB[f]);
    }
  }

  static bool getPublico(String n) {
    if (n == "si")
      return true;
    else
      return false;
  }
}
