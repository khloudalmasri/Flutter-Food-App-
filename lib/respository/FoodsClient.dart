
import 'package:cloud_firestore/cloud_firestore.dart';
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


  //  checfound(String user_id,String food_id) async {
  //     bool found=  await FireStroreData.databseFireStore.foundInFavorit(user_id,food_id);

  //     return found;
  //  }

  
}