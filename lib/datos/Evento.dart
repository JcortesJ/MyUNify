import 'package:intl/intl.dart';

abstract class Evento {
  late String _nombre;
  late String _dia;
  late String _mes;
  late DateTime _Fecha;
  late int _duracion;
  late bool _publico;
  String _descripcion = "no hay nada por ver por aqui";
  late String _Etiquetas;

  abstract void EditarEvento;
  abstract void EliminEvento;
  abstract void CrearEvento;

  set nombre(String n) => _nombre = n;
  set descripcion(String de) => _descripcion = de;
  set Fecha(DateTime f) => _Fecha = f;
  set publico(bool p) => _publico = p;
  set duracion(int du) => _duracion = du;
  set Etiquetas(String l) => _Etiquetas = l;

  String get nombre => _nombre;
  String get descripcion => _descripcion;
  DateTime get Fecha => _Fecha;
  bool get publico => _publico;
  int get duracion => _duracion;
  String get Etiquetas => _Etiquetas;

  Evento(this._Etiquetas, this._Fecha, this._duracion, this._descripcion,
      this._nombre, this._publico, this._dia, this._mes);

  @override
  String toString() {
    String cadena = " ";
    DateTime fechaActual = Fecha;
    //convierte la fecha a dia de la semana, mes y año
    var fechaConFormato = Fecha;
    cadena +=
        "Evento para ${fechaConFormato} \n Titulo: $nombre Publico: ${publico ? "si" : "no"}  \n Descripcion: $descripcion \n $Etiquetas";
    return cadena;
  }
}
