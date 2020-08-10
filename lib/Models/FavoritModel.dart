import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritModel{

  String id,food_id,user_id,name, description, image;
  FavoritModel(this.id,this.user_id,this.food_id,this.name, this.description, this.image);




 toJson() {
    return {
      'id':this.id,
      'food_id':this.food_id,
      'user_id':this.user_id,
      'name': this.name,
      'description': this.description,
      'image': this.image,
    
  
    };
  }




    FavoritModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.id = documentSnapshot.documentID;
    this.food_id = documentSnapshot.data['food_id'];
    this.user_id = documentSnapshot.data['user_id'];
    this.name = documentSnapshot.data['name'];
    this.description = documentSnapshot.data['description'];
    this.image = documentSnapshot.data['image'];
   
  }
}