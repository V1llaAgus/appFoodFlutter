import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';

class DefaultSignUpService extends SignUpService {
  @override
  Future<Map<String, dynamic>> signUp(
      {required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(
        bodyparameters: bodyParameters, url: endpoint);
  }
}
