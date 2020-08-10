
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/UI/Pages/FoodDetail.dart';
import 'package:flutter_food_app/UI/Widgets/CartWidget.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/SPHelper.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    

  //    List<CartModel> carts = [
   
  //   // CartModel(
  //   //     "Dosa", "With spicy Chutney",  "45.75", "assets/images/dosa.png",2),
  //   // CartModel("Full Meals", "With five Side-Dish", "110.00",
  //   //     "assets/images/meals.png",4),
  //   // CartModel("Poori", "With Potato Chutney",  "50.00",
  //   //     "assets/images/poori.png",8),
  //   // CartModel("Paniyaram", "With spicy Chutneyy", "35.00",
  //   //     "assets/images/paniyaram.png",2),
  //   // CartModel("Vada", "Set of Seven",  "50.00", "assets/images/vada.png",3),
  //   // CartModel(
  //   //     "Roti", "With Veg Gravy",  "40.00", "assets/images/roti.png",4),
  // ];
   Provider.of<MyProvider>(context, listen: false).getAllCarts(SPHelper.getString(userId));
   Provider.of<MyProvider>(context, listen: false).getAllFoods();
    // TODO: implement build
    return  Consumer<MyProvider>(
      builder: (context, value, child) {

        List<CartModel>  carts = value.carts;
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
                      child: Text(  "Cart",textAlign: TextAlign.center,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600), )),
                ],
              ),
            ),


           carts.isEmpty?  Expanded(
                        child: Center(
              child: Text('No Carts'),
          ),
           )
      :

     Expanded(
           child: ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (BuildContext context, int index) {
     return animatedContainer(carts[index]);
                          }, 
                          ),
     )
                          
                 
                         

                      


          ]
        )
      )
       );  });
  }





    Widget animatedContainer(CartModel   carts) {
    return OpenContainer(
      
    
      
      transitionDuration: const Duration(milliseconds: 700),
      closedElevation: 0,
      openShape: const RoundedRectangleBorder(),
      
      tappable: false,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return SizedBox(
          child: InkWell(
            onTap: openContainer,
            child:  Dismissible(
                direction: DismissDirection.endToStart,
               
                  
                  key: Key(carts.id),
              background: Container(
                
                

                  margin: const EdgeInsets.all(5.0),
                alignment: Alignment.centerRight,
                
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.grey[200],
              ),
              child: Icon(
                    Icons.delete,
                    color: Colors.amber[300],
                  ),
        ),
              child: CartWidget(cartData: carts,))
          ),
        );



        
      }, 

    openBuilder: (BuildContext context, VoidCallback _) {
   FoodModel foodModel= Provider.of<MyProvider>(context, listen: false).foods.firstWhere((element) => element.id==carts.food_id);
               
               
      return  FoodDetail(foodData: foodModel,);
      
      },
    );
  }


}