import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/BodyParameters/update_passworduser_servicebodyparameters.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Interfaces/aut_firebase_interface.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {
  final String _requestType = "PASSWORD_RESET";

  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) {
    final params =
        UpdatePasswordBodyParameters(requestType: _requestType, email: email);
    return apiService.getDataFromPostRequest(
        bodyparameters: params.toMap(), url: endpoint);
  }
}
