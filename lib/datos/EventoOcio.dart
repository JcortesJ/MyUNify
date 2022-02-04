import 'Evento.dart';

class EventoOcio extends Evento {
  late String actividades;
  // late List<Usuario> asistentes;

  //implementar estos metodos
  @override
  void CrearEvento;

  @override
  void EditarEvento;

  @override
  void EliminEvento;

  @override
  String toString() {
    String cadena = " ";

    cadena += super.toString();
    cadena += "Actividad a hacer: $actividades";
    return cadena;
  }

  EventoOcio(
      String _nombre,
      DateTime _Fecha,
      int _duracion,
      bool _publico,
      String _Etiquetas,
      String descripcion,
      this.actividades,
      String dia,
      String mes)
      : super(_Etiquetas, _Fecha, _duracion, _nombre, descripcion, _publico,
            dia, mes);
}
