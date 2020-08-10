import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/UI/Pages/FoodDetail.dart';
import 'package:flutter_food_app/UI/Widgets/FavoritWidget.dart';
import 'package:flutter_food_app/UI/Widgets/FavoritWidget.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/SPHelper.dart';
import 'package:provider/provider.dart';



class Favorites extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    Provider.of<MyProvider>(context, listen: false).getAllFavorites(SPHelper.getString(userId));
    Provider.of<MyProvider>(context, listen: false).getAllFoods();

   
    

  //    List<FavoritModel> favorites = [
  
  //   FavoritModel(
  //       "1","1","1","Dosa", "With spicy Chutney", "assets/images/dosa.png"),

  //         FavoritModel(
  //       "1","1","1","Dosa", "With spicy Chutney", "assets/images/dosa.png"),
  //         FavoritModel(
  //       "1","1","1","Dosa", "With spicy Chutney", "assets/images/dosa.png"),

  // ];
    // TODO: implement build
   return Consumer<MyProvider>(
      builder: (context, value, child) {

        List<FavoritModel>  favorites = value.favorites;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:Card(
               elevation: 10,
               borderOnForeground: false,
               shadowColor: Colors.white,
               shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
               color: Colors.white,
                          child: Container(
                      width: 30.00,
                      height: 30.00,
                     
                      child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),)
                    ),
                 

                    Container(
                      margin: EdgeInsets.only(top: 5,left: 5),
                      child: Text(  "Favorites",textAlign: TextAlign.center,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), )),
                ],
              ),
            ),

             favorites.isEmpty?  Center(
            child: Text('No Favorites'),
          )
      :

     Expanded(
           child: ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, int index) {
     return animatedContainer(favorites[index]);
                          }, 
                          ),

                          
                      )
                      


          ]
        )
      )
       );
  }
   );
  }


   Widget animatedContainer(favorites) {
    return OpenContainer(
    
      transitionDuration: const Duration(milliseconds: 700),
      closedElevation: 0,
      openShape: const RoundedRectangleBorder(),
      
      tappable: false,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return SizedBox(
          child: InkWell(
            onTap: openContainer,
            child: FavoritWidget(favoritModel: favorites,),
          ),
        );
      }, 

    openBuilder: (BuildContext context, VoidCallback _) {
   FoodModel foodModel= Provider.of<MyProvider>(context, listen: false).foods.firstWhere((element) => element.id==favorites.food_id);
               
               
      return  FoodDetail(foodData: foodModel,);
      
      },
    );
  }


}