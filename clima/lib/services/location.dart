import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitute;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 5));
      this.latitude = position.latitude;
      this.longitute = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
