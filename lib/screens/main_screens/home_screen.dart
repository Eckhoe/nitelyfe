import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nitelyfe/utils/geolocator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GeolocatorService _geolocatorService = new GeolocatorService();
  BitmapDescriptor _mapMarker;
  Geoflutterfire _geo;
  LatLng _initalPosition;
  FirebaseFirestore _firestore;
  Stream<List<DocumentSnapshot>> markerStream;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    getLocation();

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'images/marker.png')
        .then((onValue) {
      _mapMarker = onValue;
    });

    _firestore = _geolocatorService.firestore;
    _geo = Geoflutterfire();
    Query collectionRef = _firestore.collection('locations');
    markerStream = _geo
        .collection(
          collectionRef: collectionRef,
        )
        .within(
            center: _geo.point(latitude: 0, longitude: 0),
            radius: 40075,
            field: 'position',
            strictMode: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Image.asset('images/nite_lyfe_3.png',
            height: 75, width: 125, fit: BoxFit.scaleDown),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initalPosition,
          zoom: 15,
        ),
        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        tiltGesturesEnabled: false,
        mapToolbarEnabled: false,
        rotateGesturesEnabled: false,
        trafficEnabled: false,
        liteModeEnabled: false,
        mapType: MapType.normal,
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      markerStream.listen((List<DocumentSnapshot> documentList) {
        _updateMarkers(documentList);
      });
    });
  }

  void _updateMarkers(List<DocumentSnapshot> documentList) {
    documentList.forEach((DocumentSnapshot document) {
      final GeoPoint point = document.data()['position']['geopoint'];
      _addMarker(point.latitude, point.longitude);
    });
  }

  void _addMarker(double lat, double lng) {
    final id = MarkerId(lat.toString() + lng.toString());
    final _marker = Marker(
      markerId: id,
      position: LatLng(lat, lng),
      icon: _mapMarker,
      onTap: () {},
    );
    setState(() {
      markers[id] = _marker;
    });
  }

  void getLocation() async {
    Position _position = await _geolocatorService.getInitalPositionforCamera();
    setState(() {
      _initalPosition = new LatLng(_position.latitude, _position.longitude);
    });
  }
}
