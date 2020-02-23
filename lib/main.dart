import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'widgets/logo.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                alignment: Alignment.centerRight,
                child: Text(
                  "Gasoline",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "Big Shoulders Display",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextFormField(
                controller: _gasCtrl,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: "Big Shoulders Display"),
                decoration: InputDecoration(border: InputBorder.none),
              ))
            ],
          )
        ],
      ),
    );
  }
}
