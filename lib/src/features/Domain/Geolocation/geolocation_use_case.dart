import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';
import 'package:foodapp/src/Services/GeolocationService/Interface/geolocation_serviceinterface.dart';
import 'package:foodapp/src/Services/GeolocationService/Service/geolocation_service_helper.dart';
import 'package:foodapp/src/Services/GeolocationService/Service/mock_geolocation_service.dart';
import 'package:foodapp/src/features/Domain/Geolocation/geolocation_usecase_parameters.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class GeolocationUseCase {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermisionStatus();
  Future<double> getDistanceBetweenYourCurrentPositionAnd(
      Destination destination);
}

class DefaultGeolocationUseCase extends GeolocationUseCase {
  //DEPENDENCIAS

  final GeolocationService _geolocationService;
  final GeolocationHelperService _geolocationHelperService;

  DefaultGeolocationUseCase(
      {GeolocationService? geolocationService,
      GeolocationHelperService? geolocationHelperService})
      : _geolocationService = geolocationService ??
            MockGeolocationService(), //BUENO: DefaultGeoLocationService() Pruebas :MockGeolocationService()
        _geolocationHelperService =
            geolocationHelperService ?? DefaultGeolocationServiceHelper();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<double> getDistanceBetweenYourCurrentPositionAnd(
      Destination destination) async {
    final userPosition = await _geolocationService.getCurrentPosition();
    return _geolocationHelperService.getDistanceBetweenInKilometers(
        userPosition.value?.latitude ?? 0.0,
        userPosition.value?.longitude ?? 0.0,
        destination.destinatioLatitude,
        destination.destinatioLongitude);
  }

  @override
  Future<LocationPermissionStatus> getPermisionStatus() {
    return _geolocationService.getPermissionStatus();
  }
}
