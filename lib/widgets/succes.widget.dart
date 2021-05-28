import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading-button.widget.dart';

class Success extends StatelessWidget {
  String result = "";
  Function reset;

  Success({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            text: "CALCULAR NOVAMENTE",
            busy: false,
            func: reset,
            inverter: true,
          ),
        ],
      ),
    );
  }
}
