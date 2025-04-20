import 'package:flutter/material.dart';
import 'package:route_tracking/views/google_map_view.dart';

void main() {
  runApp(const RouteTrackingApp());
}

class RouteTrackingApp extends StatelessWidget {
  const RouteTrackingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleMapView(),
    );
  }
}
