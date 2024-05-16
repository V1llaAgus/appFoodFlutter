import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService {
  @override
  Future<Map<String, dynamic>> getUserData(
      {required Map<String, dynamic> bodyparameters}) {
    return apiService.getDataFromPostRequest(
        bodyparameters: bodyparameters, url: endpoint);
  }

  

}
