import 'package:foodapp/src/Base/ApiService/api_service.dart';
import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Services/FirebasseServices/RealtimeDatabaseService/Interfaces/interfaces.dart';

class DefaultRealtimeDatabaseService extends RealtimeDatabaseService {
  final ApiService _apiService;

  // Constructor
  DefaultRealtimeDatabaseService({ApiService? apiService})
      : _apiService = apiService ?? DefaultApiService();

  // Método para obtener datos
  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  // Método para enviar datos
  @override
  Future<Map<String, dynamic>> postData(
      {required Map<String, dynamic> bodyParamaters,
      required String path}) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromPostRequest(
          bodyparameters: bodyParamaters, url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }

  // Método para actualizar datos
  @override
  Future<Map<String, dynamic>> putData(
      {required Map<String, dynamic> bodyParamaters,
      required String path}) async {
    var endpoint = baseUrl + path + endUrl;

    try {
      final result = await _apiService.getDataFromPutRequest(
          bodyparameters: bodyParamaters, url: endpoint);
      return result;
    } on Failure catch (f) {
      return f.error;
    }
  }
}
