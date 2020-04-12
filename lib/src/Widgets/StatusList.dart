import 'package:balto_mobile/src/Utils/Icons.provider.dart';
import 'package:flutter/material.dart';

class StatusList extends StatefulWidget {
  StatusList({@required this.onChange});
  final Function onChange;
  @override
  _StatusListState createState() => _StatusListState(onChange: onChange);
}

class _StatusListState extends State<StatusList> {
  _StatusListState({@required this.onChange});
  final Function onChange;
  List<Status> states = [
    Status(title: "Empeorando", selected: false),
    Status(title: "Estable", selected: false),
    Status(title: "Mejorando", selected: false)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: states.map((state) => _crearOption(state, onChange)).toList(),
      ),
    );
  }

  Widget _crearOption(Status state, Function onChange) {
    return GestureDetector(
      onTap: () {
        // final snackBar = SnackBar(content: Text("Tap"));
        // Scaffold.of(context).showSnackBar(snackBar);
        onChange("estado", state.title);
        setState(() {
          states = states.map((stateData) {
            stateData.selected = false;
            if (stateData.title == state.title) {
              stateData.selected = true;
            }
            return stateData;
          }).toList();
        });
      },
      child: Column(
        children: <Widget>[
          Icon(
            getIconsData(state.title.toLowerCase()),
            size: 50,
            color: state.selected == true ? Colors.blueAccent : Colors.grey,
          ),
          Text(
            state.title,
            style: TextStyle(
                fontSize: 15,
                color: state.selected == true ? Colors.blueAccent : Colors.grey,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Status {
  bool selected;
  String title;
  Status({@required this.title, this.selected});
}
