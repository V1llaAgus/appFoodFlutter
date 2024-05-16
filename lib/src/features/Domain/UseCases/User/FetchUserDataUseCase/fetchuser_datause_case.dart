import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/features/Data/Repositories/User/fetchuser_datarepository.dart';
import 'package:foodapp/src/features/Domain/Entities/User/user_entity.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class FetchUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {
  //DEPENDENCIAS

  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase(
      {FetchUserDataRepository? fetchUserDataRepository})
      : _fetchUserDataRepository =
            fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({required String localId}) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
