import 'package:flutter/material.dart';
import 'package:weather_icons_flutter/weather_icons_flutter.dart';

class TodayPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodayPanelState();
}

class TodayPanelState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "07°",
              style: TextStyle(
                  fontSize: 110.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Icon(
                      WeatherIcons.day_sunny,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                  ),
                  Text(
                    "Sunny",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 7.0),
                    child: Icon(
                      WeatherIcons.forecast_io_wind,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                  ),
                  Text(
                    "12 kmph",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(
                      WeatherIcons.umbrella,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                  ),
                  Text(
                    "67%",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
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
