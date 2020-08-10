import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
 static SharedPreferences prefs;
  SPHelper._();
  static final SPHelper _spHelper = SPHelper._();
  factory SPHelper() {
    return _spHelper;
  }
 static initSp() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs;
    } else {
      return prefs;
    }
  }

  static Future setValue(String key, bool value) async {
    prefs = await initSp();
    return  prefs.setBool(key, value);
  }

 static getValue(String key) async{
    prefs = await initSp();
    var x = prefs.get(key);
    return x;
  }


  static Future  putString(String key,String value ) async {
    prefs = await initSp();
    return  prefs.setString(key, value);
  }
  


   static String getString(String key, {String defValue = ''}) {
     initSp();
    if (prefs == null) return defValue;
    return prefs.getString(key) ?? defValue;
  }


}
