import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gps/gps.dart';

class MyLocationWidget extends StatefulWidget {
  @override
  _MyLocationWidgetState createState() => _MyLocationWidgetState();
}

class _MyLocationWidgetState extends State<MyLocationWidget> {
  LocationService locationService = LocationService();
  Position? currentLocation;


  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds:1), (timer) {
      getLocation();
    });

  }



  void getLocation() async {
    try {
      Position position = await locationService.getLocation();
      setState(() {
        currentLocation = position;
        if(position.latitude.toInt()==28){
          print("Notifys");
        }
      });
    } catch (e) {
      // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: currentLocation != null
          ? Text(
        'Latitude: ${currentLocation!.latitude}\nLongitude: ${currentLocation!.longitude}',
        style: TextStyle(fontSize: 16),
      )
          : CircularProgressIndicator(),
    );
  }
}
