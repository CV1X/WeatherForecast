import 'package:flutter/material.dart';
import 'package:flutter_1/WeatherForecast/WF.dart';
import 'package:flutter_1/ui/home.dart';

import 'Json/json.dart';
import 'ui/home.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[200],
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(fontSize: 45))),
      home: const WeatherForecast(),
    ));
