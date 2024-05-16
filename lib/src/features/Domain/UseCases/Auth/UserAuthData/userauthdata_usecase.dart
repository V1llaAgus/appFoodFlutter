import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/features/Data/Decodables/Auth/UserAuthData/userauth_datause_caserepository.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/UserAuthData/userauth_datarepository.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/UserAuthData/userauth_datarepository_bodyparameters.dart';
import 'package:foodapp/src/features/Domain/Entities/Auth/UserAuthData/userauth_data_entity.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class UserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseBodyParameters parameters});
}

class DefaulUserAuthDataUseCase extends UserAuthDataUseCase {
  //DEPENDENCIAS

  final UserAuthDataRepository _userAuthDataRepository;

  DefaulUserAuthDataUseCase({UserAuthDataRepository? userAuthDataRepository})
      : _userAuthDataRepository =
            userAuthDataRepository ?? DefaultUserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({required parameters}) {
    return _userAuthDataRepository
        .getUserAuthData(
            parameters: GetUserDataBodyParameters(idToken: parameters.idToken))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(
              UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
