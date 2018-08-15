import 'package:flutter/material.dart';
import './ui/home/home.dart';
import './ui/forecast/forecast.dart';

void main() => runApp(BtnWeather());

class BtnWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "btn weather",
      home: Forecast(),
      debugShowCheckedModeBanner: false,
    );
  }
}
