import 'package:flutter/material.dart';

import '../ui/today_panel.dart';
import '../ui/bot_panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 42.0,
          ),
        ),
        title: Text("PARO"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, size: 32.0,),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TodayPanel(),
          Column(
            children: <Widget>[
              Image(
                image: AssetImage('images/paro.jpg'),
              ),
              BotPanel(),
            ],
          ),
        ],
      ),
    );
  }
}
