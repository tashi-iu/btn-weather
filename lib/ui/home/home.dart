import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';
import 'package:weather_icons_flutter/weather_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../text_styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var formater = DateFormat.yMMMMd("en_US");
    var todayDate = formater.format(DateTime.now());

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            child: new Image.asset(
              "images/paro.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
            height: 64.0,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: Colors.black45,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                      child: IconButton(
                        onPressed: showData,
                        icon: new Icon(
                          Icons.add_location,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        tooltip: "New Dzongkhag",
                      ),
                    ),
                    Text(
                      "Paro",
                      style: dzongkhagNameStyle(),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                      child: Text(
                        "$todayDate",
                        style: dateStyle(),
                      ),
                    ),
                    new IconButton(
                      onPressed: () => debugPrint("forecasting"),
                      icon: new Icon(
                        Icons.today,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      tooltip: "Forecast",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 104.0, 8.0, 0.0),
            child: updateTemp("Paro,Bhutan"),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeatherData(String city) async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=959ced4532cb46160e081cf1d9bc50a0&units=metric";

    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Widget updateTemp(String city) {
    return new FutureBuilder(
      future: getWeatherData(city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        Map data = snapshot.data;

        if (data != null && data.isNotEmpty) {
          //6 hour = 21600000 milliseconds
          DateFormat format = DateFormat.jm();
          var sunRiseTime = format.format(DateTime.fromMillisecondsSinceEpoch(
              data['sys']['sunrise'] * 1000 + 21600000));
          var sunSetTime = format.format(DateTime.fromMillisecondsSinceEpoch(
              data['sys']['sunset'] * 1000 + 21600000));
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Icon(
                      WeatherIcons.day_rain_mix,
                      size: 100.0,
                      color: Colors.white,
                    ),
                  ),
                  new Text(
                    "${data['main']['temp']}°",
                    style: temperatureStyle(),
                  ),
                ],
              ),
              Card(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 14.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(4.0)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "${data['weather'][0]['description']}",
                            style: descriptionStyle(),
                          ),
                          new Text(
                            "Humidity: ${data['main']['humidity']}%",
                            style: otherTextStyle(),
                          ),
                        ],
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Text(
                            "Sunrise: $sunRiseTime",
                            style: otherTextStyle(),
                          ),
                          new Text(
                            "Sunset: $sunSetTime",
                            style: otherTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return new Center(
            child: Text(
              "Please check your internet connection.",
              style: noDataStyle(),
            ),
          );
        }
      },
    );
  }

  //for testing purposes..
  void showData() async {
    Map data = await getWeatherData("Thimphu,Bhutan");
    if (data.isNotEmpty) {
      print(data['weather']);
    } else {
      print("No data");
    }
  }
}
