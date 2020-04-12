import 'package:balto_mobile/src/Utils/api.dart';
import 'package:balto_mobile/src/Widgets/CheckList.dart';
import 'package:balto_mobile/src/Widgets/StatusList.dart';
import 'package:flutter/material.dart';

import 'package:balto_mobile/src/Models/Patient.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Patient patientModel = Patient();
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nuevo paciente"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  _crearFirstSection(),
                  _crearSecondSection(),
                  _crearThirdSection(),
                  _crearFiveSection(),
                  RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      if (patientModel.isComplet()) {
                        setPatient(patientModel);
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Completado con exito"),
                                content:
                                    Text('Se agrego con exito al paciente'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      },
                                      child: Text("Ok"))
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Completa todos los campos"),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Ok"))
                                ],
                              );
                            });
                      }
                    },
                    child: Text('Submit'),
                  )
                ],
              ),
            )));
  }

  Widget _crearFirstSection() {
    return Card(
        child: Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 30),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Datos generales",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(),
          _crearField("Nombre: ", 'nombre', false),
          _crearField("Ciudad: ", 'ciudad', false),
          _crearField("Seguro Social: ", 'seguroSocial', false),
          _crearField("Contacto de emergencia: ", 'telefono', false,
              type: TextInputType.number),
        ],
      ),
    ));
  }

  Widget _crearSecondSection() {
    return Card(
        child: Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 30),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Datos",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(),
          _crearField("Género: ", 'genero', false),
          _crearField("Edad: ", 'edad', false, type: TextInputType.number),
          _crearField("Peso: ", 'peso', false, type: TextInputType.number),
          _crearField("Estatura: ", 'estatura', false,
              type: TextInputType.number),
          _crearField("Tipo de Sangre: ", 'tipoSange', false),
          _crearField("Alergias: ", 'alergias', false,
              type: TextInputType.multiline)
        ],
      ),
    ));
  }

  Widget _crearThirdSection() {
    return Card(
        child: Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 30),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Sintomas",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(),
          CheckList(
            options: [
              {"checked": false, "title": "Fiebre"},
              {"checked": false, "title": "Congestion Nasal"},
              {"checked": false, "title": "Dolor de garganta"},
              {"checked": false, "title": "Secreción Nasal"},
              {"checked": false, "title": "Dificultad para respirar"},
              {"checked": false, "title": "Fatiga"},
              {"checked": false, "title": "Dolor de cabeza"}
            ],
            onChange: patientModel.updatePatientValue,
          )
        ],
      ),
    ));
  }

  Widget _crearFiveSection() {
    return Card(
        child: Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 30),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "Estado Actual",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(),
          StatusList(onChange: patientModel.updatePatientValue)
        ],
      ),
    ));
  }

  Widget _crearField(String label, String valueSource, lastField,
      {TextInputType type}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '* $label',
          style: TextStyle(fontSize: 20),
        ),
        _crearInput(valueSource, lastField, type: type)
      ],
    );
  }

  Widget _crearInput(String valueSource, lastElement, {TextInputType type}) {
    return TextFormField(
      // autofocus: true,
      textInputAction:
          lastElement ? TextInputAction.send : TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      keyboardType: type != null ? type : TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Complete el campo',
      ),
      onFieldSubmitted: (v) {
        FocusScope.of(context)..nextFocus();
      },
      onChanged: (valor) {
        Patient copyPatient = patientModel;
        copyPatient.updatePatientValue(valueSource, valor);
        setState(() {
          patientModel = copyPatient;
        });
      },
    );
  }
}
