import 'dart:convert';

class Patient {
  // * Datos generales
  String _nombre;
  String _ciudad;
  String _seguroSocial;
  double _telefono;
  String _genero;
  // * Datos
  int _edad;
  double _peso;
  double _estatura;
  String _tipoSange;
  String _alergias;
  // * Sintomas
  List<String> _sintomas = [];
  // * Estado
  String _estado;

  updatePatientValue(String index, value, [bool delete]) {
    switch (index) {
      case "nombre":
        _nombre = value;
        break;
      case "ciudad":
        _ciudad = value;
        break;
      case "seguroSocial":
        _seguroSocial = value;
        break;
      case "telefono":
        _telefono = double.parse(value);
        break;
      case "genero":
        _genero = value;
        break;
      case "edad":
        _edad = int.parse(value);
        break;
      case "peso":
        _peso = double.parse(value);
        break;
      case "estatura":
        _estatura = double.parse(value);
        break;
      case "tipoSange":
        _tipoSange = value;
        break;
      case "alergias":
        _alergias = value;
        break;
      case "sintomas":
        if (_sintomas == null) {
          _sintomas = [];
        }
        if (delete) {
          _sintomas.removeWhere((sintoma) => sintoma == value);
        } else {
          if (_sintomas.contains(value)) {
          } else {
            _sintomas.add(value);
          }
        }
        break;
      case "estado":
        _estado = value;
        break;
    }
  }

  getString() {
    return 'Nombre: $_nombre Ciuadad: $_ciudad Seguro Social: $_seguroSocial Telefono: $_telefono';
  }

  isComplet() {
    print("checking");
    return _nombre != null &&
        _alergias != null &&
        _ciudad != null &&
        _edad != null &&
        _estado != null &&
        _estatura != null &&
        _genero != null &&
        _nombre != null &&
        _peso != null &&
        _seguroSocial != null &&
        _sintomas.length > 0 &&
        _telefono != null &&
        _tipoSange != null;
  }

  Map toJson() {
    Map<String, dynamic> jsonPatient = {
      "name": _nombre,
      "gender": _genero,
      "allergies": _alergias.toString(),
      "bloodType": _tipoSange,
      "height": _estatura.toString(),
      "weight": _peso.toString(),
      "address": _ciudad,
      "telefono": _telefono.toString(),
      "status": _estado,
      "symptoms": _sintomas.toString()
    };
    return jsonPatient;
  }
}
