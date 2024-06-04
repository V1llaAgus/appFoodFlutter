// AUTH REPOSITORIES

import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/sign_in_decodable.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/sign_up_decodable.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/updatepassword_decodable.dart';
import 'package:foodapp/src/features/Data/Decodables/Auth/UserAuthData/userauth_datadecodable.dart';
import 'package:foodapp/src/features/Data/Decodables/User/user_decodable.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/SignInRepository/signinbody_repository_parameters.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/SignUpRepository/signup_repositoryparameters.dart';
import 'package:foodapp/src/features/Data/Repositories/Auth/UserAuthData/userauth_datarepository_bodyparameters.dart';
import 'package:foodapp/src/features/Data/Repositories/User/userbody_parameters.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

// User Repositories
abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters params});
}

abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params});
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email});
}

abstract class UserAuthDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters});
}

// User Data Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters params});
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId});
}

// LOCAL STORAGE

abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({required String key, required String value});
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({required String key});
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}
