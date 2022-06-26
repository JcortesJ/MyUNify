import 'Evento.dart';

class EventoEstudio extends Evento {
  late String tema;
  //late List<Usuario> asistentes;

  //arreglar estos metodos (utilizaron)
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
    cadena += "\n Temas: $tema  ";
    return cadena;
  }

  EventoEstudio(String _nombre, DateTime _Fecha, int _duracion, bool _publico,
      String _Etiquetas, String descripcion, this.tema, String dia, String mes)
      : super(_Etiquetas, _Fecha, _duracion, descripcion, _nombre, _publico,
            dia, mes);
}
