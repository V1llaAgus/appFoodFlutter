import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Services/getuser_authdata_service.dart';
import 'package:foodapp/src/features/Data/Decodables/Auth/UserAuthData/userauth_datadecodable.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/UserAuthData/userauth_datarepository_bodyparameters.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {
  //DEPENDENCIAS

  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository({GetUserAuthDataService? getUserAuthDataService})
      : _getUserAuthDataService =
            getUserAuthDataService ?? DefaultGetUserAuthDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters}) async {
    try {
      final result = await _getUserAuthDataService.getUserData(
          bodyparameters: parameters.toMap());
      UserAuthDataDecodable decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
