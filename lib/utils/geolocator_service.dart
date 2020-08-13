import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  final Geolocator geolocator = Geolocator();

  Stream<Position> getCurrentLocation() {
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 2);
    return geolocator.getPositionStream(locationOptions);
  }

  Future<Position> getInitialLocation() {
    return geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}
