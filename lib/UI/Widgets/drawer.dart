import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/UI/Pages/Cart.dart';
import 'package:flutter_food_app/UI/Pages/Favorites.dart';
import 'package:flutter_food_app/UI/Pages/welcome.dart';
import 'package:flutter_food_app/UI/Widgets/SharedPreferencesBuilder.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/BaseAuth.dart';
import 'package:flutter_food_app/respository/SPHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class drawer extends StatelessWidget{
    double _dragUpdate = 0;



  @override
  Widget build(BuildContext context) {

   
    
    // TODO: implement build
    return  Material(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 15,top: 20),
                      width: 80,
                      child: ClipRRect(
                        child: Image.network(
                          "https://img.icons8.com/officel/2x/user.png",
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                   Text(SPHelper.getString(spUserEmail),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                  ],
                  //mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                 
                  child: ListView(
                    
                    
                    children: <Widget>[
                              ListTile(
                          
                      
                      onTap: () => print("Dashboard"),
                      title: Text(
                        "Menu",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      leading: Icon(
                        Icons.restaurant_menu,
                        color:  Colors.black,
                        size: 22,
                      ),
                    ),
             
                  ListTile(

                    title: Text(
                      "Maps",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Icon(
                      Icons.zoom_out_map,
                      size: 22,
                    ),
                  ),
                  ListTile(
                    onTap: (){
                       Navigator.pop(context);
                      Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (BuildContext context) => Favorites(),
                  ),
                );
                    },
                    title: Text(
                      "Favorite",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Icon(
                      Icons.favorite_border,
                      size: 22,
                    ),
                  ),
                  ListTile(
                     onTap: () {
                        Navigator.pop(context);
                       
                        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Cart(),
                  ),
                );
                     },
                    title: Text(
                      "Cart",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Icon(
                      Icons.shopping_cart,
                      size: 22,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Share",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Icon(
                      Icons.share,
                      size: 22,
                    ),
                  ),

               ]
               
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {

      showDialog(
      context: context,
    child:  CupertinoAlertDialog(
      title: Text("Log out?"),
      content: Text( "Are you sure you want to log out?"),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancel")
        ),
          CupertinoDialogAction(
          textStyle: TextStyle(color: Colors.red),
            isDefaultAction: true,
            onPressed: ()  {
              Navigator.pop(context);
                  if(BaseAuth.baseAuth.signOut()!=null){
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomePage()), (Route<dynamic> route) => false);

                }
            },
          
             child: Text("Log out")
          ),
        
        ],
      )
    );


            
              },
                          child: Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.call_missed_outgoing,
                      size: 18,
                      color: Colors.grey,
                    ),
                    Text(
                      " LogOut",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
          
      ),
      
      )
      
      
      ;
  }




}