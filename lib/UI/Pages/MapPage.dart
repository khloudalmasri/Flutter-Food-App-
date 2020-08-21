import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/constants.dart';
import 'package:flutter_food_app/respository/SPHelper.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MapPageState();
  }

}


class MapPageState extends State<MapPage>{

   

  Completer<GoogleMapController> _controller = Completer();
// this set will hold my markers
Set<Marker> _markers = {};
// this will hold the generated polylines
Set<Polyline> _polylines = {};
// this will hold each polyline coordinate as Lat and Lng pairs
List<LatLng> polylineCoordinates = [];
// this is the key object - the PolylinePoints
// which generates every polyline between start and finish
PolylinePoints polylinePoints = PolylinePoints();
String googleAPIKey = "AIzaSyAmtrAH8F-XPYDaLviU6aJlNH9mHQSfdnA";
// for my custom icons
BitmapDescriptor sourceIcon;
BitmapDescriptor destinationIcon;

   GoogleMapController mapController;

  


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }



Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
   CameraPosition initialLocation = CameraPosition(
      zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: SOURCE_LOCATION
   );
   return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      tiltGesturesEnabled: false,
      markers: _markers,
      polylines: _polylines,
      mapType: MapType.normal,
      initialCameraPosition: initialLocation,
      onMapCreated: onMapCreated
   );
  }

void onMapCreated(GoogleMapController controller) {
   _controller.complete(controller);
   setMapPins();
   setPolylines();
}


setPolylines() async {


 

 PolylineResult result = await
      polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
       PointLatLng( SOURCE_LOCATION.latitude,  SOURCE_LOCATION.longitude),
       PointLatLng(DEST_LOCATION.latitude,DEST_LOCATION.longitude)
        );
   if(result.points.isNotEmpty){





   if(result.points.isNotEmpty){
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.points.forEach((PointLatLng point){
         polylineCoordinates.add(
            LatLng(point.latitude, point.longitude));
      });
   }
   setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
         polylineId: PolylineId('poly'),
         color: Color.fromARGB(255, 40, 122, 198),
         points: polylineCoordinates
      );
 
      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
}
}





void setMapPins() {
   setState(() {
      // source pin
      _markers.add(Marker(
         markerId: MarkerId('sourcePin'),
         position: SOURCE_LOCATION,
         icon: sourceIcon
      ));
      // destination pin
      _markers.add(Marker(
         markerId: MarkerId('destPin'),
         position: DEST_LOCATION,
         icon: destinationIcon
      ));
   });
}

  @override
void initState() {
   super.initState();
   setSourceAndDestinationIcons();
}
void setSourceAndDestinationIcons() async {
   sourceIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/driving_pin.png');
   destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/destination_map_marker.png');
}



 


 
}