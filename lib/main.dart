import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/UI/Pages/MyHomePage.dart';
import 'package:flutter_food_app/UI/Pages/welcome.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/BaseAuth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();   //  ADD THIS BEFORE YOUR ASYNC FUNCTION CALL.

 SharedPreferences  prefs = await BaseAuth.baseAuth.instializeSp();
  runApp(prefs.getBool(isLogged) ?? false ? MyApp(home: MyHomePage(),):MyApp(home: WelcomePage(),));
}

class MyApp extends StatelessWidget {
 final Widget home;
 

  MyApp({this.home});
 
  
  @override
  build(BuildContext context)   {

  
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>(
          create: (BuildContext context) {
            return MyProvider();
          },
        ),
      ],
      child: MaterialApp(
       title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "BalooTamma",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home,
    )
    );
  }




}

