import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'geolocator_service.dart';
import 'package:nitelyfe/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FireMap extends StatefulWidget {
  final Position initalPosition;
  FireMap(this.initalPosition);

  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  final _firestore = Firestore.instance;
  final GeolocatorService _geolocatorService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();
  Geoflutterfire geo = Geoflutterfire();
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  BitmapDescriptor customMarker;
  String query;

  @override
  void initState() {
    createMarker();
    _geolocatorService.getCurrentLocation().listen((position) {
      followUser(position);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('markers').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData ||
                GeolocatorService().getCurrentLocation() == null)
              return Center(
                child: SpinKitWave(
                  size: 48,
                  color: Colors.black38,
                ),
              );
            else {
              final markers = snapshot.data.documents;
              for (var marker in markers) {
                MarkerId addressName = MarkerId(marker.data['address_name']);
                GeoPoint coordinates = marker.data['position']['geopoint'];
                final Marker mark = Marker(
                  markerId: addressName,
                  position: LatLng(coordinates.latitude, coordinates.longitude),
                  icon: customMarker,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                      height: 150,
                    ),
                  ),
                );
                _markers[addressName] = mark;
              }
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.initalPosition.latitude,
                    widget.initalPosition.longitude),
                zoom: 17.5,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              mapToolbarEnabled: false,
              compassEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              markers: Set<Marker>.of(_markers
                  .values), //call method to load all the markers within a set distance of the user
            );
          },
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: kNiteLyfeRed,
            elevation: 10,
            onPressed: () => showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        child: TextField(
                          onChanged: (value) {
                            query = value;
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        left: 4,
                        right: 4,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(56, 0, 56, 0),
                          child: FloatingActionButton(
                            child: Text(
                              "Let's Party",
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 20),
                            ),
                            backgroundColor: kNiteLyfeRed,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () => addMarker(query),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
            target: LatLng(position.latitude, position.longitude), zoom: 15),
      ),
    );
  }

  Future<void> addMarker(String query) async {
    var address = await Geocoder.local.findAddressesFromQuery(query);
    GeoFirePoint point = geo.point(
        latitude: address.first.coordinates.latitude,
        longitude: address.first.coordinates.longitude);
    _firestore
        .collection('markers')
        .add({'address_name': query, 'position': point.data});
  }

  Future<Uint8List> getByteFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  createMarker() async {
    final Uint8List markerIcon =
        await getByteFromAsset('images/marker.png', 75);
    customMarker = BitmapDescriptor.fromBytes(markerIcon);
  }
}
