import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  double latitude;
  double longitude;

  void requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;

      print('Latitude: $latitude + Longitude: $longitude');
    } catch (e) {
      print(e);
    }
  }
}
