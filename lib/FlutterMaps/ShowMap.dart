import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  const ShowSimpleMap({super.key});

  @override
  State<ShowSimpleMap> createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  static LatLng _center = const LatLng(47.0465, 21.9189);
  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
        centerTitle: true,
      ),
      body: GoogleMap(
          mapType: MapType.hybrid,
          markers: {oradeaMarker},
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToIntel,
        label: Text("Lotus Oradea!"),
        icon: Icon(Icons.place),
      ),
    );
  }

  static final CameraPosition intelPosition =
      CameraPosition(target: LatLng(47.0359, 21.9489), zoom: 14);

  Future<void> _goToIntel() async {
    final GoogleMapController? controller = await mapController;

    controller!.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }

  Marker oradeaMarker = Marker(
      markerId: const MarkerId("Oradea"),
      position: _center,
      infoWindow:
          const InfoWindow(title: "Oradea", snippet: "This is a great Town"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan));
}
