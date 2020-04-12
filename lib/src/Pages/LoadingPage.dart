import 'package:flutter/material.dart';

import 'dart:async';

import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _canChange = true;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () => _changePage(context));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height / 2 -
                  MediaQuery.of(context).size.width * 0.50,
              left: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.width * 0.50,
                    width: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2.5,
                          blurRadius: 1.25,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image(image: AssetImage('assets/logo.png')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Balto', style: TextStyle(fontSize: 70))
                ],
              ),
            ),
            Positioned(
                left: (MediaQuery.of(context).size.width - 70) / 2,
                bottom: MediaQuery.of(context).size.width * 0.20,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Loading",
                      style: TextStyle(fontSize: 20),
                    ),
                    Loading(
                        indicator: BallPulseIndicator(),
                        size: 50.0,
                        color: Colors.blueAccent)
                  ],
                ))
          ],

          // child: FloatingActionButton(
          //   elevation: 10,
          //   onPressed: null,
          //   child: Image(image: AssetImage('assets/logo.png')),
          // ),
        ),
      ),
    );
  }

  void _changePage(BuildContext context) {
    if (_canChange) {
      setState(() {
        _canChange = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
