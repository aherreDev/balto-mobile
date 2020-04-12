import 'package:flutter/material.dart';

import 'package:balto_mobile/src/Pages/HomePage.dart';
import 'package:balto_mobile/src/Pages/LoadingPage.dart';

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      '/': (BuildContext contex) => LoadingPage(),
      '/home': (BuildContext contex) => HomePage()
    };
