
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';

class FoodsClient {
  FoodsClient._();
  static FoodsClient foodsClient =FoodsClient._();
  



  Future<List<FoodModel>> getAllFoods() async {
    List<DocumentSnapshot> documents = await FireStroreData.databseFireStore.getAllFoods();
    List<FoodModel> foods = documents.map((e) => FoodModel.fromDocumentSnapshot(e)).toList();
    return foods;
  }


    Future<List<FavoritModel>> getAllFavorit(String user_id) async {
    List<DocumentSnapshot> documents = await FireStroreData.databseFireStore.getAllFavorit(user_id);
    List<FavoritModel> favorit = documents.map((e) => FavoritModel.fromDocumentSnapshot(e)).toList();
    return favorit;
  }


      Future<List<CartModel>> getAllCarts(String user_id,int sold) async {
    List<DocumentSnapshot> documents = await FireStroreData.databseFireStore.getAllCart(user_id,sold);
    List<CartModel> carts = documents.map((e) => CartModel.fromDocumentSnapshot(e)).toList();
    return carts;
  }


 

  
}