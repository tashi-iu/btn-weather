import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_icons_flutter/weather_icons_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              new Text("TashiGangsdfR",
              style: dzongkhagNameStyle(),
              ),
              new Padding(
                padding: EdgeInsets.only(right: 50.0),
              ),
              new Text("9 August 2018",
                style: dateStyle(),
              ),
            ],
          ),
        ),

        new Container(
          
          height: 350.0,
          width: 300.0,
          decoration: new BoxDecoration(
            color: Colors.black26,
            borderRadius: new BorderRadius.all(Radius.circular(10.0))
          ),
          
          margin: const EdgeInsets.fromLTRB(30.0, 130.0, 30.0, 30.0),
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
          return new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Icon(WeatherIcons.day_cloudy_high,
                size: 100.0,
                color: Colors.white,
              ),

              new ListTile(
                title: new Text(
                  "${data['main']['humidity']}°C",
                  style: temperatureStyle(),
                ),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text("Humidity: ${data['main']['humidity']}",
                      style: otherTextStyle(),
                    ),
                    new Text("another stuff: 200",
                      style: otherTextStyle(),
                    ),
                  ],
                ),
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

  void showData() async{
    Map data = await getWeatherData("Thimphu,Bhutan");
    if(data.isNotEmpty){
      print(data['main']['humidity']);
    }else{
      print("No data");
    }
  }

}

// stuffs for later
TextStyle dzongkhagNameStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 19.0,
    fontWeight: FontWeight.bold
  );
}

TextStyle dateStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600
  );
}

TextStyle temperatureStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 50.0,
    fontWeight: FontWeight.bold
  );
}

TextStyle otherTextStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold
  );
}

TextStyle noDataStyle(){
  return new TextStyle(
    color: Colors.red,
    fontSize: 20.0,
    fontWeight: FontWeight.normal
  );
}