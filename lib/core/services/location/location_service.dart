import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      throw Exception('Location service is disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();

      throw Exception('Location permission permanently denied');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  double calculateDistance(
    double userLatitude,
    double userLongitude,
    double doctorLatitude,
    double doctorLongitude,
  ) {
    return Geolocator.distanceBetween(
      userLatitude,
      userLongitude,
      doctorLatitude,
      doctorLongitude,
    );
  }
}
