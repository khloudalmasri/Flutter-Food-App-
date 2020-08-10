import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  String id,name, description, cal, price, image,details,ingredients,rating,timing;

  FoodModel(this.id,this.name, this.description,this.rating, this.cal, this.price, this.image,this.details,this.ingredients,this.timing);
 // FoodModel(this.name, this.description, this.cal, this.price, this.image);





  FoodModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.documentID;
    this.name = documentSnapshot.data['name'];
    this.description = documentSnapshot.data['description'];
    this.image = documentSnapshot.data['image'];
    this.price = documentSnapshot.data['price'];
    this.cal = documentSnapshot.data['cal'];
    this.rating = documentSnapshot.data['rating'];
    this.details = documentSnapshot.data['details'];
    this.ingredients = documentSnapshot.data['ingredients'];
    this.timing=documentSnapshot.data['timing'];
  }
  
 toJson() {
    return {
      'id':this.id,
      'name': this.name,
      'description': this.description,
      'price': this.price,
      'image': this.image,
      'cal':  this.cal,
      'details': this.details,
      'ingredients': this.ingredients,
      'rating':this.rating,
      'timing':this.timing
    };
  }
}
