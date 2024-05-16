import 'package:foodapp/src/features/Data/Repositories/LocalStorage/removelocal_storagerepository.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({required RemoveLocalStorageParameters parameters});
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {
  //DEPENDENCIAS

  final RemoveLocalStorageRepository _removeLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase(
      {RemoveLocalStorageRepository? removeLocalStorageRepository})
      : _removeLocalStorageRepository = removeLocalStorageRepository ??
            DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute(
      {required RemoveLocalStorageParameters parameters}) async {
    return await _removeLocalStorageRepository.removeInLocalStorage(
        key: parameters.key);
  }
}
