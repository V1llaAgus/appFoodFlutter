import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class GeolocationService {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class GeolocationHelperService {
  double getDistanceBetweenInMetters(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude);

  double getDistanceBetweenInKilometers(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude);
}
