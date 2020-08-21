



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_food_app/Models/UserModel.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseAuth{

  
  BaseAuth._();

  static final BaseAuth baseAuth=BaseAuth._();

   factory BaseAuth(){
     return baseAuth;
   }

FirebaseAuth  _firebaseAuth=FirebaseAuth.instance ;
SharedPreferences prefs;

 Future<SharedPreferences> instializeSp() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs;
    } else {
      return prefs;
    }
  }
  
  FirebaseAuth initBaseAuth()  {
   if(baseAuth==null){
      _firebaseAuth = FirebaseAuth.instance;
      return _firebaseAuth;
   }else{
     return _firebaseAuth;
   }

  }





  signIn(String email, String password) async {
   
   try{
      _firebaseAuth= initBaseAuth();

    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    if(user!=null){
   UserModel userModel=await FireStroreData.databseFireStore.getuserdata(user.uid);


       prefs.setString(spUserAddress,userModel.address);
        prefs.setString(spUserName,userModel.name);
        prefs.setString(spUserPhone,userModel.phone);
    }
      return user.uid;
  } 
  
   catch (error) {
      print(error);
    }
  
  
  }



 

  // signOut() async {
  //   try {
  //     prefs = await instializeSp();
  //     await firebaseAuth.signOut();
  //     prefs.setString(spUserName, '');
  //     prefs.setString(userId, '');
  //     prefs.setBool(isLogged, false);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<String> signUp(String email, String password ) async {
    try{
      _firebaseAuth= initBaseAuth();
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password,);
    FirebaseUser user = result.user;
 

  
   


    return user.uid;
     } 
  
   catch (error) {
      print(error);
    }
  
  }

  Future<FirebaseUser> getCurrentUser() async {
   _firebaseAuth= initBaseAuth();
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  signOut() async {

    try{
     prefs = await instializeSp();
     _firebaseAuth= initBaseAuth();
       prefs.clear();



   return  _firebaseAuth.signOut();
  

    }catch (error) {
      print(error);
    }

  }

 

  Future<void> sendEmailVerification() async {
     _firebaseAuth= initBaseAuth();
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
     _firebaseAuth= initBaseAuth();
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}


