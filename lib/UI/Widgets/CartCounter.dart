
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget{
  var qty;
  bool iscart;
  String cart_id;
  CartCounter({this.qty,this.iscart,this.cart_id});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return CartCounterState(qty: qty,iscart: iscart, cart_id: cart_id);
  }
}

class CartCounterState extends State<CartCounter>{
   var qty ;
    bool iscart;
  String cart_id;

   CartCounterState({this.qty,this.iscart,this.cart_id});

   
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
                          if(iscart){ FireStroreData.databseFireStore.updateitemCartquntity(cart_id,qty);
}
                            
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
                          if(iscart){ FireStroreData.databseFireStore.updateitemCartquntity(cart_id,qty);
}

                           
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