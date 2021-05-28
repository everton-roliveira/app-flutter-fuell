import 'package:app_fuell/widgets/logo.widget.dart';
import 'package:app_fuell/widgets/submit-form.widget.dart';
import 'package:app_fuell/widgets/succes.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasController = new MoneyMaskedTextController();
  var _alcController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Álcool";
  var _color;

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
                ? Success(
                    result: "Compensa utilizar " + _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcController: _alcController,
                    gasController: _gasController,
                    submitFunc: calculate,
                    busy: _busy,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double gas =
        double.parse(_gasController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;

    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(
      const Duration(seconds: 3),
      () => {
        setState(() {
          _resultText = "Álcool";
          if (res >= 0.7) {
            _resultText = "Gasolina";
          }
          _busy = false;
          _completed = true;
        })
      },
    );
  }

  reset() {
    setState(() {
      _alcController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _color = Theme.of(context).primaryColor;
      _completed = false;
      _busy = false;
    });
  }
}
