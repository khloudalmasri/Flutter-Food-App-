
import 'package:flutter/material.dart';
import 'package:flutter_food_app/Models/CartModel.dart';
import 'package:flutter_food_app/UI/Widgets/CartCounter.dart';

class CartWidget extends StatelessWidget{
  final CartModel cartData;
  CartWidget({@required this.cartData});
  @override
  Widget build(BuildContext context) {
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
                child: Image.network(cartData.image),
              ),

          Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
             
              Text(
                cartData.name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                 margin: EdgeInsets.only(top: 10),
                child: Text(
                  cartData.description,
                  style: TextStyle(
                      fontSize: 14, color: Colors.grey[600]),
                ),
              ),
             Row(
                 children: <Widget>[
             

              Container(
                
            margin: EdgeInsets.only(right: 10,top: 10),
                child: CartCounter(qty: cartData.quantity,)) ,
            
                  Container(
                     margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "₹",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber),
                        ),
                        Text(cartData.price,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),


            ],


            
          ),
        ],
      ),
    );
  }
}