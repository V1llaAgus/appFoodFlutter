import 'package:foodapp/src/features/Domain/UseCases/LocalStorage/local_storageuse_caseparameters.dart';

import '../../../Data/Repositories/LocalStorage/fetchlocal_storage_repository.dart';

abstract class FetchLocalStorageUseCase {
  Future<String?> execute(
      {required FetchLocalStorageParameters fetchLocalParameteres});
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {
  // * Dependencies
  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase(
      {FetchLocalStorageRepository? fetchLocalStorageRepository})
      : _fetchLocalStorageRepository =
            fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute(
      {required FetchLocalStorageParameters fetchLocalParameteres}) async {
    return await _fetchLocalStorageRepository.fetchInLocalStorage(
        key: fetchLocalParameteres.key);
  }
}
