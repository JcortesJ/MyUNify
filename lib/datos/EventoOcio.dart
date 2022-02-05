import 'Evento.dart';

class EventoOcio extends Evento {
  late String actividades;

  set Actividades(String a) => actividades = a;
  String get Actividades => actividades;
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
    String cadena = super.toString();
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
      String horaInicio,
      String horaFin)
      : super(_Etiquetas, _Fecha, _duracion, descripcion, _nombre, _publico,
            horaInicio, horaFin);
}
