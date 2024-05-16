import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/updatepassword_decodable.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Services/updatepassword_user_services.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {
  //Dependencias

  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository(
      {UpdatePasswordUserService? updatePasswordUserService})
      : _updatePasswordUserService =
            updatePasswordUserService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email}) async {
    try {
      final result =
          await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable decodable =
          UpdatePasswordDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
