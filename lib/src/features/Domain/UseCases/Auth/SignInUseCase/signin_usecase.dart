import 'package:foodapp/src/features/Domain/UseCases/Auth/SignInUseCase/signin_usecase_bodyparameters.dart';

import '../../../../../Base/ApiService/app_error.dart';
import '../../../../../Base/Constants/error_message.dart';
import '../../../../../utils/Helpers/ResultType/result_type.dart';
import '../../../../Data/Repositories/Auth/SignInRepository/signinbody_repository_parameters.dart';
import '../../../../Data/Repositories/Auth/SignInRepository/sinin_repository.dart';
import '../../../Entities/Auth/SignInEntity/signin_entity.dart';
import '../../../Interfaces/interfaces.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseParameters params});
}

class DefaultSignInUseCase extends SignInUseCase {
  //Dependencias
  final SignInRepository _signInRepositorty;

  DefaultSignInUseCase({SignInRepository? signInRepositorty})
      : _signInRepositorty = signInRepositorty ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute(
      {required SignInUseCaseParameters params}) {
    return _signInRepositorty
        .signIn(
            params: SignInBodyParameters(
                email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessages.unExpectedErrorMessage));
          }
          var entity = SignInEntity.fromMap(result.value!.toMap());

          return Result.success(entity);

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
