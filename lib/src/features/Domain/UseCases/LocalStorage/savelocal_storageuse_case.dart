import 'package:foodapp/src/features/Data/Repositories/LocalStorage/savelocal_storagerepository.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';

abstract class SaveLocalStorageUseCase {
  Future<void> execute({required SaveLocalStorageParameters parameters});
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {
  //DEPENDENCIAS

  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase(
      {SaveLocalStorageRepository? saveLocalStorageRepository})
      : _saveLocalStorageRepository =
            saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({required SaveLocalStorageParameters parameters}) async {
    _saveLocalStorageRepository.saveInLocalStorage(
        key: parameters.key, value: parameters.value);
  }
}
