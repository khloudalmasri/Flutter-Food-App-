import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';


import 'package:flutter_food_app/respository/FoodsClient.dart';
class MyProvider extends ChangeNotifier{
  List<FoodModel> foods=[];
   List<CartModel> carts=[];
  List<FavoritModel> favorites=[];
  List<FoodModel> filteredList = [];
  List<CartModel> selectedcart=[];

  int cart_counter=1;
  double cart_total=0;
  bool isselected=false;

   
   



  getAllFoods() async {
   
   foods= await FoodsClient.foodsClient.getAllFoods();
   
      notifyListeners();
  }

   getAllCarts(String user_id,int sold) async {
   
   carts= await FoodsClient.foodsClient.getAllCarts(user_id,sold);
   
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

   setCart_total(double cart_total) {
 
    this.cart_total = cart_total;
    notifyListeners();
  }  


    setCart_isselected(bool isselected) {
 
    this.isselected = isselected;
    notifyListeners();
  } 



    setCart_selected(CartModel cart_item) {
     
     this.selectedcart.add(cart_item);
     addTotatal();

    notifyListeners();
  } 


    removeCart_selected(CartModel cart_item) {
 
    this.selectedcart.removeAt(this.selectedcart.indexOf(cart_item));
     addTotatal();
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


    addTotatal(){
       this.cart_total=0; 
       if((this.selectedcart.isNotEmpty)) {
        this.cart_total=0; 
      for(int i = 0; i < this.selectedcart.length; i++) {
       this.cart_total=this.cart_total + double.parse(this.selectedcart[i].price)*this.selectedcart[i].quantity;
}}
   
    }


////////////cart update soloid when get cart
 order()  {
     
       if((this.selectedcart.isNotEmpty)) {
     
      for(int i = 0; i < this.selectedcart.length; i++) {
     
        FireStroreData.databseFireStore.updateitemCartsolid(this.selectedcart[i].id);
    
    
}

this.selectedcart.clear();
addTotatal();
notifyListeners();

}
   
    }
 
    }

   

