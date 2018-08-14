import 'package:flutter/material.dart';
import './ui/home/home.dart';

void main() => runApp(BtnWeather());

class BtnWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "btn weather",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
