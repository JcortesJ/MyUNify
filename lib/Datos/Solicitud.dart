
import 'package:myunify/Datos/Mensaje.dart';

class Solicitud extends Mensaje{
  // destinatario

  String _contenido;

  Solicitud(this._contenido, bool aceptado) : super(aceptado);
   
   
  String get Contenido{return _contenido;} 

  set Contenido(String contenido) => _contenido; 

  @override

  String toString() {
      String cad = super.toString();
      return "$cad, destinatario: ${2}, contenido: $_contenido ";
    }

}