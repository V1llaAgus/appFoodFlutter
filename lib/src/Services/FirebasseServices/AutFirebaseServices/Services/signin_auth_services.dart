import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';

class DefaultSignInService extends SignInService {
  @override
  Future<Map<String, dynamic>> signIn(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPutRequest(
        bodyparameters: bodyParameters, url: endpoint);
  }
}

