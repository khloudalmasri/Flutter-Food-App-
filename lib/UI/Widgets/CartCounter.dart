
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget{
  var qty;
  CartCounter({this.qty});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return CartCounterState(qty: qty);
  }
}

class CartCounterState extends State<CartCounter>{
   var qty ;
   CartCounterState({this.qty});

   
  @override
  Widget build(BuildContext context) {

     var provider=Provider.of<MyProvider>(context, listen: false);
     
     
    if(qty==null){
      qty=1;
   
    }

      provider.setCart_counter(qty);
    // TODO: implement build
   return  Center(
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29.0),
                    color: Colors.amber[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber[300],
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (qty > 1) {
                            setState(() {
                              qty = qty - 1;
                             provider.setCart_counter(qty);

                            
                            });
                          }
                        },
                        child: Text(
                          " - ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                      ),
                      Text(
                        qty.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                          setState(() {
                            qty = qty + 1;
                          
                            
                           provider.setCart_counter(qty);
                           
                          });
                        },
                        child: Text(
                          " + ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
   );
  
  }


 

}