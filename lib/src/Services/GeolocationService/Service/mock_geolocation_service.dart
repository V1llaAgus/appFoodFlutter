import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';
import 'package:foodapp/src/Services/GeolocationService/Interface/geolocation_serviceinterface.dart';
import 'package:foodapp/src/Services/GeolocationService/Mappers/geolocation_service_mappers.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';
import 'package:geolocator/geolocator.dart';

class MockGeolocationService extends GeolocationService {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    var fakePosition = const Position(
        longitude: 2.169188,
        latitude: 41.386400,
        timestamp: null,
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0);

    return Result.success(GeolocationServiceMapper.mapPosition(fakePosition));
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return LocationPermissionStatus.denied;
  }
}
