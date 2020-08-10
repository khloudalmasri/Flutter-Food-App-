import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/Models/FavoritModel.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/UI/Pages/Cart.dart';
import 'package:flutter_food_app/UI/Pages/my_profile.dart';
import 'package:flutter_food_app/UI/Widgets/CartCounter.dart';
import 'package:flutter_food_app/UI/Widgets/food_rating.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';
import 'package:flutter_food_app/respository/FoodsClient.dart';
import 'package:flutter_food_app/respository/SPHelper.dart';
import 'package:flutter_food_app/styles/grey_text_style.dart';
import 'package:provider/provider.dart';


class FoodDetail extends StatefulWidget {
  final FoodModel foodData;
  FoodDetail({@required this.foodData});
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  var qty = 1;

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
   bool isfound=false;
   String fav_id;
   

   


  @override
  Widget build(BuildContext context) {

 
   

    List<String> ingredients= widget.foodData.ingredients.split(',').toList();
    const double _fabDimension = 56.0;


    check_found().then((value){
      if(value!=null){
      fav_id=value;
       isfound=true;
      }
  
       }) ;

     

       

   
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Card(
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

                
                 GestureDetector(
                   onTap: () {
                     if(!isfound){
                     
                      
                     FavoritModel favoritModel=FavoritModel('',SPHelper.getString(userId), widget.foodData.id, widget.foodData.name, widget.foodData.description, widget.foodData.image);
                     FireStroreData.databseFireStore.addToFavorit(favoritModel).then((value){
                       fav_id=value;
                       });
                        isfound=true;
                    
                     }else{
                       FireStroreData.databseFireStore.deleteFavorit(fav_id);
                        isfound=false;
                       fav_id='';
                         }

                     setState(() {  });


                    
                   },
                                    child: Card(
                     color: isfound ?Colors.white:Colors.red,
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
                        color: isfound ? Colors.red:Colors.white,
                      ),
    ),),
                 )
                ],
              ),
              Center(
                child: Container(
                  height: 220,
                  child: Image.network(widget.foodData.image),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              CartCounter()  ,
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.foodData.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "₹",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber),
                      ),
                      Text(
                        widget.foodData.price,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FoodInfo("assets/images/star.png", widget.foodData.rating),
                  FoodInfo("assets/images/cal.png",
                      widget.foodData.cal + " Calories"),
                  FoodInfo("assets/images/time.png", "${widget.foodData.timing}  Min"),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.foodData.details,
                style: GreyText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for(var s in ingredients)
                       Text(">  $s", style: GreyText),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:  OpenContainer(
          transitionType: _transitionType,
          transitionDuration: const Duration(milliseconds: 500),
         
          closedElevation: 6.0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
      Radius.circular(_fabDimension / 2),
            ),
          ),
          closedColor: Colors.amber[300],
          openShape: const RoundedRectangleBorder(),
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return  SizedBox(
      height: _fabDimension,
      width: _fabDimension,
      child: Center(
        child: Icon(
             Icons.shopping_cart,
             color: Colors.black,
        ),
      ),
                 );
          }, 
          
       
        
         openBuilder:(context, action) {
            
         
         
            
          //  CartModel cartModel=CartModel('', SPHelper.getString(userId), widget.foodData.id, 'time', 0, widget.foodData.name, widget.foodData.description, widget.foodData.price, widget.foodData.image,   Provider.of<MyProvider>(context, listen: false).cart_counter);
          // FireStroreData.databseFireStore.addToCart(cartModel);
           return Cart();
         },
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }


   Future<String> check_found() async {
     String id=await FireStroreData.databseFireStore.foundInFavorit(SPHelper.getString(userId),widget.foodData.id);
     
     
   return id;

  }
}
