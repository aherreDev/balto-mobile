import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  CheckList({@required this.options, @required this.onChange});
  final List<dynamic> options;
  final Function onChange;

  @override
  _CheckListState createState() =>
      _CheckListState(options: options, onChange: onChange);
}

class _CheckListState extends State<CheckList> {
  _CheckListState({@required this.options, @required this.onChange});
  List<dynamic> options;
  Function onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map((option) => Row(
                children: <Widget>[
                  Checkbox(
                      value: option['checked'],
                      onChanged: (bool newValue) {
                        onChange('sintomas', option['title'],
                            option['checked'] ? true : false);
                        setState(() {
                          options = options.map((optionData) {
                            if (optionData['title'] == option['title']) {
                              option['checked'] =
                                  option['checked'] ? false : true;
                              return option;
                            } else {
                              return optionData;
                            }
                          }).toList();
                        });
                      }),
                  Text(option['title'])
                ],
              ))
          .toList(),
    );
  }
}
