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
      appBar: new AppBar(
        title: new Text("Alpine weather"),
        actions: <Widget>[

          new IconButton(
            onPressed: showData,
            icon: new Icon(Icons.add_location),
            tooltip: "New Dzongkhag",
          ),
          
          new IconButton(
            onPressed: ()=> debugPrint("forecasting"),
            icon: new Icon(Icons.today),
            tooltip: "Forecast",
          ),
        ],
      ),
      
    body: new Stack(
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
          child: new Image.asset(
            "images/paro.jpg",
            fit: BoxFit.fill,
            height: 1800.0,
          ),
        ),
        
        //Dzongkhag and date displayer.
        new Container(
          margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          height: 60.0,
          decoration: new BoxDecoration(
            color: Colors.black38,
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Text("Paro",
              style: dzongkhagNameStyle(),
              ),
              new Padding(
                padding: EdgeInsets.only(right: 50.0),
              ),
              new Text("$todayDate",
                style: dateStyle(),
              ),
            ],
          ),
        ),

        new Container(
          
          height: 400.0,
          width: 300.0,
          decoration: new BoxDecoration(
            color: Colors.black26,
            borderRadius: new BorderRadius.all(Radius.circular(10.0))
          ),
          
          margin: const EdgeInsets.fromLTRB(30.0, 110.0, 30.0, 0.0),
          alignment: Alignment.center,
          child: updateTemp("Paro,Bhutan"),
        ),
      ],
    ), 
    );
  }

  Future<Map> getWeatherData(String city) async{
    String url = "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=959ced4532cb46160e081cf1d9bc50a0&units=metric";

    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Widget updateTemp(String city){
    
    return new FutureBuilder(
      future: getWeatherData(city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        
        Map data = snapshot.data;
        
        if (data != null && data.isNotEmpty){  
          
          //6 hour = 21600000 milliseconds
          DateFormat format = DateFormat.jm();
          var sunRiseTime = format.format(DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'] * 1000 + 21600000));
          var sunSetTime = format.format(DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000 + 21600000));

          return new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              
              new Icon(WeatherIcons.day_rain_mix,
                size: 100.0,
                color: Colors.white,
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text(
                    "${data['main']['temp']}°C",
                    style: temperatureStyle(),
                  ),

                  new Text(
                    "${data['weather'][0]['description']}",
                    style: descriptionStyle(),
                  ),
               ],
              ),
                  
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("Humidity: ${data['main']['humidity']}%",
                    style: otherTextStyle(),
                  ),

                  new Padding(
                    padding: EdgeInsets.only(bottom: 7.0),
                  ),
                    
                  new Text("Sunrise: $sunRiseTime",
                    style: otherTextStyle(),
                  ),
                  
                  new Padding(
                    padding: EdgeInsets.only(bottom: 7.0),
                  ),
              
                  new Text("Sunset: $sunSetTime",
                    style: otherTextStyle(),
                  ),
                ],
              ),
            ],
          );
        }else{
          return new Center(
            child: Text("Please check your internet connection.",
              style: noDataStyle(),
            ),
          );
        }
      },
    );
  }


  //for testing purposes..
  void showData() async{
    Map data = await getWeatherData("Thimphu,Bhutan");
    if(data.isNotEmpty){
      print(data['weather']);
    }else{
      print("No data");
    }
  }
}
