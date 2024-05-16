import 'package:foodapp/src/Base/Constants/local_storage_keys.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/removelocal_storageuse_case.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaulSignOutUseCase extends SignOutUseCase {
  //Dependencias

  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaulSignOutUseCase({RemoveLocalStorageUseCase? removeLocalStorageUseCase})
      : _removeLocalStorageUseCase =
            removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() {
    return _removeLocalStorageUseCase.execute(
        parameters:
            RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}
