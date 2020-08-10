import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';


import 'package:flutter_food_app/respository/FoodsClient.dart';
class MyProvider extends ChangeNotifier{
  List<FoodModel> foods=[];
   List<CartModel> carts=[];
  List<FavoritModel> favorites=[];
  List<FoodModel> filteredList = [];

  int cart_counter=1;
   



  getAllFoods() async {
   
   foods= await FoodsClient.foodsClient.getAllFoods();
   
      notifyListeners();
  }

   getAllCarts(String user_id) async {
   
   carts= await FoodsClient.foodsClient.getAllCarts(user_id);
   
      notifyListeners();
  }

    getAllFavorites(String user_id) async {
   
   favorites= await FoodsClient.foodsClient.getAllFavorit(user_id);
   
      notifyListeners();
  }



 setCart_counter(int cart_counter) {
 
    this.cart_counter = cart_counter;
    notifyListeners();
  } 
  filteredfoodList(String filter){
     filteredList.clear();
      if((filter.isNotEmpty)) {
       
  for(int i = 0; i < foods.length; i++) {
        if(foods[i].name.toLowerCase().contains(filter.toLowerCase())) {
         filteredList.add(foods[i]);
        }
      }
   
    }
    notifyListeners();
    }

   

}