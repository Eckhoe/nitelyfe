import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GeolocatorService {
  final geo = Geoflutterfire();
  final firestore = FirebaseFirestore.instance;

  Future<Position> getInitalPositionforCamera() async {
    Position position = new Position();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return position;
  }

  Future addMarkerFromQuery(String query) async {
    GeoFirePoint newLocation;
    var address = await Geocoder.local.findAddressesFromQuery(
        query); //gets the coordinates from address input
    var lng = address.first.coordinates.longitude;
    var lat = address.first.coordinates.latitude;
    newLocation = geo.point(latitude: lat, longitude: lng);
    //this adds to the firestore database, but we need to check if the address
    //is already  in the data base so the we dont add multiple times.
    firestore
        .collection('locations')
        .add({'name': address.first.addressLine, 'position': newLocation.data});
  }
}
