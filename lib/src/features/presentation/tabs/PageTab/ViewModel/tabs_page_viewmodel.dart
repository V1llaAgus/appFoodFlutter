import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/GeolocationService/Entities/geolocation_service_entities.dart';
import 'package:foodapp/src/features/Domain/Geolocation/geolocation_use_case.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

import '../../../../../Base/Views/base_view.dart';

abstract class TabsPageViewModelInput {
  Future<Result<bool, Failure>> getCurrenPosition();
  Future<LocationPermissionStatus> getPermisionStatus();
}

abstract class TabsPageViewModel extends TabsPageViewModelInput
    with BaseViewModel {}

class DefaultTabsPageViewModel extends TabsPageViewModel {
  //DEPENDENCIAS

  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsPageViewModel({GeolocationUseCase? geolocationUseCase})
      : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  Future<Result<bool, Failure>> getCurrenPosition() async {
    return await _geolocationUseCase.getCurrentPosition().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<LocationPermissionStatus> getPermisionStatus() {
    return _geolocationUseCase.getPermisionStatus();
  }
}
