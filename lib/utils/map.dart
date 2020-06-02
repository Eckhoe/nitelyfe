import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(43, -80),
            zoom: 10,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
        ),
      ],
    );
  }
}
