import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/sign_in_decodable.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Services/signin_auth_services.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/SignInRepository/signinbody_repository_parameters.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

class DefaultSignInRepository extends SignInRepositorty {
  //Dependencias

  final SignInService _signInService;

  DefaultSignInRepository({SignInService? signInService})
      : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params}) async {
    try {
      final result =
          await _signInService.signIn(bodyParameters: params.toMap());
      SignInDecodable decodable = SignInDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure( Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
