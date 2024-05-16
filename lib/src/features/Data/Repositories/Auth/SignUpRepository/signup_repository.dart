import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/sign_up_decodable.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Services/signup_auth_services.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/SignUpRepository/signup_repositoryparameters.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

class DefaultSignUpRepository extends SignUpRepository {
  //DEPENDENCIAS
  final SignUpService _signUpService;

  DefaultSignUpRepository({SignUpService? signUpService})
      : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters params}) async {
    try {
      final result =
          await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
