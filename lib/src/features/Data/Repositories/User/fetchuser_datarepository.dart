import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';
import 'package:foodapp/src/Services/FirebasseServices/RealtimeDatabaseService/Services/realtimedatabase_service.dart';
import 'package:foodapp/src/features/Data/Decodables/User/user_decodable.dart';
import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = "user/";
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  //DEPENDENCIAS
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultFetchUserDataRepository(
      {RealtimeDatabaseService? realtimeDatabaseService})
      : _realtimeDatabaseService =
            realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId}) async {
    try {
      final result = await _realtimeDatabaseService.getData(path: localId);

      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
