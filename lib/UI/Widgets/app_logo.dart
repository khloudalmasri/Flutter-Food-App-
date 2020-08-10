import 'package:flutter/material.dart';
import 'package:flutter_food_app/styles/grey_text_style.dart';


class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.restaurant,
              size: 80,
              color: primaryColor,
            ),
            Text(
              'Food House',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'BalooTamma',
                color:whiteColor,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
