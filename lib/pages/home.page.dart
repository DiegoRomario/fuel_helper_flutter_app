import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_helper_flutter_app/widgets/logo.widget.dart';
import 'package:fuel_helper_flutter_app/widgets/submit.form.dart';
import 'package:fuel_helper_flutter_app/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _ethCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _restultText = "Ethanol is the better choice";
  Color _color = Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(
            milliseconds: 1200,
          ),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(result: _restultText, reset: reset)
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      ethCtrl: _ethCtrl,
                      busy: _busy,
                      submitFunc: calculate,
                    )
            ],
          ),
        ));
  }

  Future calculate() {
    double eth =
        double.parse(_ethCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = eth / gas;

    setState(() {
      _color = Colors.orange;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _restultText = "Gasoline is the better choice.";
        } else {
          _restultText = "Ethanol is the better choice.";
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _color = Colors.deepOrange;
      _ethCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
