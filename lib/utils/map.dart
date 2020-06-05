import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nitelyfe/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'geolocator_service.dart';
import 'package:geolocator/geolocator.dart';

class FireMap extends StatefulWidget {
  final Position initalPosition;

  FireMap(this.initalPosition);

  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  final GeolocatorService _geolocatorService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    _geolocatorService.getCurrentLocation().listen((position) { 
      followUser(position);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.initalPosition.latitude,
                widget.initalPosition.longitude),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: FloatingActionButton(
            child: Icon(Icons.keyboard_arrow_up),
            backgroundColor: kNiteLyfeRed,
            elevation: 10,
            onPressed: null,
            //TODO: add animation which will bring up all of the sub buttons for editing map
          ),
        ),
      ],
    );
  }

  Future<void> followUser(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15
        ),
      ),
    );
  }
}
