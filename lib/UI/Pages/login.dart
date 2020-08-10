import 'package:flutter/material.dart';
import 'package:flutter_food_app/UI/Pages/MyHomePage.dart';
import 'package:flutter_food_app/UI/Pages/sign_up.dart';
import 'package:flutter_food_app/UI/Widgets/InputFields.dart';
import 'package:flutter_food_app/UI/Widgets/app_logo.dart';

import 'package:flutter_food_app/UI/Widgets/background.dart';
import 'package:flutter_food_app/UI/Widgets/orange_button.dart';
import 'package:flutter_food_app/UI/Widgets/tap_text.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/BaseAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatelessWidget {
     String email,password ;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController email_control=TextEditingController();
  TextEditingController password_control=TextEditingController();
   SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Background(),
           SingleChildScrollView(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          
              children: <Widget>[
                
                Form(
                    key: _formKey,
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                         AppLogo(),
                      InputFieldArea(
                        textEditingController: email_control,
                        hint: "Email",
                        obscure: false,
                        icon: Icons.person_outline,
                      ),
                      InputFieldArea(
                        textEditingController: password_control,
                      hint: "Password",
                      obscure: true,
                      icon: Icons.lock_outline,
                        ),

                          OrangeButton(
                            
                        title: 'SIGN IN',
                        onPress: () {
                          validateAndSubmit(context);
                        },
                      ),
                    
                      TapText(
                        title: 'Don\'t have an Account? Sing Up',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SingUpPage(),
                            ),
                          );
                        },
                      ),


                      
                    ],
                  ),
                ),
              ],
          ),
           )
        ],
      ),
    );
  }



  
   void validateAndSubmit(BuildContext context) async {
     prefs = await BaseAuth.baseAuth.instializeSp();
   
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      
     String user_id= await BaseAuth.baseAuth.signIn(email_control.text, password_control.text) as String ; 
      if(user_id!=null){
          prefs.setString(spUserEmail, email_control.text);
        prefs.setString(userId,user_id);
        prefs.setBool(isLogged, true);
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage()), (Route<dynamic> route) => false);


     }
          
    }
  }

}
