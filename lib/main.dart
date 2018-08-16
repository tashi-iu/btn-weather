import 'package:flutter/material.dart';

import 'package:btn_weather/pages/home_page.dart';

void main() => runApp(BtnWeather());

class BtnWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpine Forecast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
