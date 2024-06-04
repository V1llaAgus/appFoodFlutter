import 'dart:convert';
import 'dart:io';

import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:http/http.dart' as http;

abstract class _Exeptions {
  static String soketExeptionMessage = "No Internet connection";
  static String httpException = "Clouldn't find the path";
  static String formatException = "Bad response format";
}

abstract class ApiService {
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyparameters,
      required String url,
      Map<String, String>? headers});

  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyparameters,
      required String url,
      Map<String, String>? headers});

  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers});
}

class DefaultApiService extends ApiService {
  @override
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers}) async {
    final _url = Uri.parse(url);

    final response = await http.get(_url, headers: headers);

    try {
      if (response.statusCode.toString().contains('20')) {
        //FUE BIEN LA LLAMADA

        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //TUVO UN ERROR LA LLAMADA
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exeptions.soketExeptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exeptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exeptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyparameters,
      required String url,
      Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final body = json.encode(bodyparameters);
    final response = await http.post(_url, headers: headers, body: body);

    try {
      if (response.statusCode.toString().contains('20')) {
        //FUE BIEN LA LLAMADA

        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //TUVO UN ERROR LA LLAMADA
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exeptions.soketExeptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exeptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exeptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyparameters,
      required String url,
      Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final body = json.encode(bodyparameters);
    final response = await http.put(_url, headers: headers, body: body);

    try {
      if (response.statusCode.toString().contains('20')) {
        //FUE BIEN LA LLAMADA

        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        //TUVO UN ERROR LA LLAMADA
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exeptions.soketExeptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exeptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exeptions.formatException);
    }
  }
}
