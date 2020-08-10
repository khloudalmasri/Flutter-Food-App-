import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/UI/Pages/Favorites.dart';

import 'package:flutter_food_app/constants.dart';

class FireStroreData {
 FireStroreData._();
 static final FireStroreData databseFireStore=FireStroreData._();

 Firestore firestore;
 initedatabase(){
   if(firestore==null){
     firestore=Firestore.instance;
     return firestore;
   }
   else{
      return firestore;
   }
 }


   Future<String> uploadProduct(FoodModel product) async {
    
    try {
      firestore= initedatabase();
      DocumentReference documentReference = await firestore.collection(FoodsCollection).add(product.toJson());
      product.id=documentReference.documentID;
      if(documentReference.documentID != null){
     await   firestore.collection(FoodsCollection).document(documentReference.documentID).updateData(product.toJson());

         return documentReference.documentID;
      }
     
    } catch (error) {
      print(error);
    }
  }



     Future<String> addToFavorit(FavoritModel favoritModel) async {
    
    try {
      firestore= initedatabase();
      DocumentReference documentReference = await firestore.collection(FavoritCollection).add(favoritModel.toJson());
      favoritModel.id=documentReference.documentID;
      if(documentReference.documentID != null){
     await   firestore.collection(FavoritCollection).document(documentReference.documentID).updateData(favoritModel.toJson());

         return documentReference.documentID;
      }
     
    } catch (error) {
      print(error);
    }
  }


       Future<String> addToCart(CartModel cartModel) async {
    
    try {
      firestore= initedatabase();
      DocumentReference documentReference = await firestore.collection(CartCollection).add(cartModel.toJson());
      cartModel.id=documentReference.documentID;
      if(documentReference.documentID != null){
     await   firestore.collection(CartCollection).document(documentReference.documentID).updateData(cartModel.toJson());

         return documentReference.documentID;
      }
     
    } catch (error) {
      print(error);
    }
  }


   updateCart(String id,CartModel cartModel) async {
    
    try {
      firestore= initedatabase();
     await firestore.collection(CartCollection).document(id).updateData(cartModel.toJson());
      }
     
    catch (error) {
      print(error);
    }
  }




    Future<List<DocumentSnapshot>> getAllCart(String user_id) async {
 
    try {
     firestore= initedatabase();

      QuerySnapshot querySnapshot = await firestore.collection(CartCollection).where('user_id',isEqualTo: user_id).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }


  deleteCart(String id) async {
 
    try {
     firestore= initedatabase();

       await firestore.collection(CartCollection).document(id).delete();
      
    } catch (error) {
      print(error);
    }
  }





  Future<List<DocumentSnapshot>> getAllFavorit(String user_id) async {
 
    try {
     firestore= initedatabase();

      QuerySnapshot querySnapshot = await firestore.collection(FavoritCollection).where('user_id',isEqualTo: user_id).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }


 deleteFavorit(String id) async {
 
    try {
     firestore= initedatabase();

       await firestore.collection(FavoritCollection).document(id).delete();
      
    } catch (error) {
      print(error);
    }
  }




   Future<String>foundInFavorit(String user_id,String food_id) async {
 
    try {
     firestore= initedatabase();

      QuerySnapshot querySnapshot = await firestore.collection(FavoritCollection)
      .where('user_id',isEqualTo: user_id)
      .where('food_id',isEqualTo: food_id)
      .getDocuments();
     
     
      if(querySnapshot.documents.length>0){
      return querySnapshot.documents[0].documentID;
    }
    
    } catch (error) {
      print(error);
    }
  }


     Future<String>foundInCart(String user_id,String food_id) async {
 
    try {
     firestore= initedatabase();

      QuerySnapshot querySnapshot = await firestore.collection(CartCollection)
      .where('user_id',isEqualTo: user_id)
      .where('food_id',isEqualTo: food_id)
      .getDocuments();
     
     
      if(querySnapshot.documents.length>0){
      return querySnapshot.documents[0].documentID;
    }
    
    } catch (error) {
      print(error);
    }
  }


    Future<List<DocumentSnapshot>> getAllFoods() async {
 
    try {
     firestore= initedatabase();

      QuerySnapshot querySnapshot = await firestore.collection(FoodsCollection).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }




}