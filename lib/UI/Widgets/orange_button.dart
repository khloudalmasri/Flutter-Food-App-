import 'package:flutter/material.dart';
import 'package:flutter_food_app/styles/grey_text_style.dart';

class OrangeButton extends StatelessWidget {
  final String title;
  final Function onPress;

   OrangeButton({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.only(top: 50),

      child: MaterialButton(
         onPressed: onPress,
            child: Container(
          width: 320.0,
          height: 50.0,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: primaryColor,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: new Text(title,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3,
            ),
          ),
        
        ),
      ),
    );
  }
}
