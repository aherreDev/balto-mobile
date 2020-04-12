import 'package:flutter/material.dart';

import 'package:balto_mobile/src/routes/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balto',
      initialRoute: '/',
      routes: getAplicationRoutes(),
    );
  }
}
