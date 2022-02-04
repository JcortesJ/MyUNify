import 'package:myunify/datos/Evento.dart';

class EventoClase extends Evento {
  late String Profesor;
  late String Materias;
  late bool Modalidad;

  @override
  void CrearEvento;
  //Pendiente usar estos metodos
  @override
  void EditarEvento;

  @override
  void EliminEvento;

  @override
  String toString() {
    String cadena = " ";

    cadena += super.toString();
    cadena +=
        "\n Profesor: $Profesor, Materia: $Materias,Virtual: ${Modalidad ? "si" : "no"},  ";
    return cadena;
  }

  EventoClase(
      String _nombre,
      DateTime _Fecha,
      int _duracion,
      bool _publico,
      String _Etiquetas,
      String descripcion,
      String dia,
      String mes,
      this.Materias,
      this.Modalidad,
      this.Profesor)
      : super(_Etiquetas, _Fecha, _duracion, _nombre, descripcion, _publico,
            mes, dia);
}
