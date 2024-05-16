import 'package:foodapp/src/features/Data/Repositories/LocalStorage/fetchlocal_storagerepository.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute({required FetchLocalStorageParameters parameters});
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {
  //DEPENDENCIAS

  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase(
      {FetchLocalStorageRepository? fetchLocalStorageRepository})
      : _fetchLocalStorageRepository =
            fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute(
      {required FetchLocalStorageParameters parameters}) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(
        key: parameters.key);
  }
}
