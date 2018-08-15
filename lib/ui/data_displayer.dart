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
                  child: iconGenerator(data['weather'][0]['icon'], 100.0, Colors.white),
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
