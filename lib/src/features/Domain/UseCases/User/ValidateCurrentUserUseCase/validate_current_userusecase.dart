import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/features/Data/Decodables/Auth/UserAuthData/userauth_datause_caserepository.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/UserAuthData/userauthdata_usecase.dart';

import '../../../../../utils/Helpers/ResultType/result_type.dart';

abstract class ValidateCurrentUserUserCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserUseCase extends ValidateCurrentUserUserCase {
  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateCurrentUserUseCase({UserAuthDataUseCase? authDataUseCase})
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
