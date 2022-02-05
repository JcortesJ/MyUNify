import 'package:myunify/datos/Evento.dart';

class EventoClase extends Evento {
  late String _Profesor;
  late String _Materias;

  set Profesor(String a) => _Profesor = a;
  String get Profesor => _Profesor;

  set Materias(String m) => _Materias = m;
  String get Materias => _Materias;

  @override
  void CrearEvento;
  //Pendiente usar estos metodos
  @override
  void EditarEvento;

  @override
  void EliminEvento;

  @override
  String toString() {
    String cadena = super.toString();
    cadena += "\n Profesor: $Profesor, Materia: $Materias,  ";
    return cadena;
  }

  EventoClase(
      String _nombre,
      DateTime _Fecha,
      int _duracion,
      bool _publico,
      String _Etiquetas,
      String descripcion,
      String horaInicio,
      String horaFin,
      this._Materias,
      this._Profesor)
      : super(_Etiquetas, _Fecha, _duracion, descripcion, _nombre, _publico,
            horaInicio, horaFin);
}
