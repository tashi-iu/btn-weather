import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/utils.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getForecast("Paro,Bhutan"),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          Map data = snapshot.data;

          if (data != null && data.isNotEmpty) {
            List forecast = data['list'];

            DateFormat format = DateFormat.EEEE().add_jm();

            return Container(
                color: Colors.deepOrange,
                child: Card(
                  margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
                  elevation: 6.0,
                  child: ListView.builder(
                    itemCount: forecast.length,
                    itemBuilder: (BuildContext context, int i) {
                      var dateTime = format.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              forecast[i]['dt'] * 1000 + 21600000));

                      return ListTile(
                        leading: iconGenerator(
                            forecast[i]['weather'][0]['icon'],
                            20.0,
                            Colors.deepOrange),
                        title: Text("$dateTime"),
                        subtitle:
                            Text("${forecast[i]['weather'][0]['description']}"),
                      );
                    },
                  ),
                ));
          } else {
            return new Text("No Data");
          }
        });
  }
}
