import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:balto_mobile/src/Models/Patient.model.dart';

final _ulr = "http://some.com/";

Future setPatient(Patient patient) async {
  final url = Uri.https(_ulr, '/patients/');
  final respuesta = await http.post(url, body: patient.toJson());
  if (respuesta.statusCode >= 200 && respuesta.statusCode < 300) {
    return true;
  }
  return false;
}
