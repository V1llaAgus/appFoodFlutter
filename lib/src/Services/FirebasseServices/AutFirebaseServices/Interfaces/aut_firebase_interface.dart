import 'package:foodapp/src/Base/ApiService/api_service.dart';

abstract class BaseFirebaseService {
  ApiService apiService = DefaultApiService();
  static String baseUrl = "https://identitytoolkit.googleapis.com/v1/";

  static String signUpEndpoint = "accounts:signUp?key=";
  static String signInEndpoint = "accounts:signInWithPassword?key=";
  static String updatePasswordEndpoint = "accounts:signInWithPassword?key=";
  static String getUserDatadEndpoint = "accounts:lookup?key=";
  static String adminToken = "AIzaSyCDyxmWT2IhZ16_j5TY3UF88-P-Ple70Fw";
}

abstract class SignUpService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signUpEndpoint +
      BaseFirebaseService.adminToken;

  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters});
}

abstract class SignInService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.signInEndpoint +
      BaseFirebaseService.adminToken;

  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters});
}

abstract class UpdatePasswordUserService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.updatePasswordEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> updatePassword({required String email});
}

abstract class GetUserAuthDataService extends BaseFirebaseService {
  String endpoint = BaseFirebaseService.baseUrl +
      BaseFirebaseService.getUserDatadEndpoint +
      BaseFirebaseService.adminToken;
  Future<Map<String, dynamic>> getUserData(
      {required Map<String, dynamic> bodyparameters});
}
