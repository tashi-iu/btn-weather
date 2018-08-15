import 'package:flutter/material.dart';

import '../text_styles.dart';
import '../data_displayer.dart';
import '../app_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

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
          
          //app bar here
          appBar(),
        
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 104.0, 8.0, 0.0),
            child: updateTemp("Paro,Bhutan"),
          ),
        ],
      ),
    );
  }

  
}
