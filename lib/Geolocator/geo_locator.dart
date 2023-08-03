import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

class GeoLocator extends StatefulWidget {
  const GeoLocator({super.key, required this.title});
  final String title;

  @override
  State<GeoLocator> createState() => _GeoLocatorState();
}

class _GeoLocatorState extends State<GeoLocator> {
  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geolocator"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              getLocation();
            },
            child: Text("Get Location")),
      ),
    );
  }
}
