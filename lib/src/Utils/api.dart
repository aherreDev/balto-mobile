import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:balto_mobile/src/Models/Patient.model.dart';

final String _ulr = "https://baltoapi.herokuapp.com";

Map<String, String> headers = {'Content-type': 'application/json'};

Future setPatient(Patient patient) async {
  // final url = Uri.https(_ulr, '/patients/');
  String url = '$_ulr/patients/';
  final respuesta = await http.post(url, body: patient.toJson());
  print(json.encode(patient.toJson()));
  if (respuesta.statusCode >= 200 && respuesta.statusCode < 300) {
    print("nice!");
    print('Status: ${respuesta.statusCode} ${respuesta.headers.toString()}');
    print(respuesta.body);
    return true;
  } else {
    print('Error ${respuesta.statusCode} ${respuesta.headers.toString()}');
    return false;
  }
}
