import 'package:flutter/material.dart';
import 'package:flutter_food_app/Models/UserModel.dart';
import 'package:flutter_food_app/UI/Pages/MyHomePage.dart';
import 'package:flutter_food_app/UI/Pages/login.dart';
import 'package:flutter_food_app/UI/Widgets/InputFields.dart';
import 'package:flutter_food_app/UI/Widgets/app_logo.dart';

import 'package:flutter_food_app/UI/Widgets/background.dart';
import 'package:flutter_food_app/UI/Widgets/tap_text.dart';
import 'package:flutter_food_app/UI/Widgets/white_button.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/BaseAuth.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SingUpPage extends StatelessWidget {

    String email,password ;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController email_control=TextEditingController();
  TextEditingController password_control=TextEditingController();
  TextEditingController conpassword_control=TextEditingController();

   TextEditingController name_control=TextEditingController();
    TextEditingController phone_control=TextEditingController();
     TextEditingController address_control=TextEditingController();
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
            Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            InputFieldArea(
              textEditingController: email_control,
              keyboardType: TextInputType.emailAddress,
        hint: "Email",
        obscure: false,
        icon: Icons.person_outline,
      ),


        InputFieldArea(
              textEditingController: name_control,keyboardType: TextInputType.name,
        hint: "Name",
        obscure: false,
        icon: Icons.assignment_late,
      ),


        InputFieldArea(
              textEditingController: address_control,
              keyboardType: TextInputType.streetAddress,
        hint: "Address",
        obscure: false,
        icon: Icons.location_on,
      ),

        InputFieldArea(
              textEditingController: phone_control,
              keyboardType: TextInputType.phone,
        hint: "Phone",
        obscure: false,
        icon: Icons.phone,
      ),
          InputFieldArea(
             textEditingController: password_control,
             keyboardType: TextInputType.visiblePassword,
             
          hint: "Password",
          obscure: true,
          icon: Icons.lock_outline,
        ),
          InputFieldArea(
            textEditingController: conpassword_control,
            keyboardType: TextInputType.visiblePassword,
            hint: 'Confirm Password',
               obscure: true,
          icon: Icons.lock_outline,
          ),
          WhiteButton(
              title: 'SIGN UP',
              onPress: () {
                validateAndSubmit(context);
              },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TapText(
              title: 'Already have an Account? Sign In',
              onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
              },
            ),
          ),
               
            ],
          ),
        ),
      ],
            )
        )
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
        if( password_control.text == conpassword_control.text){
      _formKey.currentState.save();
      
     String user_id= await BaseAuth.baseAuth.signUp(email_control.text, password_control.text) as String ; 
     if(user_id!=null){
        prefs.setString(spUserEmail, email_control.text);
        prefs.setString(userId,user_id);
        prefs.setBool(isLogged, true);
        prefs.setString(spUserAddress,address_control.text);
        prefs.setString(spUserName,name_control.text);
        prefs.setString(spUserPhone,phone_control.text);
        prefs.setString(spUserPassword,password_control.text);
        

       UserModel userModel= UserModel(user_id, name_control.text, email_control.text, address_control.text, phone_control.text, password_control.text);
         FireStroreData.databseFireStore.adduser(userModel);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage()), (Route<dynamic> route) => false);

     }
     }else{
        password_control.clear();
       conpassword_control.clear();
     }


          
    }
  }
}
