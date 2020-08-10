
import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel{
  String  id,food_id,user_id,time,name, description,  price, image;
  int quantity,sold;
  CartModel(this.id,this.user_id,this.food_id,this.time,this.sold,this.name, this.description, this.price, this.image,this.quantity);

  //CartModel(this.name, this.description, this.price, this.image,this.quantity);

   CartModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.documentID;
    this.name = documentSnapshot.data['name'];
    this.description = documentSnapshot.data['description'];
    this.image = documentSnapshot.data['image'];
    this.price = documentSnapshot.data['price'];
    this.food_id = documentSnapshot.data['food_id'];
    this.user_id = documentSnapshot.data['user_id'];
    this.time = documentSnapshot.data['time'];
    this.sold = documentSnapshot.data['sold'];
     this.quantity = documentSnapshot.data['quantity'];

  }
  
 toJson() {
    return {
      'id':this.id,
      'name': this.name,
      'description': this.description,
      'price': this.price,
      'image': this.image,
      'time': this.time,
      'food_id':this.food_id,
      'user_id':this.user_id,
       'sold':this.sold,
        'quantity':this.quantity,
     
   
    };
  }

}