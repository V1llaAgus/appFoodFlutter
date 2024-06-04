import 'package:foodapp/src/Services/GeolocationService/Interface/geolocation_serviceinterface.dart';
import 'package:geolocator/geolocator.dart';

class DefaultGeolocationServiceHelper extends GeolocationHelperService {
  @override
  double getDistanceBetweenInKilometers(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    return Geolocator.distanceBetween(startLatitude, startLongitude,
            destinationLatitude, destinationLongitude) /
        1000;
  }

  @override
  double getDistanceBetweenInMetters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude) {
    return Geolocator.distanceBetween(startLatitude, startLongitude,
        destinationLatitude, destinationLongitude);
  }
}
