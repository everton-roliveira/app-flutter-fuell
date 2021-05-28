import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  bool inverter = false;
  bool busy = false;
  String text = "";
  Function func;

  LoadingButton({
    @required this.busy,
    @required this.text,
    @required this.inverter,
    @required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: inverter
            ? Theme.of(context).primaryColor
            : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(60),
      ),
      child: busy
          ? Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            )
          : TextButton(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: "Big Shoulders Display",
                  color:
                      inverter ? Colors.white : Theme.of(context).primaryColor,
                  letterSpacing: 2,
                  fontSize: 30,
                ),
              ),
              onPressed: func,
            ),
    );
  }
}
