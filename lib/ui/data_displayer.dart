import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
import './text_styles.dart';

Widget updateTemp(String city) {
  return new FutureBuilder(
    future: getCurrentWeather(city),
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
                    child: iconGenerator(
                        data['weather'][0]['icon'], 100.0, Colors.white),
                  ),
                  new Text(
                    "${data['main']['temp']}°",
                    style: temperatureStyle(),
                  ),
                ],
              ),

              
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    "${data['weather'][0]['description']}",
                    style: descriptionStyle(),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Humidity: ${data['main']['humidity']}%",
                        style: otherTextStyle(),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 7.0),
                      ),
                      new Text(
                        "Sunrise: $sunRiseTime",
                        style: otherTextStyle(),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 7.0),
                      ),
                      new Text(
                        "Sunset: $sunSetTime",
                        style: otherTextStyle(),
                      ),
                    ],
                  ),
                ],
              )
            ]);
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
