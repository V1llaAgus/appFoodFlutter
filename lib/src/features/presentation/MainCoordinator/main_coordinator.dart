import 'package:foodapp/src/Base/Constants/local_storage_keys.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/fetchlocal_storageuse_case.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/User/ValidateCurrentUserUseCase/validate_current_userusecase.dart';

class RoutePath {
  static String walcomePath = "welcome";
  static String tabsPath = "Tabs";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUserCase _validateCurrentUserCase;

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateCurrentUserUserCase? validateCurrentUserCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase =
            validateCurrentUserCase ?? DefaultValidateCurrentUserUseCase();

  Future<String?> start() {
    return _isUserLogged().then((value) {
      return value == null ? RoutePath.walcomePath : RoutePath.tabsPath;
    });
  }

  Future<String?> _isUserLogged() async {
    var idToken = await _fetchLocalStorageUseCase.execute(
        parameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));

    //REVISAR SI EL USUARIO ESTA GUARDADO
    if (idToken == null) {
      return null;
    }

    //Hay un token guardado en la app y vamos a comprobar que el usuario exista aun en firebase

    var isUserValid = await _validateCurrentUserCase.execute(idToken: idToken);

    if (isUserValid) {
      return idToken;
    } else {
      return null;
    }
  }
}
