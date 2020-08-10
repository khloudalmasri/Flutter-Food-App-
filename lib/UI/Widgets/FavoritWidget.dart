
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';

class FavoritWidget extends StatelessWidget{
  final FavoritModel favoritModel;

  const FavoritWidget({this.favoritModel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return   Container(
      
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(12)),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        
     
        
           
        children: <Widget>[
          
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 100,
                width: 100,
                child: Image.network(favoritModel.image),
              ),

          Expanded(
                      child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
               
                Text(
                  favoritModel.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  favoritModel.description,
                  style: TextStyle(
                      fontSize: 14, color: Colors.grey[600]),
                ),

              

              
        
              ],
            ),
          ),



            Card(
                     color: Colors.white,
                     shadowColor: Colors.red,

                     
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0), // half of height and width of Image
      ),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
    ),)



        ],
      ),
    );
  }

}