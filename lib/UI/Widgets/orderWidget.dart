import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/SPHelper.dart';
import 'package:provider/provider.dart';


class orderWidget extends StatelessWidget{
final double total;
  orderWidget({this.total});
  var provider;
  @override
  Widget build(BuildContext context) {

          provider=Provider.of<MyProvider>(context, listen: false);
         
  
    // TODO: implement build
   return  Container(
     height:50 ,
              color: Colors.red[900],
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: <Widget>[
                  Center(
                    child: Text( 'TOTAL : \$ ${provider.cart_total}',
                    
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                    ),
                  ),


                  InkWell(
                    onTap: () {

      if(provider.selectedcart.length!=0) {
                      
                   
                   showorderdiloge(context);
      }
                    },
                      child: Container(
                      child: Row(
                        children: [
                          Text( 'ORDER  ',
                          
                            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                          ),

                          Icon(Icons.arrow_forward,color:Color(0xFFFFFFFF) ,)
                        ],
                      ),
                    ),
                  ),

               
                ],
              ),
          
          
        
      );
  }



  void show( BuildContext context) {
   showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)), //this right here
            child: Container(
             
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
             
               
                children: [

                  Container(
                    margin: EdgeInsets.all(10),
                  width: 150.0,
                  height: 150.0,
                 
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/fooddelivery.jpeg")
                      )
                  )),

                Container(
                    margin: EdgeInsets.all(10),
                  child: Text('Thank you !',
                  
                  style: TextStyle(color: Colors.black,fontSize: 28.8),),
                )
                ,
                 Container(
                     margin: EdgeInsets.all(10),
                   child: Text('Your order is successfully.',
                
                style: TextStyle(color: Colors.black,fontSize: 12.5),),
                 ),
                   Container(
                       margin: EdgeInsets.all(10),
                     child: RaisedButton(
                       color:Colors.red[900] ,
                       shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  side: BorderSide(color: Colors.red[900])
),
                  child: Text('OK',
                
                style: TextStyle(color: Colors.white,fontSize: 15),),
                  onPressed: () {
                      Navigator.of(context).pop();
                  },
                ),
                   )
             
                 
                ],
              ),
            ),
          );
        });
  }





  showorderdiloge(BuildContext context){
        showDialog(
      context: context,
    child:  CupertinoAlertDialog(
      title: Text(" Order? "),
      content: Text( "Are you sure you want to Order Selected Items?"),
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
                provider.order();
                provider.getAllCarts(SPHelper.getString(userId), 0);
                   show(context);
            },
          
             child: Text("Order")
          ),
        
        ],
      )
    );
  }

}