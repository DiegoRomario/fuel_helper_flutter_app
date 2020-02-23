import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_helper_flutter_app/widgets/input.widget.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var ethCtrl = new MoneyMaskedTextController();

  var busy = false;
  Function submitFunc;

  SubmitForm(
      {@required this.busy,
      @required this.ethCtrl,
      @required this.gasCtrl,
      @required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(label: "Gasoline", ctrl: gasCtrl),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(label: "Ethanol", ctrl: ethCtrl),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          func: submitFunc,
          text: "CALCULATE",
          blackButton: true,
        ),
      ],
    );
  }
}
