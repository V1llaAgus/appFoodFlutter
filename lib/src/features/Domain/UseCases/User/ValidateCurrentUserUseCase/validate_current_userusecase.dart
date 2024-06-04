import '../../../../../Base/ApiService/app_error.dart';
import '../../../../../utils/Helpers/ResultType/result_type.dart';
import '../../../../Data/Decodables/Auth/UserAuthData/userauth_datause_caserepository.dart';
import '../../Auth/UserAuthData/userauthdata_usecase.dart';

abstract class ValidateCurrentUserCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserCase extends ValidateCurrentUserCase {
  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateCurrentUserCase({UserAuthDataUseCase? authDataUseCase})
      : _authDataUseCase = authDataUseCase ?? DefaulUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _authDataUseCase
          .execute(parameters: GetUserDataUseBodyParameters(idToken: idToken))
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            return true;

          case ResultStatus.error:
            return false;
        }
      });
    } on Failure {
      return false;
    }
  }
}
