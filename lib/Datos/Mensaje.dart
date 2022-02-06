// ignore_for_file: non_constant_identifier_names

import 'package:myunify/Datos/usuario.dart';

class Mensaje{

  // Remitente
  bool _aceptado;

  
  Mensaje( this._aceptado);

  bool get Aceptado{return _aceptado;}

 
  set Aceptado(bool aceptado) => _aceptado;


  @override

  String toString() {
      return "remitente: ${2}, estado: $_aceptado ";
    }


}