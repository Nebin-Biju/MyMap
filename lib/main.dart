import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapSample(),
    );
  }
}
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer _controller = Completer();
  static const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(9.915500, 76.963111
      ),
    zoom: 15.1,
  );
  static const CameraPosition kLake = CameraPosition(
    target: LatLng(34.64720664774053, 77.19954005309445
    ),
    zoom: 15.1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: kGooglePlex,
        onMapCreated: (controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton:
      FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the Lake'),
      icon: Icon(Icons.car_crash),),
    );
  }
  Future _goToTheLake()async{
    final GoogleMapController controller= await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }
}


