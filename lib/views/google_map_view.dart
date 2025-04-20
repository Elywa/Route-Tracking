import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}
late CameraPosition initialCameraPosition;

class _GoogleMapViewState extends State<GoogleMapView> {
@override
  void initState() {
     initialCameraPosition = const CameraPosition(
    target: LatLng(31.328515984962735, 31.753482313074418), 
    zoom: 15,
  );
  // TODO: implement initState
    super.initState();
  }  
  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}
