import 'package:flutter/material.dart';
import 'package:flutter_food_app/styles/grey_text_style.dart';

class TapText extends StatelessWidget {

  final String title;
  final Function onPress;

  TapText({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return  FlatButton(
      padding: const EdgeInsets.only(
        top: 50.0,
      ),
      onPressed: onPress,
      child: new Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.white,
            fontSize: 12.0),
      ),
    );
  }
}
