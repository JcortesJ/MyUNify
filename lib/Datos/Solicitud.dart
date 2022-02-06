
//import 'package:myunify/Datos/usuario.dart';
import 'package:myunify/Datos/Mensaje.dart';
import 'package:myunify/Datos/usuario.dart';

class Solicitud extends Mensaje{

  Usuario emisor;
  
  String _contenido;

  Solicitud(this._contenido, this.emisor,bool aceptado) : super(aceptado);
   
   
  String get Contenido{return _contenido;} 
  Usuario get User{return emisor;}

  set Contenido(String contenido) => _contenido; 
  set User(Usuario destinatario) => destinatario;

  @override

  String toString() {
      String cad = super.toString();
      return "$cad, destinatario: $emisor, contenido: $_contenido ";
    }

}
