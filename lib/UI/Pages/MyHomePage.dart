import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/Models/FoodModel.dart';
import 'package:flutter_food_app/Providers/MyProvider.dart';
import 'package:flutter_food_app/UI/Pages/FoodDetail.dart';
import 'package:flutter_food_app/UI/Pages/my_profile.dart';
import 'package:flutter_food_app/UI/Widgets/FoodWidgets.dart';
import 'package:flutter_food_app/UI/Widgets/drawer.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/BaseAuth.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_food_app/respository/FireStroreData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatelessWidget{

      final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();    
LatLng currentlocation;
   SharedPreferences prefs;

  
   String filter = "";
   

  TextEditingController controller = new TextEditingController();
  


  @override
  Widget build(BuildContext context) {

    getCuruntLocation();
    

//      List<FoodModel> foods = [

 
//     //FoodModel("","","","","","","","","",),
//     FoodModel("","Dosa", "With spicy Chutney",'4.6', "65", "45.75", "assets/images/dosa.png",
//     'This is spicy south india food, prepared with dall, masala and another ingredients',
//     'Rice flour,Urad dal,Salt,Methi','20-30'),
//     FoodModel("","Full Meals", "With five Side-Dish",'3.6', "128", "110.00",
//         "assets/images/meals.png",
//     'This is spicy south india food, prepared with dall, masala and another ingredients',
//     'Rice flour,Urad dal,Salt,Methi','20-30'),
//     FoodModel("","Poori", "With Potato Chutney",'5.0', "78", "50.00",
//         "assets/images/poori.png",
//     'This is spicy south india food, prepared with dall, masala and another ingredients',
//     'Rice flour,Urad dal,Salt,Methi','20-30'),
//     FoodModel("","Paniyaram", "With spicy Chutneyy",'4.6', "43", "35.00",
//         "assets/images/paniyaram.png",
//     'This is spicy south india food, prepared with dall, masala and another ingredients',
//     'Rice flour,Urad dal,Salt,Methi','10-20'),
//     FoodModel("","Vada", "Set of Seven", '4.6',"65", "50.00", "assets/images/vada.png",
//     'This is spicy south india food, prepared with dall, masala and another ingredients',
//     'Rice flour,Urad dal,Salt,Methi','15-30'),
//     FoodModel("", "Roti", "With Veg Gravy",'4.6', "93", "40.00", "assets/images/roti.png",
//     'This is spicy south india food, prepared with dall, masala and another ingredients',
//     'Rice flour,Urad dal,Salt,Methi','30-40'),
//   ];

//    for (var name in foods) {
    
//    FireStroreData.databseFireStore.uploadProduct(name);
// }


 controller.addListener(() {

     if(controller.text.isEmpty){
       filter='';

     }else{
       filter=controller.text;
    }
      Provider.of<MyProvider>(context, listen: false).filteredfoodList(filter);

   
});

  Provider.of<MyProvider>(context, listen: false).getAllFoods();



   

    // TODO: implement build
    return Consumer<MyProvider>(
      builder: (context, value, child) {

     
      
          
     List<FoodModel>  allFoods = value.filteredList.isNotEmpty?value.filteredList:value.foods;
      if(allFoods.isNotEmpty){
      if(allFoods[0].name!=''){
      allFoods.insert(0,  FoodModel("","","","","","","","","",""));
      }}
       
    
    
    return   InnerDrawer(
         key: _innerDrawerKey,
            onTapClose: true, // default false
            swipe: true,
      leftChild: drawer(), // required if rightChild is not set
      rightChild: drawer(), 
  
            
      scaffold:Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 20),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
           GestureDetector(
              onTap: () => _toggle(),
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
                        Icons.sort,
                        size: 18,
                      ),
                    ),
             ),
           ),



                  animated_to_profile() 
                ],
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 250,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Search Food",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 15.0),
                        child: Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                new Container(
                  width: 30.00,
                  height: 30.00,
                  decoration: new BoxDecoration(
                    color: Colors.amber[400],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.filter_list,
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
        
        allFoods.isEmpty?  Center(
            child: Text('No Products'),
          )
      : Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 2,
                      staggeredTileBuilder: (_) => StaggeredTile.fit(1),
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      itemCount: allFoods.length,
                      itemBuilder: (context, index) => index == 0
                          ? 
                           Container(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    'Found   ${allFoods.length-1}  results',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )


                          :  animatedContainer(allFoods[index])),
                    
                          
                ],
              ),
           
           
            )
















           
            
          ],
        ),
      ),
      
    ));
      }
    );
  }



  Widget animatedContainer(foods) {
    return OpenContainer(
    
      transitionDuration: const Duration(milliseconds: 700),
      closedElevation: 0,
      openShape: const RoundedRectangleBorder(),
      
      tappable: false,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return SizedBox(
          child: InkWell(
            onTap: openContainer,
            child: FoodWidgets(foodData: foods),
          ),
        );
      }, 

    openBuilder: (BuildContext context, VoidCallback _) {
        return FoodDetail(
          foodData: foods,
        );
      },
    );
  }

  Widget animated_to_profile() {
    return OpenContainer(
    
      transitionDuration: const Duration(milliseconds: 700),
      closedElevation: 0,
      openShape: const RoundedRectangleBorder(),
      
      tappable: false,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return SizedBox(
          child: InkWell(
            onTap: openContainer,
            child:   Container(
                            width: 30.00,
                            height: 30.00,
                            decoration: new BoxDecoration(
                              color: Colors.amber[600],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: new DecorationImage(
                                image: AssetImage('assets/images/user.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            )),
          ),
        );
      }, 

    openBuilder: (BuildContext context, VoidCallback _) {
        return MyProfile();
      },
    );
  }


   void _toggle()
    {
       _innerDrawerKey.currentState.toggle(
                            
      direction: InnerDrawerDirection.start 
       );
    }



    getCuruntLocation() async {
    prefs = await BaseAuth.baseAuth.instializeSp();
  try{
  Position position= await Geolocator().getCurrentPosition();
  currentlocation=LatLng(position.latitude,position.longitude);
  if(currentlocation!=null){
     prefs.setString(latt,position.latitude.toString());
      prefs.setString(lont,position.longitude.toString());
  }
  
  }catch(error){
    print(error);
  }

}


    

  
}
