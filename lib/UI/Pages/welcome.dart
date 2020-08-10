import 'package:flutter/material.dart';
import 'package:flutter_food_app/UI/Pages/MyHomePage.dart';
import 'package:flutter_food_app/UI/Pages/login.dart';
import 'package:flutter_food_app/UI/Pages/sign_up.dart';
import 'package:flutter_food_app/UI/Widgets/app_logo.dart';
import 'package:flutter_food_app/UI/Widgets/background.dart';
import 'package:flutter_food_app/UI/Widgets/orange_button.dart';
import 'package:flutter_food_app/UI/Widgets/tap_text.dart';
import 'package:flutter_food_app/UI/Widgets/white_button.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/BaseAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
 



    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          AppLogo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OrangeButton(
                  title: 'SIGN IN',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  },
                ),
                WhiteButton(
                  title: 'SIGN UP',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SingUpPage(),
                      ),
                    );
                  },
                ),
                TapText(title: 'Need Help?', onPress: () {}),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }


 
}
