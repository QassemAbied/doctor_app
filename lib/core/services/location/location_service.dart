import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
   Future<Position> getCurrentUserLocation() async {
    final permission = await Permission.location.request();
    if (permission.isDenied) {
      throw Exception('Location permission denied');
    }
    if (permission.isPermanentlyDenied) {
      await openAppSettings();

      throw Exception('Location permanently denied');
    }
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('Location service disabled');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  double calculateDistance(
      double userLatitude,
      double userLongitude,
      double doctorLatitude,
      double doctorLongitude)
  {
     return Geolocator.distanceBetween(
       userLatitude,
       userLongitude,
       doctorLatitude,
       doctorLongitude,
     );
  }
}

