import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_helper_flutter_app/widgets/input.widget.dart';

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
  var _ethCtrl = new MoneyMaskedTextController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Input(label: "Gasoline", ctrl: _gasCtrl),
          Input(label: "Ethanol", ctrl: _ethCtrl)
        ],
      ),
    );
  }
}
