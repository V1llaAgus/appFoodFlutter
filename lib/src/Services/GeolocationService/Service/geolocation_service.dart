import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';
import 'package:foodapp/src/Services/GeolocationService/Interface/geolocation_serviceinterface.dart';
import 'package:foodapp/src/Services/GeolocationService/Mappers/geolocation_service_mappers.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeoLocationFailureMessages {
  //Error Mensajes

  static String locationServicesDisable = "Location services are disable.";
  static String locationPersmissionDenied = "Location permissions are denied";
  static String locationPermissionDeniedForever =
      "Location permissions are permantyle denied, we cannot request permissions.";
}

class DefaultGeoLocationService extends GeolocationService {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    return await _determinePosition().then((position) {
      return Result.success(GeolocationServiceMapper.mapPosition(position));
    }, onError: (e) {
      return Result.failure(Failure.fromMessage(message: e.toString()));
    });
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        return LocationPermissionStatus.denied;

      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;

      case LocationPermission.whileInUse:
        return LocationPermissionStatus.allowed;

      case LocationPermission.always:
        return LocationPermissionStatus.allowed;

      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.denied;
    }
  }
}

//Metodos del plugins
extension PrivateMethods on DefaultGeoLocationService {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(GeoLocationFailureMessages.locationServicesDisable);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(
            GeoLocationFailureMessages.locationPersmissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          GeoLocationFailureMessages.locationPermissionDeniedForever);
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
