import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var label = "";
  var controller = new MoneyMaskedTextController();

  Input({
    @required this.label,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Big Shoulders Display',
                fontSize: 35),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
            decoration: InputDecoration(border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
