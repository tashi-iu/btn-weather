import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:weather_icons_flutter/weather_icons_flutter.dart';

Future<Map> getCurrentWeather(String city) async {
  String url =
      "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=959ced4532cb46160e081cf1d9bc50a0&units=metric";

  http.Response response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getForecast(String city) async {
  String url = "http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=959ced4532cb46160e081cf1d9bc50a0&units=metric";

  http.Response response = await http.get(url);
  return json.decode(response.body);
}

Icon iconGenerator(String iconName, double size, Color color) {
  /*
  01d:clear sky 
  02d: few clouds
  03d: scattered clouds
  04d:broken clouds-- about to rain
  09d: shower rain
  10d: rain
  11d: thunderstrom
  13d: snow
  50d: mist
  */
  List dayIcon = [
    "01d",
    "02d",
    "03d",
    "04d",
    "09d",
    "10d",
    "11d",
    "13d",
    "50d"
  ];

  Icon icon;
  
  if (dayIcon.contains(iconName)) {
    switch (iconName) {
      case "01d":
        icon = new Icon(WeatherIcons.day_sunny, size: size, color: color);
        break;
      case "02d":
        icon = new Icon(WeatherIcons.day_sunny_overcast, size: size, color: color);
        break;
      case "03d":
        icon = new Icon(WeatherIcons.day_cloudy, size: size, color: color);
        break;
      case "04d":
        icon = new Icon(WeatherIcons.day_cloudy_high, size: size, color: color);
        break;
      case "09d":
        icon = new Icon(WeatherIcons.day_showers, size: size, color: color);
        break;
      case "10d":
        icon = new Icon(WeatherIcons.day_rain, size: size, color: color);
        break;
      case "11d":
        icon = new Icon(WeatherIcons.day_thunderstorm, size: size, color: color);
        break;
      case "13d":
        icon = new Icon(WeatherIcons.day_snow, size: size, color: color);
        break;
      case "50d":
        icon = new Icon(WeatherIcons.day_fog, size: size, color: color);
        break;
      default:
        icon = new Icon(WeatherIcons.day_sunny);
        break;
    }

    }else {
    switch (iconName) {
      case "01n":
        icon = new Icon(WeatherIcons.night_clear, size: size, color: color);
        break;
      case "02n":
        icon = new Icon(WeatherIcons.night_alt_cloudy, size: size, color: color);
        break;
      case "03n":
        icon = new Icon(WeatherIcons.night_alt_cloudy, size: size, color: color);
        break;
      case "04n":
        icon = new Icon(WeatherIcons.night_alt_cloudy_high, size: size, color: color);
        break;
      case "09n":
        icon = new Icon(WeatherIcons.night_alt_showers, size: size, color: color);
        break;
      case "10n":
        icon = new Icon(WeatherIcons.night_alt_rain, size: size, color: color);
        break;
      case "11n":
        icon = new Icon(WeatherIcons.night_alt_thunderstorm, size: size, color: color);
        break;
      case "13n":
        icon = new Icon(WeatherIcons.night_alt_snow, size: size, color: color);
        break;
      case "50n":
        icon = new Icon(WeatherIcons.night_fog, size: size, color: color);
        break;
      default:
        icon = new Icon(WeatherIcons.night_clear);
        break;
    }

  }
   return icon;
}
