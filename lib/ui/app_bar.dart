import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/utils.dart';
import './text_styles.dart';


Widget appBar() {
  var formater = DateFormat.yMMMMd("en_US");
  var todayDate = formater.format(DateTime.now());

  return new Container(
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
  );
}

  //for testing purposes..
void showData() async {
    Map data = await getForecast("Thimphu,Bhutan");
    if (data.isNotEmpty) {
      print(data['list'][0]);
    } else {
      print("No data");
    }
}