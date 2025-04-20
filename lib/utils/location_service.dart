import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  // Get Location Methods

  // First Method to check if location service is enabled or not

  Future<void> checkAndRequestLocationService() async {
    var isEnabled = await location.serviceEnabled();
    if (!isEnabled) {
      isEnabled = await location.requestService();
      if (!isEnabled) {
        // Show a dialog or a snackbar to inform the user that location services are disabled
        throw LocationServiceException(
          "Location services are disabled. Please enable them in settings.",
        );
      }
    }
  }

  // Second Method to check if location permission is granted or not

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException(
        "Location permission is permanently denied. Please enable it in settings.",
      );
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // Show a dialog or a snackbar to inform the user that location permission is denied
        throw LocationPermissionException(
          "Location permission is denied. Please enable it in settings.",
        );
      }
    }
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.changeSettings(distanceFilter: 2);
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);
}

class LocationPermissionException implements Exception {
  final String message;
  LocationPermissionException(this.message);
}
