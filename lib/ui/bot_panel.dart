import 'package:flutter/material.dart';
import 'package:weather_icons_flutter/weather_icons_flutter.dart';

class BotPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BotPanelState();
}

class BotPanelState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("MON"),
              Icon(
                WeatherIcons.cloud,
                size: 42.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "6°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 4.0),),
                  Text(
                    "-2°",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("TUE"),
              Icon(
                WeatherIcons.day_rain,
                size: 42.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "9°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 4.0),),
                  Text(
                    "5°",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("WED"),
              Icon(
                WeatherIcons.day_sunny,
                size: 42.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "15°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 4.0),),
                  Text(
                    "9°",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("THU"),
              Icon(
                WeatherIcons.thunderstorm,
                size: 42.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "14°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 4.0),),
                  Text(
                    "8°",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("FRI"),
              Icon(
                WeatherIcons.day_sunny,
                size: 42.0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.0),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "20°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 4.0),),
                  Text(
                    "12°",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
