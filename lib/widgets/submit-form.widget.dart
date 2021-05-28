import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.dart';
import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  var alcController = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.gasController,
    @required this.alcController,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(
          label: "Gasolina",
          controller: gasController,
        ),
        Input(
          label: "Álcool",
          controller: alcController,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
            bottom: 20,
          ),
          child: LoadingButton(
            text: "CALCULAR",
            busy: busy,
            func: submitFunc,
            inverter: false,
          ),
        ),
      ],
    );
  }
}
