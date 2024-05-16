import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/Services/FirebasseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:foodapp/src/Services/FirebasseServices/RealtimeDatabaseService/Services/realtimedatabase_service.dart';
import 'package:foodapp/src/features/Data/Decodables/User/user_decodable.dart';
import 'package:foodapp/src/features/Data/Repositories/User/userbody_parameters.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  // * Dependencies
  final RealtimeDatabaseService _realtimeDataBaseService;

  DefaultSaveUserDataRepository(
      {RealtimeDatabaseService? realtimeDataBaseService})
      : _realtimeDataBaseService =
            realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters params}) async {
    if (params.localId == null) {
      return Result.failure(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }

    var path = _Paths.userCollection + params.localId!;

    try {
      final result = await _realtimeDataBaseService.putData(
          bodyParamaters: params.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
